//
//  NetworkServices.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 01/06/24.
//

import Alamofire


class NetworkServices {
    static let shared = NetworkServices()
    private let baseURL = "http://localhost:3000"

    private init() {}
    
    // MARK: - Create Note
    func addNote(note: [String: Any], completion: @escaping (Result<Note, Error>) -> Void) {
        let url = "\(baseURL)/notes"
        AF.request(url, method: .post, parameters: note, encoding: JSONEncoding.default)
            .responseDecodable(of: Note.self) { response in
                switch response.result {
                case .success(let note):
                    completion(.success(note))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // MARK: - Fetch all Notes
    func getAllNotes(completion: @escaping (Result<[Note], Error>) -> Void) {
        let url = "\(baseURL)/notes"
        AF.request(url, method: .get)
            .responseDecodable(of: [Note].self) { response in
                switch response.result {
                case .success(let notes):
                    completion(.success(notes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    //MARK: - Fetch Note with ID params
    func getNoteWithId(noteId: String, completion: @escaping (Result<Note, Error>) -> Void) {
        let url = "\(baseURL)/notes/\(noteId)"
        AF.request(url, method: .get)
            .responseDecodable(of: Note.self) { response in
                switch response.result {
                case .success(let note):
                    completion(.success(note))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // MARK: - Update Note
    func updateNote(noteId: String, note: [String: Any], completion: @escaping (Result<Note, Error>) -> Void) {
        let url = "\(baseURL)/notes/\(noteId)"
        AF.request(url, method: .put, parameters: note, encoding: JSONEncoding.default)
            .responseDecodable(of: Note.self) { response in
                switch response.result {
                case .success(let note):
                    completion(.success(note))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // MARK: - Delete Note
    func deleteNote(noteId: String, completion: @escaping (Result<Messages, Error>) -> Void) {
        let url = "\(baseURL)/notes/\(noteId)"
        AF.request(url, method: .delete)
            .responseDecodable(of: Messages.self) { response in
                switch response.result {
                case .success(let note):
                    completion(.success(note))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
