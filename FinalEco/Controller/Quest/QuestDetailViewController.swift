//
//  QuestDetailViewController.swift
//  FinalEco
//
//  Created by Takhmina Talipova on 8/10/18.
//  Copyright © 2018 Takhmina Talipova. All rights reserved.
//

import UIKit
import MapKit

class QuestDetailViewController: UIViewController {
    
    
    @IBOutlet weak var QuestDetailImage: UIImageView!
    
    @IBOutlet weak var QuestDetailTitle: UILabel!
    
    @IBOutlet weak var QuestDetailDescription: UILabel!
    
    @IBOutlet weak var QuestDetailMapView: MKMapView!
    
    
    @IBAction func StartBtnPressed(_ sender: Any) {
        //add
    }
    
    var QuestdetailImage = UIImage()
    var QuestdetailTitle = " "
    var QuestdetailDescription = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 43.232698, longitude: 76.869168)
        centerMapOnLocation(location: initialLocation)
        
        QuestDetailImage.image = QuestdetailImage
        QuestDetailTitle.text = QuestdetailTitle
        QuestDetailDescription.text = QuestdetailDescription
        
        QuestDetailTitle.numberOfLines = 4
        QuestDetailDescription.numberOfLines = 1000
    
    }
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        QuestDetailMapView.setRegion(coordinateRegion, animated: true)
    }
    
    

   
}
