//
//  NotesListViewModel.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 01/06/24.
//

import SwiftUI

class NotesListViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var pullAmountBeforeRefresh: CGFloat = 180
    var successMessage: Bool = false
    var errorMessage: Bool = false
    
    func fetchNotes() {
        isLoading = true
        NetworkServices.shared.getAllNotes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let notes):
                    self.notes = notes
                    self.isLoading = false
                case .failure(let error):
                    self.error = error
                    self.isLoading = false
                    print("Error fetching notes: \(error)")
                }
            }
        }
    }
}
