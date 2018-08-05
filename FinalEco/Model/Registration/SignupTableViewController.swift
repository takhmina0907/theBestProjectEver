//
//  SignupTableViewController.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/6/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit
import Firebase

class SignupTableViewController: UITableViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func CreateAccounttap(_ sender: Any) {
        print("hey")
        
        if emailTF.text != ""
        && (passwordTF.text?.characters.count)! > 7
        && (usernameTF.text?.characters.count)! > 7
        && fullNameTF.text != "" {
            
            let email = emailTF.text!
            let username = usernameTF.text!
            let password = passwordTF.text!
            let fullName = fullNameTF.text!
            
            // sign up
            Auth.auth().createUser(withEmail: email, password: password) { (firUser, error) in
                
                if error != nil {
                    //add alert
                    print(error)
                    print(error?.localizedDescription)
                } else if let firUser = firUser{
                    
                     let newUser = User(uid: firUser.user.uid, username: username, fullName: fullName, email: email)
                    newUser.save(completion: { (error) in
                        if error != nil{
                            print("something wrong")
                            print(error)
                        }else{
                            print("Successfuly sign up!")
                            Auth.auth().signIn(withEmail: email, password: password, completion: { (firUser, error) in
                                
                                if let error = error{
                                    print("O god..")
                                    print(error)
                                } else {
                                    self.dismiss(animated: false, completion: nil)
                                }
                            })
                        }
                    })
                }
               
            }
        }
    }
    
}
