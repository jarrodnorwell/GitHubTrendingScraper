import Foundation
import FoundationNetworking
import SwiftSoup

struct DeveloperSoup {
    static let shared = DeveloperSoup()

    enum DeveloperSoupError : Error {
        case invalidURL, invalidArticle, invalidUsernameElement
    }

    func developer() async throws -> Developer {
        guard let url = URL(string: "https://github.com/trending/developers") else {
            throw DeveloperSoupError.invalidURL
        }

        let document = try SwiftSoup.parse(try String(contentsOf: url))

        guard let article = try document.select("article[id]").first() else {
            throw DeveloperSoupError.invalidArticle
        }

        guard let usernameElement = try article.select("p.f4 > a").first() else {
            throw DeveloperSoupError.invalidUsernameElement
        }

        let username = try usernameElement.text()

        guard let userURL = URL(string: "https://api.github.com/users/\(username)") else {
            throw DeveloperSoupError.invalidURL
        }

        let (developerData, _) = try await user(userURL)
        var developer = try JSONDecoder().decode(Developer.self, from: developerData)

        guard let reposURL = URL(string: "https://api.github.com/users/\(username)/repos") else {
            throw DeveloperSoupError.invalidURL
        }

        let (repositoriesData, _) = try await repos(reposURL)
        let repositories = try JSONDecoder().decode([Repository]?.self, from: repositoriesData)

        developer.set(repositories)
        return developer
    }

    func repos(_ url: URL) async throws -> (Data, URLResponse) {
        try await URLSession.shared.async(url)
    }

    func user(_ url: URL) async throws -> (Data, URLResponse) {
        try await URLSession.shared.async(url)
    }
}