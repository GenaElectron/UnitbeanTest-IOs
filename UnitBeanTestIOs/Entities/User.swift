//
//  User.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 30.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct User {
    var id: Int?
    var name: String?
    
    init(fromDictionary dict: Dictionary<String, Any>?) {
        guard let dict = dict else {return}
        
        id = dict["id"] as? Int ?? 0
        name = dict["name"] as? String ?? ""
    }
}
