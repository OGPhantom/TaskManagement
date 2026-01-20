//
//  DateExtensions.swift
//  TaskManagement
//
//  Created by Никита Сторчай on 19.01.2026.
//

import SwiftUI

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }

    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)

        var week: [WeekDay] = []
        let weekDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
        guard let startWeek = weekDate?.start else { return [] }

        for index in 0..<7 {
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startDate) {
                week.append(.init(date: weekDay))
            }
        }

        return week
    }

    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
}
