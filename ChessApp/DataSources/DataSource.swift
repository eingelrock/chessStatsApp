import Foundation
import KZFileWatchers

struct DataSource {
    var fetch: (URL) async throws -> Data
}

extension DataSource {
    static var live: Self {
        .init(fetch: { url in
            try await URLSession.shared.data(from: url).0
        })
    }
    
    static var local: Self {
        .init(fetch: { url in
            try Data(contentsOf: URL.local.appendingPathComponent("response.json"))
        })
    }
}
