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
    var desc                : String?
    var blurb               : String?
    var featured_image      : String?
    var thumb_image         : String?
    var parent_id           : Int?
    var meta_description    : String?
    var meta_keywords       : String?
    var meta_title          : String?
    var sort_order          : Int?
    var dropdown            : Dropdown?
    
    required init?(map: Map){
        super.init()
        id <- map["id"]
        name <- map["name"]
        url_title <- map["url_title"]
        desc <- map["desc"]
        blurb <- map["blurb"]
        featured_image <- map["featured_image"]
        thumb_image <- map["thumb_image"]
        parent_id <- map["parent_id"]
        meta_description <- map["meta_description"]
        meta_keywords <- map["meta_keywords"]
        meta_title <- map["meta_title"]
        sort_order <- map["sort_order"]
        dropdown <- map["dropdown"]
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        url_title <- map["url_title"]
        desc <- map["desc"]
        blurb <- map["blurb"]
        featured_image <- map["featured_image"]
        thumb_image <- map["thumb_image"]
        parent_id <- map["parent_id"]
        meta_description <- map["meta_description"]
        meta_keywords <- map["meta_keywords"]
        meta_title <- map["meta_title"]
        sort_order <- map["sort_order"]
        dropdown <- map["dropdown"]
    }
    
}
