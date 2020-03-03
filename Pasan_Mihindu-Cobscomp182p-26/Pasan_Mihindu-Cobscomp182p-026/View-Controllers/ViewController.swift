//
//  ViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/13/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var SignInAsGuest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setElements()
        
    }
    
    func setElements(){
        
 Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(SignInAsGuest)
    }


}

