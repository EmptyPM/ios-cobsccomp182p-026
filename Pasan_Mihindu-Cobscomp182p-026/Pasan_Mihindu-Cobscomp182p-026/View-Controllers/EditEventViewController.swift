//
//  EditEventViewController.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/24/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import UIKit

class EditEventViewController: UIViewController {
    @IBOutlet weak var EditEventScrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         EditEventScrollview.layer.cornerRadius = 30

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
