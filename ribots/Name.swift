//
//  Name.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit

class Name: NSObject {
    var firstName: String?
    var lastName: String?
    
    init(dic: NSDictionary) {
        self.firstName = dic["first"] as? String
        self.lastName = dic["last"] as? String
    }
}
