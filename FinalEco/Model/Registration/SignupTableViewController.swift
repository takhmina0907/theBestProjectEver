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
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//            if user != nil{
//                //something
//            }else{
//                self.performSegue(withIdentifier: "ShowTabView", sender: nil)
//            }
//        }
//    } user default shared instance
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func CreateAccounttap(_ sender: Any) {
        print("hey")
        if emailTF.text != " "
            && (passwordTF.text?.characters.count)! > 7
            && (usernameTF.text?.characters.count)! > 7
            && fullNameTF.text != " " {
            
            
            
            let email = emailTF.text! //phone
            let username = usernameTF.text!
            let password = passwordTF.text!
            let fullName = fullNameTF.text!
            register(phone: email, password: username, name: fullName, c_password: password)
            
        }//else
        if (passwordTF.text?.characters.count)! < 7 {
            let alert = UIAlertController(title: "Error!",
                                          message: "Password must be greater than 7 characters!",
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }


    }
    
    func register(phone: String, password: String, name: String,c_password: String){
        let json: [String: String] = ["phone": phone, "password" : password, "name": name, "c_password": c_password]
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [])
        
        // create post request
        let url = URL(string: "http://192.168.137.1:8000/api/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // insert json data to the request
        request.httpBody = jsonData
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)//if success go to login 
                
            }
            
        }
        task.resume()
    }
    
    
    
    
    
}
