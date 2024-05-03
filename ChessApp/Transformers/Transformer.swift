import Foundation

protocol DataTransformer<Input, Output> {
    associatedtype Input
    associatedtype Output
    
    func transform(data: Input) throws -> Output
}

struct JSONTransformer<Model: Decodable>: DataTransformer {
    func transform(data: Data) throws -> Model {
        let decoder = JSONDecoder()
        return try decoder.decode(Model.self, from: data)
    }
}
