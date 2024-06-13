//
//  NotesDetailView.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 09/06/24.
//

import SwiftUI

class NoteDetailViewModel: ObservableObject {
    @Published var note: NoteDetail
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init() {
        self.note = NoteDetail(id: "",title: "", tags: [""], body: "", createdAt: "", updatedAt: "")
    }
    
    func fetchNoteWithId(noteId: String) {
        isLoading = true
        NetworkServices.shared.getNoteWithId(noteId: noteId) { result in
            switch result {
            case .success(let note):
                DispatchQueue.main.async {
                    self.note = NoteDetail(id: note.note.id,title: note.note.title, tags: note.note.tags, body: note.note.body, createdAt: note.note.getFormattedCreatedAt(), updatedAt: note.note.getFormattedUpdatedAt())
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
    
    func updateNoteDetails(completion: @escaping (Result<Void, Error>) -> Void) {
        isLoading = true
        let noteId = note.id
        let updatedNoteData: [String: Any] = [
            "title": note.title,
            "tags": note.tags.split(separator: ",").map { String($0) },
            "body": note.body,
            "createdAt": note.createdAt,
            "updatedAt": note.updatedAt
        ]
        
        NetworkServices.shared.updateNote(noteId: noteId, note: updatedNoteData) { result in
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
    
    func deleteNote(completion: @escaping (Result<Void, Error>) -> Void) {
        isLoading = true
        let noteId = note.id
        
        NetworkServices.shared.deleteNote(noteId: noteId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.isLoading = false
                    completion(.success(()))
                case .failure(let error):
                    self.error = error
                    self.isLoading = false
                    completion(.failure(error))
                }
            }
        }
    }
}
