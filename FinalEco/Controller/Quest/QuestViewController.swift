//
//  QuestViewController.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/10/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var quest: [OurQuests] = [
        
        OurQuests.init(QuestTitle: "Все ради природы!", QuestDescription: "В данном квесте предстоит собрать мусор в нескольких частях улицы Абая! На указанном месте будет ждать волонтер-куратор который будет проверять вашу работу, а так же будет следить за тем, чтобы вы не заскучали! В конце игры вас ждет приз от нас! Удачи! ", QuestImage: UIImage(named: "emma-simpson-153970-unsplash"), QuestData: "13.08.18"),
        OurQuests.init(QuestTitle: "За чистый дом! За чистый город!", QuestDescription: "В данном квесте придеться прогулять по одной из самых известных улиц - Шаляпина. На указанном месте будет ждать волонтер-куратор который будет проверять вашу работу, а так же будет следить за тем, чтобы вы не заскучали! В конце игры вас ждет приз от нас! Удачи! И помните вы наше будущее!", QuestImage: UIImage(named: "micah-hallahan-27755-unsplash"), QuestData: "15.08.18")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var QuestTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quest.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QuestTableView.dequeueReusableCell(withIdentifier: "myQuest", for: indexPath) as! QuestTableViewCell
        
        cell.QuestTitleLable.text = quest[indexPath.row].QuestTitle
        cell.QuestImageView.image = quest[indexPath.row].QuestImage
        cell.QuestDataLabel.text = quest[indexPath.row].QuestData
        cell.QuestTitleLable.numberOfLines = 4
        
        print("success")
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToDetail"{
            let QuestDetailVC: QuestDetailViewController = segue.destination as! QuestDetailViewController
            QuestDetailVC.QuestdetailTitle = quest[(QuestTableView.indexPathForSelectedRow?.row)!].QuestTitle
            QuestDetailVC.QuestdetailDescription = quest[(QuestTableView.indexPathForSelectedRow?.row)!].QuestDescription
            QuestDetailVC.QuestdetailImage = quest[(QuestTableView.indexPathForSelectedRow?.row)!].QuestImage
           
            
        }
    }

}
