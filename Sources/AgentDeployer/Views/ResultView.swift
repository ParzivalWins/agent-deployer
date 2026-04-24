import SwiftUI

struct ResultView: View {
    let result: AgentResult

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Label(
                    result.agentType.rawValue.capitalized,
                    systemImage: "checkmark.circle.fill"
                )
                .font(.headline)
                .foregroundStyle(.green)

                Text(result.subject)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Divider()

                Text(result.summary)
                    .font(.body)

                Text(result.timestamp, style: .relative)
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
            .padding()
        }
        .navigationTitle("Result")
    }
}
