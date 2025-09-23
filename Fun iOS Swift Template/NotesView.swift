import SwiftUI

struct NotesView: View {
    var body: some View {
        VStack {
            Image(systemName: "note.text")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text("Notes")
                .font(.largeTitle)
                .bold()
            Text("This is the Notes tab.")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    NotesView()
}
