import Foundation
import FoundationNetworking

enum URLSessionAsyncError : Error {
    case invalidUrlResponse, missingResponseData
}

extension URLSession {
    func async(_ url: URL) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            self.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    continuation.resume(throwing: URLSessionAsyncError.invalidUrlResponse)
                    return
                }

                guard let data = data else {
                    continuation.resume(throwing: URLSessionAsyncError.missingResponseData)
                    return
                }

                continuation.resume(returning: (data, response))
            }.resume()
        }
    }
}