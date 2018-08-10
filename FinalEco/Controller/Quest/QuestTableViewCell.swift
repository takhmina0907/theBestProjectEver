//
//  QuestTableViewCell.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/10/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit

class QuestTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var QuestImageView: UIImageView!
    
    @IBOutlet weak var QuestTitleLable: UILabel!
    
    @IBOutlet weak var QuestDataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
