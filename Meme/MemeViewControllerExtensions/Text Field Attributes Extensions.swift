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
    func getMemeTextAttributes() -> [NSAttributedString.Key: Any] {
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeColor.rawValue): UIColor.black,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key(rawValue: NSAttributedString.Key.strokeWidth.rawValue): -4.5]
        return memeTextAttributes
    }
    
    func setTextFiledCommentsAttributes(){
        topCommentTextField.defaultTextAttributes = getMemeTextAttributes()
        topCommentTextField.textAlignment = .center
        topCommentTextField.textColor = .white
        bottomCommentTextField.defaultTextAttributes = getMemeTextAttributes()
        bottomCommentTextField.textAlignment = .center
    }
}
