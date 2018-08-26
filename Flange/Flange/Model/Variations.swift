//
//  Variations.swift
//  Flange
//
//  Created by Mac24h on 8/26/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Variations)
class Variations: NSObject, Mappable {
    
    var size: String?
    var od: String?
    var t: String?
    var r: String?
    var nbh: String?
    var dh: String?
    var bc: String?
    var sb: String?
    var wb: String?
    var hb: String?
    var ht: String?
    var sl: String?
    var wl: String?
    
    required init?(map: Map){
        super.init()
        size <- map["size"]
        od <- map["od"]
        t <- map["t"]
        r <- map["r"]
        nbh <- map["nbh"]
        dh <- map["dh"]
        bc <- map["bc"]
        sb <- map["sb"]
        wb <- map["wb"]
        hb <- map["hb"]
        ht <- map["ht"]
        sl <- map["sl"]
        wl <- map["wl"]
    }
    
    func mapping(map: Map) {
        size <- map["size"]
        od <- map["od"]
        t <- map["t"]
        r <- map["r"]
        nbh <- map["nbh"]
        dh <- map["dh"]
        bc <- map["bc"]
        sb <- map["sb"]
        wb <- map["wb"]
        hb <- map["hb"]
        ht <- map["ht"]
        sl <- map["sl"]
        wl <- map["wl"]
    }
    
}
