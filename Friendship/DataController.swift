//
// Friendship
// Created by: itsjagnezi on 08/11/22
// Copyright (c) today and beyond
//

import CoreData
import Foundation


class DataController: ObservableObject {

	var container = NSPersistentContainer(name: "Friendship")

	init() {
		container.loadPersistentStores { description, error in
			
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
		}
		
		self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
	}
}
