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
	var registered: Date
	var tags: [String]
	var friends: [Friend]
	
	static var sample = User(id: UUID(), isActive: false, name: "Test", age: 12, company: "Test", email: "test@test.com", address: "123, Street test Guaru - SP", about: "Lore Ipsum", registered: Date(), tags: ["foodLover", "netflixLover"], friends: [
		Friend.sample,
	])
}
