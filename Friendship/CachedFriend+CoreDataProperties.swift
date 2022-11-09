////
// Friendship
// Created by: itsjagnezi on 08/11/22
// Copyright (c) today and beyond
//
//

import Foundation
import CoreData


extension CachedFriend {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
		return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
	}
	
	@NSManaged public var id: UUID?
	@NSManaged public var name: String?
	@NSManaged public var user: CachedUser?
	
	var wrappedName: String {
		return name ?? "Unknown friend"
	}
	
}

extension CachedFriend : Identifiable {
	
}
