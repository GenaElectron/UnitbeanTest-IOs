//
//  Post.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 30.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct Post {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    var dateUnix: TimeInterval = Date().timeIntervalSince1970
    
    init(fromDictionary dict: Dictionary<String, Any>?) {
        guard let dict = dict else {return}
        
        userId = dict["userId"] as? Int ?? 0
        id = dict["id"] as? Int ?? 0
        title = dict["title"] as? String ?? ""
        body = dict["body"] as? String ?? ""
    }
}



