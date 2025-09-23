import SwiftUI

struct TodoListView: View {
    var body: some View {
        VStack {
            Image(systemName: "checklist")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text("To-Do List")
                .font(.largeTitle)
                .bold()
            Text("This is the To-Do List tab.")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    TodoListView()
}
