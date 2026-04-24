import Testing
@testable import AgentDeployer

struct AgentDeployerTests {
    @Test func catalogContainsFourAgents() {
        #expect(Agent.catalog.count == 4)
    }

    @Test func catalogAgentTypesAreUnique() {
        let types = Agent.catalog.map(\.type)
        #expect(Set(types).count == types.count)
    }

    @Test func intentParserRecognizesShopping() {
        let parser = IntentParser()
        let result = parser.parse("Shop for wireless headphones")
        #expect(result != nil)
        #expect(result?.agentType == .shopping)
    }

    @Test func intentParserRecognizesResearch() {
        let parser = IntentParser()
        let result = parser.parse("Research quantum computing")
        #expect(result != nil)
        #expect(result?.agentType == .research)
    }

    @Test func intentParserRecognizesNews() {
        let parser = IntentParser()
        let result = parser.parse("News about technology")
        #expect(result != nil)
        #expect(result?.agentType == .news)
    }

    @Test func intentParserRecognizesFinance() {
        let parser = IntentParser()
        let result = parser.parse("Stock price of AAPL")
        #expect(result != nil)
        #expect(result?.agentType == .finance)
    }

    @Test func intentParserReturnsNilForUnknownInput() {
        let parser = IntentParser()
        let result = parser.parse("Hello world")
        #expect(result == nil)
    }
}
