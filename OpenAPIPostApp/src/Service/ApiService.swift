import Foundation

class ApiService {
    
    func fetchPosts() async throws -> [Post] {
        // 1. Define the API endpoint URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw URLError(.badURL)
        }
        
        // 2. Make the network request
        // The data(from:) method is an async function that returns a tuple with data and a URLResponse.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Optional: Check for a valid HTTP response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // 3. Decode the JSON data into our Post model
        let decoder = JSONDecoder()
        let posts = try decoder.decode([Post].self, from: data)
        
        return posts
    }
}