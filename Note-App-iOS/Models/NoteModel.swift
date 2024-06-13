//
//  NoteModel.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import Foundation

struct Note: Decodable, Identifiable {
    var id: String
    var title: String
    var tags: [String]
    var body: String
    var createdAt: String
    var updatedAt: String
    
    func getFormattedCreatedAt() -> String {
        return formatDate(dateString: createdAt)
    }
    
    func getFormattedUpdatedAt() -> String {
        return formatDate(dateString: updatedAt)
    }
    
    private func formatDate(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        // Attempt to parse the date string
        if let date = isoDateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH.mm dd-MM-yyyy"
            outputFormatter.timeZone = TimeZone(secondsFromGMT: 7 * 3600)
            
            // Format the date and return as string
            return outputFormatter.string(from: date)
        } else {
            // Return the original date string if parsing fails
            return dateString
        }
    }
}
