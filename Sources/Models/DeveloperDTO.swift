import Foundation

struct Developer : Codable {
    var id: Int?
    let login, node_id, avatar_url: String
    let gravitar_id: String?
    let url, html_url, followers_url, following_url: String
    let gists_url, starred_url, subscriptions_url: String
    let organizations_url, repos_url, events_url: String
    let received_events_url, type: String

    let site_admin: Bool

    let name, company, blog, location, email: String?

    let hireable: Bool?

    let bio, twitter_username: String?

    let public_repos, public_gists, followers, following: Int

    let created_at, updated_at: String

    var repositories: [Repository]?

    mutating func set(_ repositories: [Repository]?) {
        self.repositories = repositories
    }
}