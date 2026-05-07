import Foundation

/// Parses raw voice input into a structured AgentRequest.
struct IntentParser {

    func parse(_ input: String) -> AgentRequest? {
        let lowered = input.lowercased()

        let agentType: Agent.AgentType
        if lowered.contains("shop") || lowered.contains("buy") || lowered.contains("price") || lowered.contains("deal") {
            agentType = .shopping
        } else if lowered.contains("research") || lowered.contains("summarize") || lowered.contains("explain") {
            agentType = .research
        } else if lowered.contains("news") || lowered.contains("headline") {
            agentType = .news
        } else if lowered.contains("stock") || lowered.contains("crypto") || lowered.contains("market") || lowered.contains("finance") {
            agentType = .finance
        } else {
            return nil
        }

        let subject = extractSubject(from: input, agentType: agentType)
        guard !subject.isEmpty else { return nil }

        return AgentRequest(agentType: agentType, subject: subject)
    }

    private func extractSubject(from input: String, agentType: Agent.AgentType) -> String {
        var cleaned = input
        let triggerWords = [
            "shop for", "buy", "find price of",
            "research", "summarize", "explain",
            "news about", "headlines for",
            "stock price of", "crypto price of", "market summary for",
        ]
        for trigger in triggerWords {
            cleaned = cleaned.replacingOccurrences(of: trigger, with: "", options: .caseInsensitive)
        }
        return cleaned.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
