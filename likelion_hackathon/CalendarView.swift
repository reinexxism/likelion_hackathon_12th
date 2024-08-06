//
//  CalendarView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/6/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    var events: [Event]
    @State private var currentMonth = Date()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM"
        return formatter
    }()

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth) ?? Date()
                }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(dateFormatter.string(from: currentMonth))
                    .font(.headline)
                Spacer()
                Button(action: {
                    currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth) ?? Date()
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            let days = generateDaysInMonth(for: currentMonth)
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { date in
                    VStack {
                        Text("\(Calendar.current.component(.day, from: date))")
                            .font(.body)
                            .foregroundColor(isSameMonth(date1: date, date2: currentMonth) ? .primary : .white)
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.clear)
                    }
                    .padding(4)
                    .background(Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(hasEvent(on: date) ? .green : .clear)
                        .padding(.bottom))
                    .background(Circle().frame(width: 30, height: 30)
                        .foregroundColor(isSelectedDate(date) ? .blue : .clear)
                        .padding(.bottom))
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
    }

    private func isSameMonth(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(.year, from: date1) == calendar.component(.year, from: date2) &&
            calendar.component(.month, from: date1) == calendar.component(.month, from: date2)
    }

    private func isSelectedDate(_ date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: selectedDate)
    }

    private func generateDaysInMonth(for date: Date) -> [Date] {
        var days: [Date] = []
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!

        for day in range {
            if let dayDate = calendar.date(byAdding: .day, value: day - 1, to: calendar.date(from: calendar.dateComponents([.year, .month], from: date))!) {
                days.append(dayDate)
            }
        }
        
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let weekday = calendar.component(.weekday, from: firstDayOfMonth) - 1
        for _ in 0..<weekday {
            days.insert(Date.distantPast, at: 0)
        }

        return days
    }

    private func hasEvent(on date: Date) -> Bool {
        events.contains { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDate: .constant(Date()), events: [])
    }
}
