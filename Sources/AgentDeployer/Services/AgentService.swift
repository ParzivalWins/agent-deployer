import Foundation

/// Handles direct network communication with the middleware layer.
/// Uses URLSession for standalone Wi-Fi / LTE connectivity — no iPhone bridge.
actor AgentService {
    private let session: URLSession
    private let baseURL: URL

    init(baseURL: URL = URL(string: "https://api.agentdeployer.example.com")!) {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: config)
        self.baseURL = baseURL
    }

    func deploy(_ request: AgentRequest) async -> AgentResult? {
        let url = baseURL.appendingPathComponent("v1/agents/deploy")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
            let (data, _) = try await session.data(for: urlRequest)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(AgentResult.self, from: data)
        } catch {
            return nil
        }
    }
}
