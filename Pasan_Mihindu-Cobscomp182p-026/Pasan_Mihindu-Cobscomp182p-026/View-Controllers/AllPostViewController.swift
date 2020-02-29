//
//  AllPostViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/28/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase
import Kingfisher

struct EventPost {
    
    var EventPostName : String
    
    var EventPostDate: String
    
    var EventPostImage : String
    
    var EventPostDescription : String
    
    var EventPostLocation : String
    
    var EventPostCreatedBy : String
    
    
    
}

class AllPostViewController: UITableViewController {
    
    var EventPostArr = [EventPost](){
        
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EventPostArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell") as!
        postcellTableViewCell
        
        cell.EventPostName.text =  EventPostArr[indexPath.row].EventPostName
//        cell.EventPostDate.text = EventPostArr[indexPath.row].EventPostDate
//        cell.eventLocation.text = EventPostArr[indexPath.row].location
//        cell.ownerDescription.text = EventPostArr[indexPath.row].description
//        cell.ownerName.text = EventPostArr[indexPath.row].ownername
//        cell.ownerId.text = EventPostArr[indexPath.row].ownerid
        cell.EventPostLocation.text = EventPostArr[indexPath.row].EventPostLocation
        cell.EventPostDateTextField.text = EventPostArr[indexPath.row].EventPostDate
        cell.EventPostCreatedBy.text = EventPostArr[indexPath.row].EventPostCreatedBy
        cell.EventPostDescription.text = EventPostArr[indexPath.row].EventPostDescription
        
        
//
//        let PostImage = URL(string: EventPostArr[indexPath.row].imageUrl )
//        let EventPostImages = cell.EventImageView.kf.setImage(with: PostImage)
//        let imagesURLS = URL(string: EventPostArr[indexPath.row].EventPostImage)
//        let eventimages = cell.EventPostImageView.kf.setImage(with: imagesURLS)
        
        
        let postImageurl = URL(string: EventPostArr[indexPath.row].EventPostImage)
        let EventPostimg = cell.EventPostImageView.kf.setImage(with: postImageurl);
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let SViewController = storyboard?.instantiateViewController(withIdentifier: "SEventVC") as? SEventViewController


//        vc?.date = EventPostArr[indexPath.row].EventPostName
//        vc?.name = EventPostArr[indexPath.row].eventname
//        vc?.descriptionn = EventPostArr[indexPath.row].description
//        vc?.location = EventPostArr[indexPath.row].location
//        vc?.ownernamee = EventPostArr[indexPath.row].ownername
        
        SViewController?.EventPDateNT = EventPostArr[indexPath.row].EventPostDate
        SViewController?.EventPoName = EventPostArr[indexPath.row].EventPostName
        SViewController?.EventPoCreatedBy = EventPostArr[indexPath.row].EventPostCreatedBy
        SViewController?.EventPoDescription = EventPostArr[indexPath.row].EventPostDescription
        SViewController?.EventPoLocation = EventPostArr[indexPath.row].EventPostLocation
        



        self.navigationController?.pushViewController(SViewController!, animated: true)
    }
    
    func getAllData(){
        
        let db = Firestore.firestore()
        db.collection("Events").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    
                    let EventPosttitel = document.data()["eventname"] as? String
                    
                    let EventPostDateNTime = document.data()["eventdate"] as? String
                    
                    let EventPostDes = document.data()["eventDescription"] as? String
                    
                    let EventPostHLocation = document.data()["eventlocation"] as! String
                    
                    let EventPostCreatedB = document.data()["ownername"] as! String
                    
                    
                    
                    let EventPostImageUrl =  document.data()["EventImageurl"] as? String
                    
                    
                    
                    let EventPosts = EventPost(EventPostName: EventPosttitel!, EventPostDate: EventPostDateNTime!, EventPostImage: EventPostImageUrl!, EventPostDescription: EventPostDes!, EventPostLocation: EventPostHLocation, EventPostCreatedBy: EventPostCreatedB)
                    
                    self.EventPostArr.append(EventPosts)
                    
                    self.tableView.reloadData()
                    
                    
                }
            }
            
           
        }
        
        
    }
    
    
    
    
    

    

    

}
