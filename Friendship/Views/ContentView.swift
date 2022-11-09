//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct ContentView: View {
	
	@State private var users = [User]()
	
	var body: some View {
		NavigationView {
			
			List(users) { user in
				HStack {
					NavigationLink(destination: UserView(user: user)) {
						Text(user.name)
					}
				}
			}
			.navigationTitle("People")
			.task {
				await loadData()
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
			if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
				people = decodedResponse
			}
		} catch {
			print("Invalid data")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


