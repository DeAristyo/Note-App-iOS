//
//  NetworkResolver.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 01/06/24.
//

import Foundation

struct Note: Decodable {
    let id: String
    let title: String
    let tags: [String]
    let body: String
    let createdAt: String
    let updatedAt: String
}

struct Messages: Decodable{
    let status: String
    let message: String
}
