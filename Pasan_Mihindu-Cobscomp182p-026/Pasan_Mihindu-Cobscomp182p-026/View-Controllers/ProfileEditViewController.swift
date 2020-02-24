//
//  ProfileEditViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/23/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    @IBOutlet weak var editProfileImageView: UIImageView!
    
    
    @IBOutlet weak var sButtonAction: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editProfileImageView.layer.cornerRadius = editProfileImageView.frame.size.width/2

        
        
    }
    

    
}
