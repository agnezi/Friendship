////
// Friendship
// Created by: itsjagnezi on 06/11/22
// Copyright (c) today and beyond
//

import Foundation

struct Friend: Codable, Identifiable {
	var id: UUID
	var name: String
	
	static var sample = Friend(id: UUID(), name: "Test")
}
