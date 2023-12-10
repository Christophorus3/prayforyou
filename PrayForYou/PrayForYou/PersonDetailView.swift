//
//  AddPersonView.swift
//  PrayForYou
//
//  Created by Christoph Wottawa on 10.12.23.
//

import SwiftUI
import SwiftData

struct PersonDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var name = ""

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
            }

            Section {
                Button("Save", action: save)
            }
        }
        .navigationTitle("Add Person")
    }

    private func save() {
        let person = Person(name: name)
        modelContext.insert(person)
        dismiss()
    }

}

#Preview {
    PersonDetailView()
}
