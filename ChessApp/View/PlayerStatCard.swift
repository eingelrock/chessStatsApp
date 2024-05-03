//
//  PlayerStatCard.swift
//  ChessApp
//
//  Created by Angel on 5/5/24.
//

import SwiftUI

struct PlayerStatCard: View {
    let statType: PlayerStatType
    let stat: Int
    
    var body: some View {
        VStack {
            Group {
                switch statType {
                case .win:
                    Text("🏆")
                case .loss:
                    Text("🥲")
                case .draw:
                    Text("😕")
                }
            }
            .font(.system(size: 40))
            Text(getStatText(statType: statType, stat: stat))
                .bold()
        }
        .padding()
        .clipShape(.rect(cornerRadius: 6))
        .background {
            Rectangle()
                .fill(.white
                .shadow(.inner(radius: 1, x: -1, y: -1)))
        }
    }

    private func getStatText(statType: PlayerStatType, stat: Int) -> String {
        switch statType {
        case .win:
            "Win \(stat)"
        case .loss:
            "Loss \(stat)"
        case .draw:
            "Draw \(stat)"
        }
    }
}

enum PlayerStatType {
    case win
    case loss
    case draw
}

#Preview {
    Group {
        PlayerStatCard(statType: .win, stat: 6)
        PlayerStatCard(statType: .loss, stat: 4)
        PlayerStatCard(statType: .draw, stat: 1)
    }
}
