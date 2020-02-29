//
//  postcellTableViewCell.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/28/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class postcellTableViewCell: UITableViewCell {

//    @IBOutlet weak var EventPostImageView: UIView!
//    @IBOutlet weak var EventPostName: UILabel!
//    @IBOutlet weak var EventPostDateTextField: UILabel!
//    @IBOutlet weak var EventPostLocation: UILabel!
//    @IBOutlet weak var EventPostDescription: UILabel!
//    @IBOutlet weak var EventPostCreatedBy: UILabel!
    @IBOutlet weak var EventPostImageView: UIImageView!
    @IBOutlet weak var EventPostName: UILabel!
    @IBOutlet weak var EventPostDateTextField: UILabel!
    @IBOutlet weak var EventPostLocation: UILabel!
    @IBOutlet weak var EventPostDescription: UILabel!
    @IBOutlet weak var EventPostCreatedBy: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
