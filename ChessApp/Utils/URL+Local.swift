import Foundation

extension URL {
    static var local: URL {
        /// filePath macro: Represents a location in the file system.
        /// components var: View the non-root components that make up this path.
        var codePath = #filePath.components(separatedBy: "/")
        // Remove last two path to move us to Local directory
        codePath.removeLast(2)
        // I want save all local JSON files inside a "Local" folder inside my project
        codePath.append("Local")
        let json = codePath.joined(separator: "/")
        return URL(fileURLWithPath: json)
    }
}
