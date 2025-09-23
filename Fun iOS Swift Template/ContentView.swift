//
//  ContentView.swift
//  Fun iOS Swift Template
//
//  Created by ISAAC ORTIZ on 9/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ContactView()
                .tabItem {
                    Label("Contacts", systemImage: "person.crop.circle")
                }
            TodoListView()
                .tabItem {
                    Label("To-Do", systemImage: "checklist")
                }
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
        }
    }
}

#Preview {
    ContentView()
}
