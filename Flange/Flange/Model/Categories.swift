//
//  Categories.swift
//  Flange
//
//  Created by Mac24h on 8/25/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Categories)
class Categories: NSObject, Mappable {
    
    var id                  : Int?
    var name                : String?
    var url_title           : String?
    var description         : String?
    var blurb               : String?
    var featured_image      : String?
    var thumb_image         : String?
    var parent_id           : Int?
    var meta_description    : String?
    var meta_keywords       : String?
    var meta_title          : String?
    var sort_order          : Int?
    var dropdown            : String?
    var so                  : String?
    var blin                : String?
    
    init(id : Int, name : String) {
        self.id   = id
        self.name   = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    required init?(map: Map){
        super.init()
        id <- map["id"]
        name <- map["name"]
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
}
