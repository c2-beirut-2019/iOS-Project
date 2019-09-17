//
//  RGCalendar.swift
//  Animal House
//
//  Created by Roy Geagea on 9/16/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import FSCalendar

struct RGCalendar: UIViewRepresentable {

    typealias UIViewType = FSCalendar
    
    var apppointmentsList: [AppointmentModel]!
    @Binding var date: Date

    class Coordinator: NSObject, FSCalendarDataSource, FSCalendarDelegate {

        var apppointmentsList: [AppointmentModel]!
        @Binding var date: Date

        init(apppointmentsList: [AppointmentModel], date: Binding<Date>) {
            _date = date
            self.apppointmentsList = apppointmentsList
        }
        
        // MARK:- FSCalendarDataSource
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            return self.apppointmentsList.filter{ Calendar.current.isDate(($0.startDate?.animalHouseDate())!, inSameDayAs: date)}.count
        }
        
        // MARK:- FSCalendarDelegate
        
        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition)   -> Bool {
            return monthPosition == .current
        }
        
        func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            return monthPosition == .current
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            self.date = date
        }
        
        func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
            print("did deselect date \(date)")
        }
        
    }
    
    func makeCoordinator() -> RGCalendar.Coordinator {
        return Coordinator(apppointmentsList: self.apppointmentsList, date: self.$date)
    }
    
    func makeUIView(context: UIViewRepresentableContext<RGCalendar>) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.dataSource = context.coordinator
        calendar.delegate = context.coordinator
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: UIViewRepresentableContext<RGCalendar>) {
        
    }
    
}


