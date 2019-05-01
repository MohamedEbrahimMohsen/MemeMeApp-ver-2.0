//
//  Text Field Delegates Extensions.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/26/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import Foundation
import UIKit

//Text Field Delegates
extension MemeViewController{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = "" //reset the Top & Bottom placeholders
        currentTextFieldOriginYPlusHeight = textField.frame.origin.y + textField.frame.height
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
