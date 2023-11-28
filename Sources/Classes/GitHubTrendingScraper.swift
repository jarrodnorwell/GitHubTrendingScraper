import Foundation
import FoundationNetworking

struct GitHubTrendingScraper {
    static func scrape() async throws {
        let developer = try await DeveloperSoup.shared.developer()
        guard let url = URL(string: "http://localhost:8080/developers") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpBody = try JSONSerialization.data(withJSONObject: try JSONSerialization.jsonObject(with: try JSONEncoder().encode(developer)))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request).resume()
    }
}