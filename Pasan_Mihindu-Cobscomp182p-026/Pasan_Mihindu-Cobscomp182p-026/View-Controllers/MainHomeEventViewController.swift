//
//  MainHomeEventViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by user164673 on 2/24/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class MainHomeEventViewController: UIViewController {

    @IBOutlet weak var latestEventImageView: UIImageView!
    
    @IBOutlet weak var latestEventOverView: UIView!
    
    
    @IBOutlet weak var UpcomingEventOneImageView: UIImageView!
    
    
    @IBOutlet weak var UpcomingEventtwoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latestEventImageView.layer.cornerRadius = 30
        latestEventOverView.layer.cornerRadius = 30
        UpcomingEventOneImageView.layer.cornerRadius = 25
        UpcomingEventtwoImageView.layer.cornerRadius = 25
        
    }
    

    

}
