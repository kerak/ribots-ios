//
//  API.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import Alamofire

class API {
    static var baseURL = "https://api.ribot.io"
    
    class func getRibots(completion:@escaping (Bool, [Ribot]?) ->()) {
        
        Alamofire.request("\(baseURL)/ribots", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print("response: \(response)")
            if response.result.isFailure
            {
                completion(false, nil)
                return
            }
            if let JSONArray : [AnyObject] = response.result.value as? [AnyObject] {
                print("JSON: \(JSONArray)")
                var ribots : [Ribot] = [Ribot]()
                for object in JSONArray {
                    if let object = object as? [String: AnyObject] {
                        if let profile : [String: AnyObject] = object["profile"] as? [String : AnyObject] {
                            ribots.append(Ribot(dic: profile as NSDictionary))
                        }
                    }
                }
                    
                completion(true, ribots)
            }
        }
    }
}
