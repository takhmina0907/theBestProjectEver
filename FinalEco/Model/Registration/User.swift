//
//  User.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/6/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import Foundation

class User {
    
    var username: String
    let uid: String
    var fullName: String
    var email: String
    
    init(uid: String, username: String, fullName: String, email: String) {
        self.uid = uid
        self.username = username
        self.fullName = fullName
        self.email = email
    }
    
    func save(completion: @escaping (Error?) -> Void){
        
        // 1. reference to the database
        let ref = DReference.users(uid: uid).reference()
        
        // 2. setValue of the reference
        ref.setValue(toDictionary())
        print("success")
        
    }
    
    func toDictionary()->[String : Any]
    {
        return [
            "uid": uid,
            "username": username,
            "fullName": fullName,
            "email": email
        ]
    }
}
