//
//  Task.swift
//  TaskManagement
//
//  Created by Никита Сторчай on 19.01.2026.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var title: String
    var caption: String
    var date: Date = .init()
    var isComplete: Bool = false
    var tint: Color
}

// Sample tasks
var sampleTasks: [Task] = [
    .init(title: "Standup", caption: "Every day meeting", date: Date.now, tint: .yellow),
    .init(title: "Kickoff", caption: "Travel App", date: Date.now, tint: .gray),
    .init(title: "Ui Design", caption: "Fintech App", date: Date.now, tint: .green),
    .init(title: "Logo Design", caption: "Fintech App", date: Date.now, tint: .purple),
]
