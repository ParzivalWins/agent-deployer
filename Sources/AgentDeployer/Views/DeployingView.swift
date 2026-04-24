import SwiftUI

struct DeployingView: View {
    let agent: Agent

    @State private var isDeploying = false
    @State private var result: AgentResult?
    @State private var subject = ""

    private let agentService = AgentService()

    var body: some View {
        VStack(spacing: 12) {
            Text(agent.emoji)
                .font(.system(size: 40))

            if isDeploying {
                ProgressView()
                    .progressViewStyle(.circular)
                Text("Deploying \(agent.name)…")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            } else if let result {
                NavigationLink("View Result") {
                    ResultView(result: result)
                }
            } else {
                TextField("Subject", text: $subject)
                Button("Deploy") {
                    deploy()
                }
                .disabled(subject.isEmpty)
            }
        }
        .navigationTitle(agent.name)
    }

    private func deploy() {
        isDeploying = true
        let request = AgentRequest(agentType: agent.type, subject: subject)
        Task {
            let agentResult = await agentService.deploy(request)
            isDeploying = false
            result = agentResult
        }
    }
}
