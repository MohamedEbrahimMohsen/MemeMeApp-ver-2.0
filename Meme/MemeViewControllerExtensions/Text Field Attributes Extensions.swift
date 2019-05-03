//
//  Text Field Attributes Extensions.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/26/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import Foundation
import UIKit

//Text Field Comments Attributes
extension MemeViewController{
    func setTextFiledCommentsAttributes(){
        setupTextField(textField: self.topCommentTextField, text: "TOP")
        setupTextField(textField: self.bottomCommentTextField, text: "BOTTOM")
    }
    
    func setupTextField(textField: UITextField, text: String) {
        textField.defaultTextAttributes = [
            NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeColor.rawValue): UIColor.black,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeWidth.rawValue): -4.5
        ]
        textField.textColor = UIColor.white
        textField.tintColor = UIColor.white
        textField.textAlignment = .center
        textField.text = text
        textField.delegate = self
    }
}
