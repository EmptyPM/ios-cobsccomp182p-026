//
//  SEventViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/24/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class SEventViewController: UIViewController {

    @IBOutlet weak var singleEventScrollView: UIScrollView!
    @IBOutlet weak var SingleEventUserProfileImageView: UIImageView!
    
    @IBOutlet weak var dateTimeImageView: UIImageView!
    
    @IBOutlet weak var locationImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleEventScrollView.layer.cornerRadius = 30
        SingleEventUserProfileImageView.layer.cornerRadius = 25
        dateTimeImageView.layer.cornerRadius = 22
        locationImageView.layer.cornerRadius = 22

        
    }
    

    

}
