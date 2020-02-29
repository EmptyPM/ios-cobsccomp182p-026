//
//  post.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/28/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import Foundation
import  UIKit

class post {
    var EventPostImage: UIImage
    var EventPostName: String
    var EventPostDescription: String
    var EventPostDate: String
    var EVentPostLocation: String
    var EventPostCreatedBy : String

    
    init(EventPostImage: UIImage , EventPostName:String , EventPostDate:String , EVentPostLocation:String , EventPostCreatedBy:String , EventPostDescription:String) {
        
        self.EventPostImage = EventPostImage
        self.EventPostName = EventPostName
        self.EventPostDate = EventPostDate
        self.EventPostCreatedBy = EventPostCreatedBy
        self.EventPostDescription = EventPostDescription
        self.EVentPostLocation = EVentPostLocation
        

    }
}
