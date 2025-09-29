//
//  Fun_iOS_Swift_TemplateApp.swift
//  Fun iOS Swift Template
//
//  Created by ISAAC ORTIZ on 9/23/25.
//

import SwiftUI
import SwiftData

@main
struct Fun_iOS_Swift_TemplateApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /*
         SwiftData setup
         ----------------
         - `.modelContainer(for:)` registers your `@Model` types and creates a persistent store on disk.
         - The container injects a `ModelContext` into the SwiftUI environment as `\Environment(\.modelContext)`.
         - Create and persist data by:
           1) Creating `@Model` objects (e.g., `ContactModel(...)`)
           2) Inserting them with `modelContext.insert(...)`
           3) Calling `try modelContext.save()` when you want to persist immediately
         - Fetch and keep views in sync using `@Query`, which auto-updates as data changes.
         - Note: SwiftUI previews often use an in-memory store; run the app on a device/simulator to see on-disk persistence.
         */
        .modelContainer(for: [ContactModel.self])
    }
}

