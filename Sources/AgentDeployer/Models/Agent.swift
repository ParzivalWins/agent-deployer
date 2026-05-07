import Foundation

/// Represents an AI agent that can be deployed from the watch.
struct Agent: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let emoji: String
    let description: String
    let type: AgentType

    enum AgentType: String, Codable, CaseIterable {
        case shopping
        case research
        case news
        case finance
    }

    static let catalog: [Agent] = [
        Agent(
            id: UUID(),
            name: "Shopping",
            emoji: "🛒",
            description: "Finds the best price / deal for a product",
            type: .shopping
        ),
        Agent(
            id: UUID(),
            name: "Research",
            emoji: "🔍",
            description: "Returns a concise summary on any topic",
            type: .research
        ),
        Agent(
            id: UUID(),
            name: "News",
            emoji: "📰",
            description: "Surfaces top headlines for a keyword or category",
            type: .news
        ),
        Agent(
            id: UUID(),
            name: "Finance",
            emoji: "💰",
            description: "Fetches a stock quote, market summary, or crypto price",
            type: .finance
        ),
    ]
}

/// The request payload sent to the middleware when deploying an agent.
struct AgentRequest: Codable {
    let agentType: Agent.AgentType
    let subject: String
}

/// The response payload received from the middleware with agent results.
struct AgentResult: Codable, Identifiable {
    let id: UUID
    let agentType: Agent.AgentType
    let subject: String
    let summary: String
    let timestamp: Date
}
