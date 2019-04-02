//
//  Comment.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 30.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct Comment {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    var dateUnix: TimeInterval = Date().timeIntervalSince1970
    
    init(fromDictionary dict: Dictionary<String, Any>?) {        
        guard let dict = dict else {return}
        
        postId = dict["postId"] as? Int ?? 0
        id = dict["id"] as? Int ?? 0
        name = dict["name"] as? String ?? ""
        email = dict["email"] as? String ?? ""
        body = dict["body"] as? String ?? ""
    }
}
