//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

@main
struct FriendshipApp: App {
  
	@StateObject private var dataController = DataController()
	
	var body: some Scene {
        WindowGroup {
            ContentView()
						.environment(\.managedObjectContext, dataController.container.viewContext)
						.preferredColorScheme(.dark)
        }
    }
}
