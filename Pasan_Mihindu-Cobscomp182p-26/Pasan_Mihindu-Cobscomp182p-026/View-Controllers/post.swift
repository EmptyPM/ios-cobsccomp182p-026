//
//  post.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/28/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
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
    var EventCreatedById : String

    
    init(EventPostImage: UIImage , EventPostName:String , EventPostDate:String , EVentPostLocation:String , EventPostCreatedBy:String , EventPostDescription:String , EventCreatedById: String) {
        
        self.EventPostImage = EventPostImage
        self.EventPostName = EventPostName
        self.EventPostDate = EventPostDate
        self.EventPostCreatedBy = EventPostCreatedBy
        self.EventPostDescription = EventPostDescription
        self.EVentPostLocation = EVentPostLocation
        self.EventCreatedById = EventCreatedById
        

    }
}
