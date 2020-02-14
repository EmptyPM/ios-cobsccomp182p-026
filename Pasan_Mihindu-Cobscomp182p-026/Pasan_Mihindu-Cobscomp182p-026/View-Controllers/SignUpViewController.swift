//
//  SignUpViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/13/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

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
    
    func validateThefields() -> String? {
        
//        if firstNameTextField.text?.trimmingCharacters(in: .whitespaceAndNewlines) == "" {
//            return "Please fill in all field"
//        }
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Please make sure your password is at least 8 characters contains special character and a numbers."
        }
        
        
        
        return nil
    }
    
    
    @IBAction func signUpClick(_ sender: Any) {
        
        
        //validate fields
        let error = validateThefields()
        
        if error != nil {
            
            showError(_message: error!)
        }
        else{
            
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //Create the user
            Auth.auth().createUser(withEmail: email , password: password) { (result, err) in
                
                
                if err != nil {
                    
                    
                    self.showError(_message: "Error create user")
                }
                else{
                 let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname" : firstName, "lastname":lastName, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil{
                            self.showError(_message: "Error saving user data")
                        }
                        
                        
                        
                    }
                    
                    
                    //Transition to the home screen
                    self.trasitionToHome()
                }
            }
            
           
        }
        
        
    }
    
    func showError(_message:String){
        errorLabel.text = _message
        errorLabel.alpha = 1
    }
    
    
    func trasitionToHome(){
        
        
       let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? DashboardViewController
        
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    
    
}
