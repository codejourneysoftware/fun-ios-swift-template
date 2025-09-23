import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text("Contacts")
                .font(.largeTitle)
                .bold()
            Text("This is the Contacts tab.")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContactView()
}
