/*
 ContactModel.swift
 -----------------
 This file defines a SwiftData-compatible model for storing contact information.

 SwiftData is Apple's modern persistence framework for Swift that allows you to store, query, and manage model data directly from Swift code, using type-safe classes and property wrappers. Models marked with @Model are automatically tracked and managed by SwiftData, and can be persisted to disk, queried, and edited in a type-safe way.
*/

import Foundation
import SwiftData

// The @Model macro marks this class as a SwiftData-managed model type.
// SwiftData will persist instances of this class and manage their lifecycle in the persistent store.
@Model
// The class is public to allow access and instantiation from other modules or app layers.
// This enables the model to be used throughout the app as a persistent entity.
public class ContactModel {
    // Public properties will be persisted by SwiftData as fields.
    // These fields define the schema for each Contact in the data store.
    public var firstName: String
    public var lastName: String
    public var phone: String
    public var email: String

    // SwiftData requires a public required initializer with no arguments.
    // This is used by SwiftData to create new or fetched instances.
    public required init() {
        self.firstName = ""
        self.lastName = ""
        self.phone = ""
        self.email = ""
    }

    // Convenience initializer for creating new contacts in your app code.
    public init(firstName: String, lastName: String, phone: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
    }
}

// Usage:
// - This model is registered with SwiftData via .modelContainer(for: [ContactModel.self]) in your App struct.
// - You can fetch, create, and save ContactModel objects using SwiftData APIs (e.g., @Query, modelContext).
//
// --- CRUD Example (in a SwiftUI View) ---
//
// import SwiftData
// import SwiftUI
//
// struct ExampleView: View {
//     @Environment(\.modelContext) private var modelContext
//     @Query(sort: \ContactModel.firstName) private var contacts: [ContactModel]
//
//     // Create and save a new contact
//     func addContact() {
//         let contact = ContactModel(firstName: "Jane", lastName: "Doe", phone: "1234567890", email: "jane@example.com")
//         modelContext.insert(contact)
//         // Changes are automatically saved at the end of the transaction/scope
//     }
//
//     // Fetching contacts is done automatically via @Query property wrapper in 'contacts' array
//
//     // Update the first contact's phone number
//     func updateFirstContact() {
//         if let first = contacts.first {
//             first.phone = "0987654321"
//             // SwiftData tracks changes automatically; no explicit save call needed
//         }
//     }
//
//     // Delete the first contact in the list
//     func deleteFirstContact() {
//         if let first = contacts.first {
//             modelContext.delete(first)
//             // Deletion changes are saved automatically on transaction commit
//         }
//     }
//
//     var body: some View {
//         // Your UI here (not shown)
//         Text("Contacts example")
//     }
// }
