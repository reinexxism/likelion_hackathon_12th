//
//  AddEventView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/6/24.
//

import SwiftUI
import SwiftData

struct AddEventView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var memo: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Event Details")) {
                    TextField("Title", text: $title)
                        .disableAutocorrection(true)
                }
                Section{
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }header: {
                    Text("날짜")
                }
                Section{
                    TextEditor(text: $memo)
                        .frame(minHeight: 100)
                }header: {
                    Text("memo")
                }
            }
            .navigationTitle("오늘의 운동")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        addEvent()
                        isPresented = false
                    }
                }
            }
        }
    }

    private func addEvent() {
        let newEvent = Event(title: title, date: date, memo: memo)
        modelContext.insert(newEvent)
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save event: \(error.localizedDescription)")
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView(isPresented: .constant(true))
            .modelContainer(for: Event.self)
    }
}
