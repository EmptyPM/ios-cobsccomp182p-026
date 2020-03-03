//
//  LoginViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/13/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextFieldL: UITextField!
    
    
    @IBOutlet weak var passwordTextfieldL: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var loginasGuest: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setElements()
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func setElements(){
        
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextFieldL)
        Utilities.styleTextField(passwordTextfieldL)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(loginasGuest)
    }
    

    
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        //todo validate text Fields
        
        //Create cleaned versions of the text field
        let email = emailTextFieldL.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfieldL.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //sign in  the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            
            if error != nil{
                // couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
        }
            else{
//                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? MainHomeEventViewController
//
//
//                self.view.window?.rootViewController = homeViewController
//                self.view.window?.makeKeyAndVisible()
                let HomeVCCC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVCC")
                self.present(HomeVCCC, animated: true, completion: nil)
            }
        
    }
    
}
    
    @IBAction func fogotPassword(_ sender: Any) {
        
    }
}
