//
//  User.swift
//  Flange
//
//  Created by PqThanh on 8/21/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(User)
class User: NSObject, NSCoding, Mappable {
    
    var code   : String?
    var name   : String?
    
    init(code : String, name : String) {
        self.code   = code
        self.name   = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.code = aDecoder.decodeObject(forKey: "code") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(code, forKey: "code")
        aCoder.encode(name, forKey: "name")
    }
    
    required init?(map: Map){
        super.init()
        code <- map["code"]
        name <- map["name"]
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        name <- map["name"]
    }
    
}
