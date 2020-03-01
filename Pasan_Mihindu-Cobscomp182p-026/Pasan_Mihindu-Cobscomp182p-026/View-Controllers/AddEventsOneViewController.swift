//
//  AddEventsOneViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/24/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import Firebase
import Kingfisher


class AddEventsOneViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    

    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var createdByID: UITextField!
    
    @IBOutlet weak var EventNameTextField: UITextField!
    @IBOutlet weak var EventDateNTimeTextField: UITextField!
    @IBOutlet weak var EventCreatedByTextField: UITextField!
    @IBOutlet weak var EventDescriptionTextArea: UITextView!
    @IBOutlet weak var EventLocationTextField: UITextField!
    
    @IBOutlet weak var EventImgImageView: UIImageView!
    
    @IBOutlet weak var addEventImageButton: UIButton!
    var Eventimage: UIImage? = nil
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLbl.alpha = 0
        
        // Corner Radius
//        AddEventFromView.layer.cornerRadius = 30
        EventImgImageView.layer.cornerRadius = 20
        
        addEventImageButton.layer.cornerRadius = 5
        EventDescriptionTextArea.layer.cornerRadius = 5
        
        
        //Date picker
        
        let picker = UIDatePicker()
        
        picker.datePickerMode = .date
        
        EventDateNTimeTextField.inputView = picker
        picker.addTarget(self, action: #selector(pickerSelected(sender:)), for: .valueChanged)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        view.addGestureRecognizer(gesture)
        
        
        
        // get UserName
        
        print(createdByID.text)
        
        
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                
                
                self.EventCreatedByTextField.text = (document.get("firstname") as! String)
                self.createdByID.text = (document.get("uid") as! String)
                
             
                
            } else {
                print("Document does not exist")
            }
        }
        
        
        
        
        
    }
    
    func validateThefields() -> String? {

        //        if firstNameTextField.text?.trimmingCharacters(in: .whitespaceAndNewlines) == "" {
        //            return "Please fill in all field"
        //        }

        if EventNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventDateNTimeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventCreatedByTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventDescriptionTextArea.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventLocationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {

            return "Please fill in all fields"
        }

//        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        if Utilities.isPasswordValid(cleanedPassword) == false {
//
//            return "Please make sure your password is at least 8 characters contains special character and a numbers."
//        }



        return nil
    }
    
    @objc func pickerSelected(sender:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        EventDateNTimeTextField.text = formatter.string(from: sender.date)
        
        
    }
    
    @objc func viewTapped(sender:UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    
    @IBAction func EventAddImageButtonClick(_ sender: Any) {
        
       
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "photo Source", message: "Choose a image", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.present(imagePickerController, animated: true , completion: nil)
            }else{
                
                //                return "Camere is Not Available"
                
                print("Camera Not Availabale")
            }
            
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cansel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true , completion: nil)
        
    }
    
    
    
    
    func AddNewEvent(){
        
        guard let imageSelected = self.Eventimage else{
            
            print("profile image nil")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4)else{
            
            return
        }
        
        let Eventtitel = EventNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventDateNTime = EventDateNTimeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventCreateBy = EventCreatedByTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventPostDescription = EventDescriptionTextArea.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventHeldLocation =  EventLocationTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let createdById = createdByID.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        let metadata = StorageMetadata()
        
        let database  = Firestore.firestore()
        metadata.contentType = "image/jpg"
        let dbref = Storage.storage().reference(forURL: "gs://nibmevents.appspot.com")
        

        
        let storageProfileRef = dbref.child("Events")
        
        
        
        
        storageProfileRef.putData(imageData, metadata: metadata) { (StorageMetaData, error) in
            
            if error != nil
            {
                print(error?.localizedDescription as Any)
                return
            }
            
            storageProfileRef.downloadURL(completion: { (url, error) in
                
                if let metaImageUrl = url?.absoluteString{
                    database.collection("Events").document(Eventtitel).setData(["eventname":Eventtitel , "eventdate": eventDateNTime , "eventDescription": eventPostDescription, "ownername": eventCreateBy , "eventlocation": eventHeldLocation,"EventImageurl":metaImageUrl,"createdById": createdById]) { (error) in
                        
                        
                        if error != nil {
                            
                                print("error")
                        }else{
                            let HomeVCCC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVCC")
                            self.present(HomeVCCC, animated: true, completion: nil)
//
                        }
                        
                        
                        
                    }
                    
                    print(metaImageUrl)
                }
                
            })
            
        }
        
     
    }
    
    
    
    func addEventImage(){
        
        
    }
    
    
    func getEventOwnerName(){
        
 
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //        let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //
        //
        //        image = imageSelected
        //        eventImageView.image = imageSelected
        //        picker.dismiss(animated: true, completion: nil)
        
        
        
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            
            Eventimage = imageSelected
            EventImgImageView.image = imageSelected
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            Eventimage = imageOriginal
            EventImgImageView.image = imageOriginal
        }
        //
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showError(_message:String){
        errorLbl.text = _message
        errorLbl.alpha = 1
    }
    
    
    @IBAction func AddEventSaveButtonClick(_ sender: Any) {
        
        
        let error = validateThefields()
        
        if error != nil {
            
            showError(_message: error!)
        }else{
            AddNewEvent()
        }
        
        
    }
    
    
    }
    
    

    


