//
//  MainView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/3/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Event.date, order: .forward) private var queryEvents: [Event]

    @State private var isPresentingAddEventView = false
    @State private var isPresentingEditEventView = false
    @State private var selectedDate = Date()
    @State private var events: [Event] = []
    @State private var editingEvent: Event?

    var body: some View {
        NavigationView {
            VStack {
                CalendarView(selectedDate: $selectedDate, events: events)
                    .frame(height: 390)
                
                List {
                    Section{
                        ForEach(events.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }, id: \.id) { events in
                            VStack(alignment: .leading) {
                                Text(events.title)
                                    .font(.headline)
                                Text(events.date, style: .date)
                                    .font(.subheadline)
                                if let memo = events.memo {
                                    Text(memo)
                                        .font(.body)
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button("Edit") {
                                    isPresentingEditEventView = true
                                    editingEvent = events
                                    print("Edit button pressed for event: \(events.title)")
                                }
                                .tint(.blue)
                            }
                            .swipeActions(edge: .trailing) {
                                Button("Delete", role: .destructive) {
                                    deleteEvent(events)
                                }
                                .tint(.red)
                            }
                        }
                    }
                header:{
                    Text("Events")
                }
                    
                }.frame(height: 200)
            }
            .navigationTitle("Diary")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isPresentingAddEventView = true }) {
                        Label("Add Event", systemImage: "plus")
                    }.padding()
                }
            }
            .sheet(isPresented: $isPresentingAddEventView) {
                AddEventView(isPresented: $isPresentingAddEventView)
                    .environment(\.modelContext, modelContext)
            }
            .sheet(isPresented: $isPresentingEditEventView) {
                if let editingEvent = editingEvent {
                    EditEventView(isPresented: $isPresentingEditEventView, event: editingEvent)
                        .environment(\.modelContext, modelContext)
                }
            }
            .onAppear {
                events = queryEvents
                print("ContentView appeared, events count: \(events.count)")
            }
            .onChange(of: queryEvents) { newEvents in
                events = newEvents
                print("Events updated, new events count: \(newEvents.count)")
            }
            
            
        }
    }
    

    private func deleteEvent(_ event: Event) {
        modelContext.delete(event)
        do {
            try modelContext.save()
            events = queryEvents // 삭제 후 이벤트 목록 업데이트
        } catch {
            print("Failed to delete event: \(error.localizedDescription)")
        }
    }
    
}

struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .modelContainer(for: Event.self)
    }
}
