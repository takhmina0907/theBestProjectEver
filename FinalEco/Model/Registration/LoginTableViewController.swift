//
//  LoginTableViewController.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/7/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    
    @IBOutlet weak var PhoneTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LoginBtnTap(_ sender: Any) {
        
        let phone = PhoneTF.text!
        let password = passwordTF.text!
        
        login(phone: phone, password: password)
//        dict  = UserModel.sharedInstance.getDataFromUserDefault()
//                UserModel.sharedInstance.removeUserDefault()
        
        
    }
    
    
    var dict = [String: Any]()
    func login(phone: String, password: String){
        let json: [String: String] = ["phone": phone, "password" : password]
        
//        UserDefaults.standard.set(phone, forKey: "Phone")
//        UserDefaults.standard.set(password, forKey: "Password")
        
//        let defaults = UserDefaults.standard
//        defaults.set(phone, forKey: "Phone")
//        defaults.set(password, forKey: "Password")
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [])
        
        // create post request
        let url = URL(string: "http://192.168.137.1:8000/api/login")!
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
            if let httpStatus = response as? HTTPURLResponse {           // check for http errors
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if httpStatus.statusCode == 200{
                    if let responseJSON = responseJSON as? [String: Any] {
                        
                            
                        let id = responseJSON["id"]
                        let name = responseJSON["name"]
                        
                        self.dict = ["id": id!, "name": name!]
                        UserModel.sharedInstance.saveUserDict(dict: self.dict)
                        
                        DispatchQueue.main.async {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let controller = storyboard.instantiateViewController(withIdentifier: "tabbar")
                            self.present(controller, animated: true, completion: nil)
                        }
//                        UserDefaults.standard.set(responseJSON["id"]!, forKey: "ID")
//                        //print(defaults.object(forKey: "Phone") as? [String] ?? [String]())
//                        print(UserDefaults.standard.string(forKey: "ID"))
                    }
                }
                else{
                    print("error")
                }
                
            }
        }
        task.resume()
    }
    
 


    

}
