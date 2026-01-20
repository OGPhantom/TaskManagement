//
//  ContentView.swift
//  TaskManagement
//
//  Created by Никита Сторчай on 19.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State var currentDate: Date = .init()
    @State var weekSlider: [[WeekDay]] = []
    @State var currentWeekIndex: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Text("Calendar")
                    .font(.system(size: 36, weight: .semibold))

                TabView(selection: $currentWeekIndex) {
                    ForEach(weekSlider.indices, id: \.self) { index in
                        let week = weekSlider[index]
                        weekView(week).tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 90)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                Rectangle().fill(.gray.opacity(0.1))
                    .ignoresSafeArea()
                    .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                    .ignoresSafeArea()
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            if weekSlider.isEmpty {
                let currentWeek = currentDate.fetchWeek(currentDate)
                weekSlider.append(currentWeek)
                currentWeekIndex = 0
            }
        }
    }

    @ViewBuilder
    func weekView(_ week: [WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)

                    Text(day.date.format("dd"))
                        .font(.system(size: 20))
                        .frame(width: 40, height: 40)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .black)
                        .background {
                            if isSameDate(day.date, currentDate) {
                                RoundedRectangle(cornerRadius: 12).fill(.black).offset(y:3)
                            }

                            if day.date.isToday {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                            }
                        }

                }
                .hSpacing(.center)
                .onTapGesture {
                    withAnimation(.snappy) {
                        currentDate = day.date
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
