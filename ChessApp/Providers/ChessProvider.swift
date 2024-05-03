import Foundation

struct PlayerStatsResponse: Decodable {
    let chess_blitz: BlitzStats
    
    struct BlitzStats: Decodable {
        let record: Record
    }
    struct Record: Decodable {
        let win: Int
        let loss: Int
        let draw: Int
    }
}

struct ChessProvider {
    let dataSource: DataSource
    let transform: (Data) throws -> PlayerStatsResponse
    
    init<Transformer: DataTransformer>(dataSource: DataSource, transform: Transformer)  where Transformer.Input == Data, Transformer.Output == PlayerStatsResponse {
        self.dataSource = dataSource
        self.transform = {
            try transform.transform(data: $0)
        }
    }
    
    func fetchPlayerStats(username: String = "0blivi0usspy") async throws -> PlayerStatsResponse {
        let url = "https://api.chess.com/pub/player/\(username)/stats"
        
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        let result = try await dataSource.fetch(url)
        return try transform(result)
    }
}
