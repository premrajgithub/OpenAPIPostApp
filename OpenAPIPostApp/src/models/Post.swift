//
//  Post.swift
//  OpenAPIPostApp
//
//  Created by Premraj C R on 09/08/25.
//


import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
