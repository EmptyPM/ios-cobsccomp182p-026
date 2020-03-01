//
//  ProfileEditViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/23/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    @IBOutlet weak var editProfileImageView: UIImageView!
    
    @IBOutlet weak var SbuttonEditprofile: CustomButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editProfileImageView.layer.cornerRadius = editProfileImageView.frame.size.width/2
        
//        Utilities.styleFilledButton(SbuttonEditprofile)

        
        
    }
    

    
}
