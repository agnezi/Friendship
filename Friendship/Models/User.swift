////
// Friendship
// Created by: itsjagnezi on 06/11/22
// Copyright (c) today and beyond
//

import Foundation

struct User: Codable, Identifiable {
	var id: UUID
	var isActive: Bool
	var name: String
	var age: Int
	var company: String
	var email: String
	var address: String
	var about: String
	var registered: String
	var tags: [String]
	var friends: [Friend]
}
