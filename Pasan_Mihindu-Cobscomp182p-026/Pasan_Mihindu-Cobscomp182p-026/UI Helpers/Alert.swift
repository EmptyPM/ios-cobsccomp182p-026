//
//  Alert.swift
//  Pasan_Mihindu-Cobscomp182p-026
//
//  Created by Minu Jayakody on 2/27/20.
//  Copyright © Pasan Mihindu. All rights reserved.
//

import Foundation
import UIKit

struct Alert{
    private static func showBasicAlert(on vc:UIViewController,with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    static func showIncompleteFormAlert(on vc: UIAlertController){
        showBasicAlert(on: vc, with: "Incomplete Form", message: "Please fill out all fields in the form")
    }
}
