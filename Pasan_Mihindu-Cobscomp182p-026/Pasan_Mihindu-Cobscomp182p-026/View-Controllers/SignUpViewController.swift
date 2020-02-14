//
//  SignUpViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/13/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setElements()
    }
    
    func setElements(){
        //error lable hide
        errorLabel.alpha = 0
        
        //Styles (Elements)
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func signUpClick(_ sender: Any) {
    }
    
}
