//
//  MyPostCellTableViewCell.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Pasan Mihindu on 2/29/20.
//  Copyright © 2020 Pasan Mihindu. All rights reserved.
//

import UIKit

class MyPostCellTableViewCell: UITableViewCell {

    @IBOutlet weak var myportoverview: UIView!
    
    @IBOutlet weak var mypostimageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myportoverview.layer.cornerRadius = 20
        mypostimageview.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
