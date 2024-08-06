//
//  EditEventView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/6/24.
//

//
//  CalenderView.swift
//  SportTracker
//
//  Created by Dongha Ryu on 8/5/24.
import SwiftUI
import SwiftData

struct EditEventView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    var event: Event
    @State private var title: String
    @State private var date: Date
    @State private var memo: String

    init(isPresented: Binding<Bool>, event: Event) {
        self._isPresented = isPresented
        self.event = event
        _title = State(initialValue: event.title)
        _date = State(initialValue: event.date)
        _memo = State(initialValue: event.memo ?? "")
    }

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
                    Text("date")
                }
                Section{
                    TextEditor(text: $memo)
                        .frame(minHeight: 100)
                }header: {
                    Text("memo")
                }
            }
            .navigationTitle("Edit Event")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                        print("Edit cancelled")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        do {
                            try updateEvent()
                            isPresented = false
                            print("Event saved")
                        } catch {
                            print("Failed to save event: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }

    private func updateEvent() throws {
        event.title = title
        event.date = date
        event.memo = memo

        try modelContext.save()
    }
}

struct EditEventView_Previews: PreviewProvider {
    static var previews: some View {
        do {
            let container = try ModelContainer(for: Event.self)
            let context = container.mainContext
            let sampleEvent = Event(title: "Sample Event", date: Date(), memo: "Sample Memo")
            context.insert(sampleEvent)

            return EditEventView(isPresented: .constant(true), event: sampleEvent)
                .environment(\.modelContext, context)
                .modelContainer(for: Event.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
}
