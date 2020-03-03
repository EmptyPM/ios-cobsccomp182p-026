//
//  EditEventViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/24/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import Firebase

class EditEventViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var editEventPageTitel: UILabel!
    @IBOutlet weak var EditEventScrollview: UIScrollView!
    @IBOutlet weak var EditEventName: UITextField!
    @IBOutlet weak var EditEventDate: UITextField!
    @IBOutlet weak var EditEventLocation: UITextField!
    @IBOutlet weak var EditEventDescription: UITextView!
    @IBOutlet weak var EditEeventSaveButton: CustomButton!
    
    
    var editedEventName = ""
    var editedEventDate = ""
    var editedEventLocation = ""
    var editedEventDescription = ""
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         EditEventScrollview.layer.cornerRadius = 30
        editEventPageTitel.text = editedEventName
        EditEventName.text = editedEventName
        EditEventDate.text = editedEventDate
        EditEventLocation.text = editedEventLocation
        EditEventDescription.text = editedEventDescription


        
    }
    

    @IBAction func EditEventSaveClick(_ sender: Any) {
        
        
        let editeventpostname = EditEventName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let editeventpostdate = EditEventDate.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let editeventpostlocation = EditEventLocation.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let editeventpostdescription = EditEventDescription.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let eventdb = Firestore.firestore()
        
        
        eventdb.collection("Events").document(editEventPageTitel.text!).updateData(["eventname": editeventpostname,
                             "eventdate":editeventpostdate , "eventlocation": editeventpostlocation , "eventDescription":editeventpostdescription]) { (error) in
                                
                                if let error = error{print(error.localizedDescription)}
                                
                                
                                let EditEventVcc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVCC")
                                self.present(EditEventVcc, animated: true, completion: nil)
                                
        }
        
    }
    

}
