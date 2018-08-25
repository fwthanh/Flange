//
//  Dropdown.swift
//  Flange
//
//  Created by Mac24h on 8/25/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Dropdown)
class Dropdown: NSObject, Mappable {
    
    var so                  : String?
    var blin                : String?
    
    required init?(map: Map){
        super.init()
        so <- map["so"]
        blin <- map["blin"]
    }
    
    func mapping(map: Map) {
        so <- map["so"]
        blin <- map["blin"]
    }
    
}
