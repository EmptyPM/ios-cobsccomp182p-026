//
//  ProfilePageViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/23/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var ProfileDView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        ProfileDView.layer.cornerRadius = 10

        
    }
    

    

}
