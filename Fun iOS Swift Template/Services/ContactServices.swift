//
//  ContactServices.swift
//  Fun iOS Swift Template
//
//  Created by ISAAC ORTIZ on 9/26/25.
//

import Foundation
import SwiftData

struct ContactService {
    let modelContext: ModelContext
    
    func insertContact(firstName: String, lastName: String, phone: String, email: String) {
        let newContact = ContactModel(firstName: firstName, lastName: lastName, phone: phone, email: email)
        modelContext.insert(newContact)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save contact: \(error)")
        }
    }
    
    func getContacts(sortedBy sortDescriptor: SortDescriptor<ContactModel>? = nil) -> [ContactModel] {
        let descriptor = sortDescriptor ?? SortDescriptor(\ContactModel.firstName)
        let fetchDescriptor = FetchDescriptor<ContactModel>(sortBy: [descriptor])
        return (try? modelContext.fetch(fetchDescriptor)) ?? []
    }
}

