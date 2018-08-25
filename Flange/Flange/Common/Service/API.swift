//
//  Service.swift
//  FastPark
//
//  Created by PqThanh on 2/8/18.
//  Copyright © 2018 verztecsolution. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class API: NSObject {
    
    static let sharedInstance = API()
    
    func request (url: URLConvertible, method: HTTPMethod, params: [String: Any]?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            guard response.result.isSuccess else {
                completion(nil, response.result.error)
                return
            }
            guard let value = response.result.value as? [String: Any] else {
                completion(nil, nil)
                return
            }
            completion(value, nil)
        }
    }
    
    func requestAuthorized (url: URLConvertible, method: HTTPMethod, params: [String: Any]?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        
        let authHeader    = ["Authorization": "Basic \("asd")"]
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: authHeader).responseJSON { response in
            guard response.result.isSuccess else {
                completion(nil, response.result.error)
                return
            }
            guard let value = response.result.value as? [String: Any] else {
                completion(nil, nil)
                return
            }
            completion(value, nil)
        }
    }
    
    //MARK: ----Account----
    func login(email: String, password: String, gcm_id: String, completion: @escaping (_ result: Int?, _ errorMsg: String?) -> ()) -> () {
        let params = ["email" : email, "password": password, "gcm_id": gcm_id, "device_id": UIDevice.current.identifierForVendor!.uuidString, "is_login_with": "iPhone"] as [String : Any]
        request(url: Router.login, method: .post, params: params, completion: { (result, error) in
            if let result = result as? [String: Any] {
                if let userId = result["user_id"] as? Int {
                    completion(userId, nil)
                }
                else {
                    completion(nil, result["message"] as? String)
                }
            }
            else {
                completion(nil, "")
            }
        })
    }
    
    func productCategories(completion: @escaping (_ result: [Categories]?, _ errorMsg: String?) -> ()) -> () {
        request(url: Router.productCategories, method: .get, params: nil, completion: { (result, error) in
            if let result = result as? [String: Any] {
                let jsonArray = result["categories"] as! [[String : Any]]
                let categories = Mapper<Categories>().mapArray(JSONArray: jsonArray)
                completion(categories, nil)
            }
            else {
                completion(nil, "")
            }
        })
    }

}
