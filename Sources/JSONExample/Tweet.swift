//
//  Comment.swift
//  
//
//  Created by Eric Yang on 28/6/20.
//

import Foundation
import SwiftyJSON

struct Tweet: Codable {
    var comments: [Comment]
    
    init(json: JSON) {
        comments = json["comments"].arrayValue.map({ Comment(json: $0) })
    }
    
    init(dict: [String: Any]) {
        comments = (dict["comments"] as! [[String: Any]]).map({ Comment(dict: $0) })
    }
}

struct Comment: Codable {
    var replies: [String]
    
    init(json: JSON) {
        replies = json["replies"].arrayValue.map({ $0.stringValue })
    }
    
    init(dict: [String: Any]) {
        replies = dict["replies"] as! [String]
    }
}
