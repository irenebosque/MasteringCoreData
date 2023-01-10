//
//  MasteringCoreDataApp.swift
//  MasteringCoreData
//
//  Created by Irene on 9/1/23.
//

import SwiftUI

@main
struct MasteringCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            
            // Create a single instance of the StorageProvider class and pass that instance around 
            MoviesView(storageProvider: StorageProvider())
        }
    }
}

