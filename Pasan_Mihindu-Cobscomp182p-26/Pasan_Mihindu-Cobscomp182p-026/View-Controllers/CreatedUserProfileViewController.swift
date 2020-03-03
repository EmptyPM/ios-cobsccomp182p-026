//
//  CreatedUserProfileViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 3/3/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit
import Firebase


class CreatedUserProfileViewController: UIViewController {

    @IBOutlet weak var CuserprofileImageView: UIImageView!
    
    
    @IBOutlet weak var cusername: UILabel!
    
    
    @IBOutlet weak var cemail: UILabel!
    
    @IBOutlet weak var cmobilenumber: UILabel!
    
    @IBOutlet weak var cuserid: UILabel!
    
    
    @IBOutlet weak var createdbyprofile: UIImageView!
    
    var ownerid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdbyprofile.layer.cornerRadius = createdbyprofile.frame.size.width/2
        
        
        
        
        
        
        cuserid.text = ownerid
        
        
        print(cuserid.text)
        
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(cuserid.text!)
        
        print(docRef)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                
                
                
                self.cusername.text = (document.get("firstname") as! String)
                self.cmobilenumber.text = (document.get("mobilenumber" ) as! String)
                self.cemail.text = (document.get("email") as! String)
                let profile = (document.get("profilepicimage") as! String)
                self.CuserprofileImageView.kf.setImage(with: URL(string: profile), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
                
            } else {
                print("Document does not exist")
            }
        }

        
    }
    
    
    
    
    func ownerprofileData(){




    }
    

   

}
