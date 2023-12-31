//
//  ContentView.swift
//  PrayForYou
//
//  Created by Christoph Wottawa on 02.12.23.
//

import SwiftUI
import SwiftData

struct PersonsListView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Person.name)]) var persons: [Person]

    @State var isShowingAddView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(persons) { person in
                    HStack {
                        Text(person.name)
                        Image(systemName: "arrow.forward")
                        Text(person.isPrayingFor ?? "")
                    }
                }
                .onDelete(perform: deleteObjects)
            }
            .navigationTitle("PrayForYou")
            .toolbar(content: toolbarItems)
        }
        .sheet(isPresented: $isShowingAddView, content: {
            PersonDetailView()
        })
    }

    @ToolbarContentBuilder
    private func toolbarItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            EditButton()
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button("Draw", action: drawPersons)
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button("Add", systemImage: "plus", action: add)
        }
    }

    private func add() {
        isShowingAddView = true
    }

    private func deleteObjects(at offsets: IndexSet) {
        for offset in offsets {
            let person = persons[offset]
            modelContext.delete(person)
        }
    }

    private func drawPersons() {
        var targetPersons = persons.shuffled()
        for person in persons {
            person.isPrayingFor = drawPerson(for: person.name)
        }

        func drawPerson(for name: String) -> String {
            var resultName = ""
            repeat {
                guard let randomName = targetPersons.randomElement()?.name
                else {
                    continue
                }
                resultName = randomName
            } while resultName == name
            targetPersons.removeAll { $0.name == resultName }
            return resultName
        }
    }


}

#Preview {
    PersonsListView()
}
