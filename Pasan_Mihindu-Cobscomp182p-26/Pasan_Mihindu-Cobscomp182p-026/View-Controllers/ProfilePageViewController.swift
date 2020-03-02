//
//  ProfilePageViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/23/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import Firebase
import Kingfisher
import LocalAuthentication

class ProfilePageViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileUserName: UILabel!
    
    @IBOutlet weak var profileUserEmail: UILabel!

    @IBOutlet weak var profileUserMobileNumber: UILabel!
    
    
    
    @IBOutlet weak var ProfileDView: UIView!
    @IBOutlet weak var ProdileDashboardButtonView: UIView!
    
    @IBOutlet weak var AddEventButtonView: UIView!
    
   
    
    @IBOutlet weak var MyEventsButtonView: UIView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CornerRadius
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        ProfileDView.layer.cornerRadius = 10
        
        ProdileDashboardButtonView.layer.cornerRadius = 10
        
        AddEventButtonView.layer.cornerRadius = 10
        MyEventsButtonView.layer.cornerRadius = 10
        
        
        checkLoggedStatus()
        
        
        
    }
    
    fileprivate func checkLoggedStatus(){
        
        
        if Auth.auth().currentUser == nil{
            
            DispatchQueue.main.async {
                
                
                let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomVCC")
                self.present(welcomeVC, animated: true, completion: nil)
                
                
                //                self.handleFaceIdTouchId()
                return
            }
        }else{
            appFaceIdTouchId()
            retriveUserData()
        }
        
        
    }
    @objc fileprivate func appFaceIdTouchId(){
        
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To have an access to NIBM Events we need to check your faceId/TouchID") { (wasSuccessful, error) in
                if wasSuccessful{
                    
                    self.dismiss(animated: true, completion:nil)
                    
                    
                }else{
                    Alert.AlertPopup(title: "Incorrect credentials", msg: "Please try again", vc: self)
                }
            }
            
        }else{
            Alert.AlertPopup(title: "FaceID/TouchID is not configured", msg: "Please go to settings", vc: self)
        }
    }
    
    
    @IBAction func SignOutActionClick(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let HomeVCCC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVCC")

            self.present(HomeVCCC, animated: true,completion: nil)
            
        } catch let err {
            print(err)
            
        }
        
    }
    
   
    
    
    
    
    func retriveUserData(){
        
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        
        print(uid)
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(uid)
        
        print(docRef)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
                
                
                
                self.profileUserName.text = (document.get("firstname") as! String)
                self.profileUserEmail.text = (document.get("email") as! String)
                self.profileUserMobileNumber.text = (document.get("mobilenumber") as! String)
                let profilepic = (document.get("profilepicimage") as! String)
                self.profileImageView.kf.setImage(with: URL(string: profilepic), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
                
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
    

    

}
