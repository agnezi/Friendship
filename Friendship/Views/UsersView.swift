////
// Friendship
// Created by: itsjagnezi on 07/11/22
// Copyright (c) today and beyond
//

import SwiftUI


struct UsersView: View {
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var cachedUsers: FetchedResults<CachedUser>
	
	@State private var users = [User]()
	
	
	var body: some View {
		NavigationView {
			
			List(cachedUsers) { user in
				HStack {
					NavigationLink(destination: UserView(user: user)) {
						Text(user.wrappedName)
							.foregroundColor(user.isActive ? .green : .gray)
					}
				}
			}
			.navigationTitle("Users")
			.task {
				
				if users.isEmpty {
					await loadData()
					print("Get data from API")
				}
			}
		}
	}
	
	func loadData() async {
		guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
			print("Invalid URL")
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601
			
			
			if let decodedResponse = try? decoder.decode([User].self, from: data) {
				users = decodedResponse
				
				Task {
					await MainActor.run {
						cacheDataOnCoreData(usersFromApi: decodedResponse)
					}
				}
				
			}
		} catch {
			print("Invalid data")
		}
	}
	
	
	func cacheDataOnCoreData(usersFromApi: [User]) {
		for user in usersFromApi {
			
			let newCachedUser = CachedUser(context: moc)
			
			newCachedUser.id = user.id
			newCachedUser.isActive = user.isActive
			newCachedUser.name = user.name
			newCachedUser.age = Int16(user.age)
			newCachedUser.company = user.company
			newCachedUser.email = user.email
			newCachedUser.address = user.address
			newCachedUser.about = user.about
			newCachedUser.registered = user.registered
			newCachedUser.tags = user.tags.joined(separator: ",")
			
			
			do {
				if moc.hasChanges {
					try moc.save()
				}
			} catch {
				print("Error trying to create new User: \(error.localizedDescription)")
			}
			
			
			for friend in user.friends {
				let newCachedFriend = CachedFriend(context: moc)
				newCachedFriend.id = friend.id
				newCachedFriend.name = friend.name
				
				newCachedUser.addToFriends(newCachedFriend)
				
				do {
					
					if moc.hasChanges {
						try moc.save()
					}
				} catch {
					print("Error trying new Friend \(error.localizedDescription)")
				}
			}
		}
	}
	
}

struct UsersView_Previews: PreviewProvider {
	static var previews: some View {
		UsersView()
	}
}
