//
//  Specs.swift
//  Flange
//
//  Created by Mac24h on 8/26/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Specs)
class Specs: NSObject, Mappable {
    
    var label         : String?
    var abbr          : String?
    var diagabbr      : String?
    required init?(map: Map){
        super.init()
        label <- map["label"]
        abbr <- map["abbr"]
        diagabbr <- map["diagabbr"]
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        abbr <- map["abbr"]
        diagabbr <- map["diagabbr"]
    }
    
}
