//
//  NetworkResolver.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 01/06/24.
//

import Foundation

struct ResponseArrayData: Decodable {
    let status: String
    let data: NotesListData
}

struct ResponseData: Decodable {
    let status: String
    let data: NoteDetailsData
}

struct NotesListData: Decodable {
    let notes: [Note]
}

struct NoteDetailsData: Decodable {
    let note: Note
}

struct Messages: Decodable {
    let status: String
    let message: String
}
