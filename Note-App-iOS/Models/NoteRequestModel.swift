//
//  NoteRequesModel.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

struct NoteRequestModel {
    var title: String
    var tags: String
    var body: String
}

extension NoteRequestModel {
    init(title: String, tags: [String], body: String) {
        self.title = title
        self.tags = tags.joined(separator: ", ")
        self.body = body
    }
}
