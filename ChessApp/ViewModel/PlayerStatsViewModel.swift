import Foundation
import KZFileWatchers

@MainActor @Observable
final class PlayerStatsViewModel {
    var provider: ChessProvider
    var stats: PlayerStatsResponse.BlitzStats?
    var error: String?
    var isLoading = false
    private let fileWatcher = FileWatcher.Local(path: URL.local.appendingPathComponent("response.json").path(percentEncoded: false))
    
    init(provider: ChessProvider) {
        self.provider = provider
    }
    
    func get() async {
        do {
            let response = try await provider.fetchPlayerStats()
            print(response)
            stats = response.chess_blitz
        } catch {
            print("Error: \(error)")
            self.error = "Unable to get players: \(error.localizedDescription)"
        }
    }
    
    func onAppear() {
        watchFileChanges()
    }

    private func watchFileChanges() {
        try! fileWatcher.start(closure: { change in
            switch change {
            case .noChanges:
                break;
            case .updated:
                Task {
                    await self.get()
                }
            }
        })
    }
}
