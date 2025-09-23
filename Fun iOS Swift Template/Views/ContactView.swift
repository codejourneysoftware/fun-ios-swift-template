import SwiftUI

struct ContactView: View {
    @State private var contacts: [Contact] = []
    @State private var showingAddContact = false
    @State private var newContactName = ""
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
                        if !contact.name.isEmpty {
                            Text(contact.name)
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
        .sheet(isPresented: $showingAddContact) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Add Contact")
                    .font(.title2)
                    .bold()
                TextField("Name", text: $newContactName)
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
                    Button("Cancel") {
                        showingAddContact = false
                        newContactName = ""
                        newContactEmail = ""
                        newContactPhone = ""
                    }
                    Button("Add") {
                        let trimmedName = newContactName.trimmingCharacters(in: .whitespaces)
                        let trimmedEmail = newContactEmail.trimmingCharacters(in: .whitespaces)
                        let trimmedPhone = newContactPhone.trimmingCharacters(in: .whitespaces)
                        guard !trimmedName.isEmpty || !trimmedEmail.isEmpty || !trimmedPhone.isEmpty else { return }
                        contacts.append(Contact(name: trimmedName, email: trimmedEmail, phone: trimmedPhone))
                        showingAddContact = false
                        newContactName = ""
                        newContactEmail = ""
                        newContactPhone = ""
                    }
                    .keyboardShortcut(.defaultAction)
                }
            }
            .padding(24)
            .frame(minWidth: 300)
        }
    }
}

#Preview {
    ContactView()
}
