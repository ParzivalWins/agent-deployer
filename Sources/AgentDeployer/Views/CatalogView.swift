import SwiftUI

struct CatalogView: View {
    private let agents = Agent.catalog

    var body: some View {
        NavigationStack {
            List(agents) { agent in
                NavigationLink(value: agent) {
                    HStack {
                        Text(agent.emoji)
                            .font(.title2)
                        VStack(alignment: .leading) {
                            Text(agent.name)
                                .font(.headline)
                            Text(agent.description)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Agents")
            .navigationDestination(for: Agent.self) { agent in
                DeployingView(agent: agent)
            }
        }
    }
}

#Preview {
    CatalogView()
}
