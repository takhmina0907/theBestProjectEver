//
//  Quests.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/10/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import Foundation
import UIKit

struct OurQuests {
    var QuestTitle: String
    var QuestDescription: String
    var QuestImage: UIImage!
    var QuestData: String
    
    
    init(QuestTitle: String, QuestDescription: String, QuestImage: UIImage!, QuestData: String) {
        self.QuestTitle = QuestTitle
        self.QuestDescription = QuestDescription
        self.QuestImage = QuestImage
        self.QuestData = QuestData
    }
}
