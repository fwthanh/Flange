//
//  Posted.swift
//  Flange
//
//  Created by Mac24h on 8/26/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Posted)
class Posted: NSObject, Mappable {
    
    var spec                : String?
    var Size                : String?
    var pressure_class      : String?
    required init?(map: Map){
        super.init()
        spec <- map["spec"]
        Size <- map["Size"]
        pressure_class <- map["pressure_class"]
    }
    
    func mapping(map: Map) {
        spec <- map["spec"]
        Size <- map["Size"]
        pressure_class <- map["pressure_class"]
    }
    
}
