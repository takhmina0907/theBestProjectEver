//
//  userModel.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/7/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import Foundation

class UserModel {
    static let sharedInstance = UserModel()
    
    func saveUserDict(dict: Dictionary<String, Any>) {
        UserDefaults.standard.set(dict, forKey: "user")
    }
    
    func removeUserDefault() {
        UserDefaults.standard.removeObject(forKey: "user")
    }
    
    var empty = [String: Any]()
    func getDataFromUserDefault() -> [String: Any] {
        let retrieveDict = UserDefaults.standard.dictionary(forKey:"user")
        if(retrieveDict != nil){
            return retrieveDict!
        }
        else{
            return empty
        }
    }
    
    func checkUserLoggedIn() -> Bool {
        if(getDataFromUserDefault().isEmpty){
            return false
        }
        else{
            return true
        }
    }
    
}
