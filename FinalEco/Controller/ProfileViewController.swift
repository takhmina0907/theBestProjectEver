//
//  ProfileViewController.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/7/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBAction func LogOutTapped(_ sender: Any) {

    UserModel.sharedInstance.removeUserDefault()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "WelcomeVC")
    self.present(controller, animated: true, completion: nil)
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}
