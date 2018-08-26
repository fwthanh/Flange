//
//  Router.swift
//  Folotrail
//
//  Created by Phan Quoc Thanh on 9/1/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public enum Router: URLConvertible {
    
    static let urlHostString = "https://www.cabinc.com/"
    static let baseURLString = "https://www.cabinc.com/api/"

    //Store authenication token
    static var OAuthToken: String?
    
    case search
    case productCategories
    
    var path: String {
        switch self {
        case .search:
            return "search"
        case .productCategories:
            return "product_categories"
        }
    }
    
    public func asURL() throws -> URL {
        let url = try Router.baseURLString.asURL().appendingPathComponent(path)
        return url
    }
}


