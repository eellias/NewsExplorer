//
//  CustomDate.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 12.06.2023.
//

import Foundation

class CustomDateFormatter {
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    func date(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: string)
    }
    
    func formatDatePickerDate(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formattedDate = formatter.string(from: date)
        
        return formattedDate
    }
}
