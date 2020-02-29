//
//  SignUpViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/13/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var profilepicimage: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var MobileNumber: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    var profileimage: UIImage? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setElements()
        
        
        
//        profile image tap
        
        
        profilepicimage.isUserInteractionEnabled = true
        let profileimgtapGesture = UITapGestureRecognizer(target: self, action: #selector(presentimgPicker))
        profilepicimage.addGestureRecognizer(profileimgtapGesture)
        
    }
    
    
    @objc func presentimgPicker(){
        
        let profileimgpicker = UIImagePickerController()
        profileimgpicker.sourceType = .photoLibrary
        profileimgpicker.allowsEditing = true
        profileimgpicker.delegate = self
        self.present(profileimgpicker, animated: true , completion: nil)
        
        
    }
    func setElements(){
        //error lable hide
        errorLabel.alpha = 0
        
        //Styles (Elements)
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(MobileNumber)
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
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            MobileNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
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
            let mobilenumber = MobileNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            guard let attachImage = self.profileimage else{
                
                print("profile pic Not Attached")
                return
            }
            guard let profileimagetype = attachImage.jpegData(compressionQuality: 0.75)else{
                
                return
            }

            //Create the user
            Auth.auth().createUser(withEmail: email , password: password) { (result, err) in
                
                
                if err != nil {
                    
                    
                    self.showError(_message: "Error create user")
                }
                else{
                 let db = Firestore.firestore()
                    
                    let dbref = Storage.storage().reference(forURL: "gs://nibmevents.appspot.com")
                    let dbProfileRef = dbref.child("profilepics").child((result?.user.uid)!)
                    
                    let profiledbmatadata = StorageMetadata()
                    profiledbmatadata.contentType = "image/jpg"
                    
                    dbProfileRef.putData(profileimagetype, metadata: profiledbmatadata, completion: { (StorageMetadata, error) in
                        
                        if error != nil
                        {
                            print(error?.localizedDescription)
                            return
                        }
                        
                        dbProfileRef.downloadURL(completion: { (url, error) in
                            
                            if let profilepicmataimageUrl = url?.absoluteString{
                                
                                db.collection("users").document(result!.user.uid).setData(["firstname" : firstName, "lastname":lastName, "email":email, "mobilenumber" : mobilenumber, "profilepicimage" : profilepicmataimageUrl, "uid": result!.user.uid]) { (error) in
                                    
                                    if error != nil{
                                        self.showError(_message: "Error saving user data")
                                    }
                                    
                                    
                                    
                                }
                                
                            }
                        })
                        
                        
                    })
                    
                    
                    
                    
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
        
        let HomeVCCC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVCC")
        self.present(HomeVCCC, animated: true, completion: nil)
        
//
//       let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? MainHomeEventViewController
//
//
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
    }
    
    
    
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let attachImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            
            profileimage = attachImage
            profilepicimage.image = attachImage
        }
        
        if let profilepicOrg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            profileimage = profilepicOrg
            profilepicimage.image = profilepicOrg
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
