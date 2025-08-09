//
//  would.swift
//  OpenAPIPostApp
//
//  Created by Premraj C R on 09/08/25.
//


import SwiftUI

// Our data model (Post) and ApiService class would be defined elsewhere,
// just as in the previous example.

struct PostListView: View {
    @State private var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Posts")
            .task {
                do {
                    let apiService = ApiService()
                    posts = try await apiService.fetchPosts()
                } catch {
                    print("Error fetching posts: \(error)")
                }
            }
        }
    }
}