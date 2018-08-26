//
//  Products.swift
//  Flange
//
//  Created by Mac24h on 8/26/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Products)
class Products: NSObject, Mappable {
    
    var id: String?
    var name: String?
    var display_name: String?
    var url_title: String?
    var desc: String?
    var blurb: String?
    var featured_image: String?
    var featured_image_class: String?
    var thumb_image: String?
    var pdf: String?
    var gallery: String?
    var sku: String?
    var base_price: String?
    var sale_discount: String?
    var sale_price: String?
    var meta_title: String?
    var meta_keywords: String?
    var meta_description: String?
    var reviews: String?
    var sort_order: String?
    var inventory_status: Int?
    var weight: String?
    var length: String?
    var width: String?
    var height: String?
    var specs: [Specs]?
    var variations: [Variations]?
    var pressure_class: String?
    var search_pressure_class: String?
    var notes: String?
    var header_notes: String?
    var table_header_notes: String?
    var product_category: String?
    
    required init?(map: Map){
        super.init()
        id <- map["id"]
        name <- map["name"]
        display_name <- map["display_name"]
        url_title <- map["url_title"]
        desc <- map["desc"]
        blurb <- map["blurb"]
        featured_image <- map["featured_image"]
        featured_image_class <- map["featured_image_class"]
        thumb_image <- map["thumb_image"]
        pdf <- map["pdf"]
        gallery <- map["gallery"]
        sku <- map["sku"]
        base_price <- map["base_price"]
        sale_discount <- map["sale_discount"]
        sale_price <- map["sale_price"]
        meta_title <- map["meta_title"]
        meta_keywords <- map["meta_keywords"]
        meta_description <- map["meta_description"]
        reviews <- map["reviews"]
        sort_order <- map["sort_order"]
        inventory_status <- map["inventory_status"]
        weight <- map["weight"]
        length <- map["length"]
        width <- map["width"]
        height <- map["height"]
        specs <- map["specs"]
        variations <- map["variations"]
        pressure_class <- map["pressure_class"]
        search_pressure_class <- map["search_pressure_class"]
        notes <- map["notes"]
        header_notes <- map["header_notes"]
        table_header_notes <- map["table_header_notes"]
        product_category <- map["product_category"]
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        display_name <- map["display_name"]
        url_title <- map["url_title"]
        desc <- map["desc"]
        blurb <- map["blurb"]
        featured_image <- map["featured_image"]
        featured_image_class <- map["featured_image_class"]
        thumb_image <- map["thumb_image"]
        pdf <- map["pdf"]
        gallery <- map["gallery"]
        sku <- map["sku"]
        base_price <- map["base_price"]
        sale_discount <- map["sale_discount"]
        sale_price <- map["sale_price"]
        meta_title <- map["meta_title"]
        meta_keywords <- map["meta_keywords"]
        meta_description <- map["meta_description"]
        reviews <- map["reviews"]
        sort_order <- map["sort_order"]
        inventory_status <- map["inventory_status"]
        weight <- map["weight"]
        length <- map["length"]
        width <- map["width"]
        height <- map["height"]
        specs <- map["specs"]
        variations <- map["variations"]
        pressure_class <- map["pressure_class"]
        search_pressure_class <- map["search_pressure_class"]
        notes <- map["notes"]
        header_notes <- map["header_notes"]
        table_header_notes <- map["table_header_notes"]
        product_category <- map["product_category"]
    }
    
}
