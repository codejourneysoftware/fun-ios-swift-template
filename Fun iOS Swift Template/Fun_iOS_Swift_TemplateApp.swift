//
//  Fun_iOS_Swift_TemplateApp.swift
//  Fun iOS Swift Template
//
//  Created by ISAAC ORTIZ on 9/23/25.
//

import SwiftUI
import CoreData

@main
struct Fun_iOS_Swift_TemplateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
