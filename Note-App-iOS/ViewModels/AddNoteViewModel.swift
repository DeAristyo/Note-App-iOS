//
//  AddNoteViewModel.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import SwiftUI

class AddNoteViewModel: ObservableObject {
    @Published var note: NoteRequestModel
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init() {
        self.note = NoteRequestModel(title: "", tags: [""], body: "")
    }
    
    func addNote(completion: @escaping (Result<Void, Error>) -> Void) {
        isLoading = true
        let createNoteData: [String: Any] = [
            "title": note.title,
            "tags": note.tags.split(separator: ",").map { String($0) },
            "body": note.body,
        ]
        
        NetworkServices.shared.addNote(note: createNoteData) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.isLoading = false
                    completion(.success(()))
                case .failure(let error):
                    self.error = error
                    self.isLoading = false
                    print("Error updating note: \(error)")
                }
            }
        }
    }
}
