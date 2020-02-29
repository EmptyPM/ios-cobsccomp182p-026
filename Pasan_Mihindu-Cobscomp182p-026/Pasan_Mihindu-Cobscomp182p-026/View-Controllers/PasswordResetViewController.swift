//
//  PasswordResetViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/21/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore




class PasswordResetViewController: UIViewController {
    
    
    @IBOutlet weak var PREmailTextField: UITextField!
    
    @IBOutlet weak var ESentButton: UIButton!
    
    
    @IBOutlet weak var errorLable: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLable.alpha = 0

        // Do any additional setup after loading the view.
    }
    

    @IBAction func emailSentClick(_ sender: Any) {
       let passwordresetEmailText = PREmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pswerrorMessage = validateTextFields()
        if pswerrorMessage != nil{
            showErrorMessage(pswerrorMessage!)
        } else{
            
            resetPassword(email: passwordresetEmailText, onSuccess: {
                self.view.endEditing(true)
                self.navigationController?.popViewController(animated: true)
            }) { (pswerrorMessage) in
                self.showErrorMessage(pswerrorMessage)
            }
            
        }
    }
    
    func showErrorMessage(_ pswerrorMessage:String){
        errorLable.text = pswerrorMessage
        errorLable.alpha = 1
    }
    
    func validateTextFields() -> String? {
        if PREmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter an email address for password reset"
        }
        
        let resetEmailValid = PREmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        return nil
        
    }
    
    func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping(_ _errorMessahe: String) -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil{
                onSuccess()
            }else{
                onError(error!.localizedDescription)
            }
        }
        
    }

}
