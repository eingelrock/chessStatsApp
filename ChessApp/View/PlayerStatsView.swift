import SwiftUI

@MainActor
struct PlayerStatsView: View {
    @State var viewModel: PlayerStatsViewModel

    init() {
        let provider = ChessProvider(dataSource: .local, transform: JSONTransformer())
        self.viewModel = .init(provider: provider)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            PlayerStatsBannerView()
            VStack {
                if let stats = viewModel.stats {
                    VStack(spacing: 40) {
                        PlayerStatCard(statType: .win, stat: stats.record.win)
                        HStack(spacing: 40) {
                            PlayerStatCard(statType: .loss, stat: stats.record.loss)
                            PlayerStatCard(statType: .draw, stat: stats.record.draw)
                        }
                    }
                } else {
                    Text("Can not recover data")
                }
            }
            .task {
                print("Inside task")
                await viewModel.get()
            }
            .onAppear(perform: {
                viewModel.onAppear()
        })
        }
    }
}

#Preview {
    PlayerStatsView()
}
