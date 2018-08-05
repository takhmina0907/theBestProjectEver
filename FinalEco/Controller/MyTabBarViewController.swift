//
//  MyTabBarViewController.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/6/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit
import Firebase

class MyTabBarViewController: UITabBarController {
    
    static let mySegue = "mySegue"

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
                //something
            }else{
                self.performSegue(withIdentifier: "mySegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}

