# Agent Deployer

> **Deploy and monitor AI agents from your wrist.**

Agent Deployer is a standalone watchOS app that lets you configure, launch, and receive results from AI agents — no iPhone required. Tap or speak to dispatch an agent; get a push notification when the result is ready.

---

## Overview

Agent Deployer is a voice-first, standalone watchOS app. It connects directly to a lightweight middleware layer (no phone tethering), dispatches AI agents, and delivers structured results back via APNs push notifications.

### MVP Agent Catalog (4 Agents)

| Agent | What it does |
|---|---|
| 🛒 **Shopping** | Finds the best price / deal for a product |
| 🔍 **Research** | Returns a concise summary on any topic |
| 📰 **News** | Surfaces top headlines for a keyword or category |
| 💰 **Finance** | Fetches a stock quote, market summary, or crypto price |

---

## Development Milestones

### Milestone 1 — Shell & Connectivity
Stand up the Xcode project with a watchOS 26 standalone target, build the Agent Catalog list view, and verify direct URLSession API calls reach the middleware without an iPhone bridge.

### Milestone 2 — Voice & Intelligence
Integrate SFSpeechRecognizer / system dictation so users can speak their agent request. Build an intent parser that maps raw voice input to a structured `AgentRequest` (type + subject). Add a "Deploying…" animation state while the agent runs.

### Milestone 3 — The Callback (APNs)
Register the watch for remote push notifications independently of the iPhone. Build the background task handler that receives the agent result payload and surfaces it in a formatted result view tailored per agent type.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Platform | watchOS 26 (standalone, no WatchConnectivity) |
| UI | SwiftUI |
| Voice | SFSpeechRecognizer / AVFoundation |
| Networking | URLSession (direct Wi-Fi / LTE from watch) |
| Push | APNs (remote notifications on watchOS) |
| Middleware | Python or Node.js agent execution layer |

---

## Folder Structure

```
agent-deployer/
├── Sources/
│   └── AgentDeployer/
│       ├── App/
│       │   └── AgentDeployerApp.swift
│       ├── Models/
│       │   └── Agent.swift
│       ├── Views/
│       │   ├── CatalogView.swift
│       │   ├── DeployingView.swift
│       │   └── ResultView.swift
│       ├── Services/
│       │   ├── AgentService.swift
│       │   ├── IntentParser.swift
│       │   └── PushNotificationService.swift
│       └── Resources/
│           └── Assets.xcassets
├── Tests/
│   └── AgentDeployerTests/
└── README.md
```

---

## Getting Started

> ⚙️ Setup instructions coming in Milestone 1.

---

## License

MIT
