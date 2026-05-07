import Foundation
import UserNotifications

/// Manages APNs registration and incoming push notifications on watchOS.
/// Registers the watch independently — no iPhone required.
@MainActor
final class PushNotificationService: NSObject, UNUserNotificationCenterDelegate {
    static let shared = PushNotificationService()

    private override init() {
        super.init()
    }

    func requestAuthorization() async -> Bool {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        do {
            return try await center.requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            return false
        }
    }

    // MARK: - UNUserNotificationCenterDelegate

    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        [.banner, .sound]
    }

    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        let userInfo = response.notification.request.content.userInfo
        handlePushPayload(userInfo)
    }

    private nonisolated func handlePushPayload(_ userInfo: [AnyHashable: Any]) {
        guard let data = try? JSONSerialization.data(withJSONObject: userInfo),
              let _ = try? JSONDecoder().decode(AgentResult.self, from: data) else {
            return
        }
    }
}
