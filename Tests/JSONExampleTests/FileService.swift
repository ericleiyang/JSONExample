//
//  FileService.swift
//  
//
//  Created by Eric Yang on 28/6/20.
//

import Foundation

struct FileService {
    private static let resourceFolder: String = "Resources"
    private static let sourceFile: StaticString = #file
    
    static func read(from JSONfile: String) -> Data? {
        let path = filePath(name: JSONfile, type: "json")
        do {
            let data = try Data(contentsOf: path, options: .alwaysMapped)
            return data
        } catch {
            // handle error
        }
        return nil
    }
        
    static func filePath(name: String, type: String) -> URL {
        let fileURL = URL(fileURLWithPath: "\(sourceFile)", isDirectory: false)
        let folderURL = fileURL.deletingLastPathComponent()
        let resourcesFolderURL = folderURL.appendingPathComponent(resourceFolder, isDirectory: true)
        let url = resourcesFolderURL.appendingPathComponent("\(name).\(type)", isDirectory: false)
        return url
    }
}
