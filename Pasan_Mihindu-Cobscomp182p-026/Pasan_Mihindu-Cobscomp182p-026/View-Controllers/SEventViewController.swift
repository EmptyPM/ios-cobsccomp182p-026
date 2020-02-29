//
//  SEventViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/24/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage

class SEventViewController: UIViewController {

    @IBOutlet weak var singleEventScrollView: UIScrollView!
    @IBOutlet weak var SingleEventUserProfileImageView: UIImageView!
    
    @IBOutlet weak var dateTimeImageView: UIImageView!
    
    @IBOutlet weak var locationImageView: UIImageView!
    
    
    
    @IBOutlet weak var EventPName: UILabel!
    
    @IBOutlet weak var EventPCreatedBy: UILabel!
    
    @IBOutlet weak var EventPDate: UILabel!
    
    @IBOutlet weak var EventPLocation: UILabel!
    
    @IBOutlet weak var EventPDescription: UILabel!
    
    @IBOutlet weak var EventPImage: UIImageView!
    
    
    
    
    var EventPImageView = UIImage()
    
    var CurrentLogedUser = ""
    
    var EventPDateNT = ""
    var EventPoName = ""
    var EventPoCreatedBy = ""
    var EventPoDescription = ""
    var EventPoLocation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CornerRadius
        
        singleEventScrollView.layer.cornerRadius = 30
        SingleEventUserProfileImageView.layer.cornerRadius = 25
        dateTimeImageView.layer.cornerRadius = 22
        locationImageView.layer.cornerRadius = 22
        
        
        //
        
        EventPDate.text = "\(EventPDateNT)"
        EventPName.text = "\(EventPoName)"
        EventPImage.image = EventPImageView
        EventPDescription.text = "\(EventPoDescription)"
        EventPLocation.text = "\(EventPoLocation)"
        EventPCreatedBy.text = "\(EventPoCreatedBy)"
        
        
        
        
//         Do any additional setup after loading the view.
//        
//        retriveUserData()
//        checkLoggedInUserStatus()

        
    }
    
    @IBAction func EditEventPostButtonClick(_ sender: Any) {
        
        
    }
//    func retriveUserData(){
//
//
//
//        guard let uid = Auth.auth().currentUser?.uid else{ return }
//
//        print(uid)
//
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("users").document(uid)
//
//        print(docRef)
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//
//                self.loggedInUser = (document.get("firstname") as! String)
//
//                if(self.loggedInUser == self.ownername.text){
//
//                    print("works")
//                    self.detailEditButton.alpha = 1
//                }else{
//
//                    self.detailEditButton.alpha = 0
//                }
//
//
//            } else {
//                print("Document does not exist")
//
//
//            }
//        }
//
//    }
//
//    fileprivate func checkLoggedInUserStatus(){
//        if Auth.auth().currentUser == nil{
//
//            detailEditButton.alpha = 0
//
//        }else{
//
//            retriveUserData()
//        }
//
//    }
//

    

}
