//
//  NoteBinding.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

struct NoteDetail {
    var id: String
    var title: String
    var tags: String
    var body: String
    var createdAt: String
    var updatedAt: String
}

extension NoteDetail {
    init(id: String, title: String, tags: [String], body: String, createdAt: String, updatedAt: String) {
        self.id = id
        self.title = title
        self.tags = tags.joined(separator: ", ")
        self.body = body
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
