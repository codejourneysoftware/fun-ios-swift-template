import SwiftUI
import SwiftData

struct ContactView: View {
    @Query(sort: \ContactModel.firstName) private var contacts: [ContactModel]
    @State private var contactService: ContactService?
    @Environment(\.modelContext) private var modelContext
    
    @State private var showingAddContact = false
    @State private var newContactFirstName = ""
    @State private var newContactLastName = ""
    @State private var newContactEmail = ""
    @State private var newContactPhone = ""

    var body: some View {
        
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text("Contacts")
                .font(.largeTitle)
                .bold()
            Text("Here you can manage your contact information.")
                .foregroundStyle(.secondary)

            Button("Add Contact") {
                showingAddContact = true
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)

            if contacts.isEmpty {
                Text("No contacts yet.")
                    .foregroundStyle(.tertiary)
                    .padding(.top)
            } else {
                List(contacts) { contact in
                    VStack(alignment: .leading) {
                        // Display first and last name if available
                        if !contact.firstName.isEmpty || !contact.lastName.isEmpty {
                            Text("\(contact.firstName) \(contact.lastName)".trimmingCharacters(in: .whitespaces))
                                .font(.headline)
                        }
                        if !contact.email.isEmpty {
                            Text(contact.email)
                                .foregroundStyle(.secondary)
                        }
                        if !contact.phone.isEmpty {
                            Text(contact.phone)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .frame(height: 200)
            }
        }
        .padding()
        .onAppear {
            contactService = ContactService(modelContext: modelContext)
        }
        .sheet(isPresented: $showingAddContact) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Add Contact")
                    .font(.title2)
                    .bold()
                TextField("First Name", text: $newContactFirstName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
                TextField("Last Name", text: $newContactLastName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
                TextField("Email", text: $newContactEmail)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
                TextField("Phone Number", text: $newContactPhone)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
                HStack {
                    Spacer()
                    Button("Cancel", action: {
                        showingAddContact = false
                        clearFields()
                    })
                    Button("Add", action: {
                        let trimmedFirstName = newContactFirstName.trimmingCharacters(in: .whitespaces)
                        let trimmedLastName = newContactLastName.trimmingCharacters(in: .whitespaces)
                        let trimmedEmail = newContactEmail.trimmingCharacters(in: .whitespaces)
                        let trimmedPhone = newContactPhone.trimmingCharacters(in: .whitespaces)
                        // Ensure at least one field is filled
                        guard !trimmedFirstName.isEmpty || !trimmedLastName.isEmpty || !trimmedEmail.isEmpty || !trimmedPhone.isEmpty else { return }
                        // Insert new contact using ContactService
                        contactService?.insertContact(firstName: trimmedFirstName, lastName: trimmedLastName, phone: trimmedPhone, email: trimmedEmail)
                        showingAddContact = false
                        clearFields()
                    })
                    .keyboardShortcut(.defaultAction)
                }
            }
            .padding(24)
            .frame(minWidth: 300)
        }
    }
    
    private func clearFields() {
        newContactFirstName = ""
        newContactLastName = ""
        newContactEmail = ""
        newContactPhone = ""
    }
}

#Preview {
    ContactView()
}
