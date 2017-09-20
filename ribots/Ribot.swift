//
//  Ribots.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit

class Ribot {
    var id : String
    var email: String
    var avatar: String?
    var dateOfBirth: String?
    var hexColor: String?
    var bio: String?
    var isActive: Bool
    var name: Name
    
    init(dic: NSDictionary) {
        //Let's assume that id and email are mandatory params
        id = dic["id"] as! String
        email = dic["email"] as! String
        
        avatar = dic["avatar"] as? String
        dateOfBirth = dic["dateOfBirth"] as? String
        hexColor = dic["hexColor"] as? String
        bio = dic["bio"] as? String
        isActive = dic["isActive"] as! Bool
        name = Name(dic: dic["name"] as! NSDictionary)
    }
}
