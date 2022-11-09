////
// Friendship
// Created by: itsjagnezi on 06/11/22
// Copyright (c) today and beyond
//

import SwiftUI

struct UserView: View {
	
	@ObservedObject var user: CachedUser
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 12) {
			Text(user.wrappedName)
				.font(.largeTitle)
			
			Text(user.wrappedRegistered.formatted(date: .numeric, time: .omitted))
				.font(.subheadline)
				.bold()
				.italic()
			
			Text(user.about ?? "")
			
			HStack {
				Text("User Tags: ")
				ScrollView(.horizontal) {
					HStack {
						ForEach(user.wrappedTags, id: \.self) { tag in
							Text(tag)
								.foregroundColor(.black)
								.padding(4)
								.background(.gray)
								.cornerRadius(4)
						}
					}
				}
			}
			.padding(.bottom, 24)
			
			
			
			List(user.friendsArr) { friend in
				HStack {
					Text(friend.wrappedName)
				}
			}
			.listStyle(PlainListStyle())
		}
		.padding([.leading, .trailing], 16)
		.navigationTitle("User")
		.navigationBarTitleDisplayMode(.inline)
	}
}
