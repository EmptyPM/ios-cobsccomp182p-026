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
    
    
    @IBOutlet weak var cretedById: UILabel!
    
    @IBOutlet weak var editeventpobutton: UIButton!
    @IBOutlet weak var EventPName: UILabel!
    
    @IBOutlet weak var EventPCreatedBy: UILabel!
    
    @IBOutlet weak var EventPDate: UILabel!
    
    @IBOutlet weak var EventPLocation: UILabel!
    
    @IBOutlet weak var EventPDescription: UILabel!
    
    @IBOutlet weak var EventPImage: UIImageView!
    
    @IBOutlet weak var sEventLikeButton: UIButton!
    
    @IBOutlet weak var sEventShareButton: UIButton!
    
    @IBOutlet weak var GoingButton: UIButton!
    
    var EventPImageView = UIImage()
    
    var CurrentLogedUser = ""
    
    var EventPDateNT = ""
    var EventPoName = ""
    var EventPoCreatedBy = ""
    var EventPoDescription = ""
    var EventPoLocation = ""
    var EventPoImageU = ""
    var EventCreatedById = ""
    
    
    var editEventpName = ""
    var editEventpDate = ""
    var editEventpLocation = ""
    var editEventDescription = ""
    
    var currentUser = ""
    
    let uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cretedById.alpha = 0
        // current user loggedin
        
        currentLoggedUser()
      
        
        // CornerRadius
        GoingButton.layer.cornerRadius = 10
        
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
        cretedById.text = "\(EventCreatedById)"
        
      
        
        let posteventimageurl = URL(string: "\(EventPoImageU)")
        EventPImage.kf.setImage(with: posteventimageurl)
        
        
       
        
        
        // get profile pic
        
    
        let Userprofile = Firestore.firestore()
        
        let orofileRef = Userprofile.collection("users").document(cretedById.text!)
        
        
        orofileRef.getDocument { (document, error) in
            if let document = document, document.exists {
                _ = document.data().map(String.init(describing:)) ?? "nil"
                //                print("Document data: \(dataDescription)")
                
                let profilepic = (document.get("profilepicimage") as! String)
                self.SingleEventUserProfileImageView.kf.setImage(with: URL(string: profilepic), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
                
            } else {
                print("Document does not exist")
                
                
            }
        }
      
        
//         button hiddn
        
        guard let currentUser = Auth.auth().currentUser?.uid else{ return }
        
        
        
        let Eventdb = Firestore.firestore()
        
        let usertableref = Eventdb.collection("users").document(currentUser)
        
        usertableref.getDocument { (document, error) in
            if let document = document, document.exists {
                _ = document.data().map(String.init(describing:)) ?? "nil"
                //                print("Document data: \(dataDescription)")
                
                self.currentUser = (document.get("firstname") as! String)
                
                if(self.currentUser == self.EventPCreatedBy.text){
                    
                    self.editeventpobutton.alpha = 1
                }else{
                    
                    self.editeventpobutton.alpha = 0
                }
                
            } else {
                print("Document does not exist")
                
                
            }
        }
        
        
        
        
        
        
        

        
    }
    
    @IBAction func EditEventPostButtonClick(_ sender: Any) {
        editEventpName = EventPName.text!
        editEventpDate = EventPDate.text!
        editEventpLocation = EventPLocation.text!
        editEventDescription = EventPDescription.text!
        
        performSegue(withIdentifier: "EventEditViewConnection", sender: self)

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let EditVCC = segue.destination as! EditEventViewController
        EditVCC.editedEventName = self.editEventpName
        EditVCC.editedEventDate = self.editEventpDate
        EditVCC.editedEventLocation = self.editEventpLocation
        EditVCC.editedEventDescription = self.editEventDescription
    }


    
    
    fileprivate func currentLoggedUser(){
        if Auth.auth().currentUser == nil{
            
            self.editeventpobutton.alpha = 0
            
            
        }
        
    }
    
    
  
}
