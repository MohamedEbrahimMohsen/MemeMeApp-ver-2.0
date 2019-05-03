//
//  Meme.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/26/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import Foundation
import UIKit

struct Meme{
    
    var topText: String!
    var bottomText: String!
    var originalImage: UIImage!
    var memeImage: UIImage!
    var description: String!{
        return  (self.topText == "TOP" ? "" : self.topText) + (self.bottomText == "BOTTOM" ? "" : self.bottomText)
    }
    
    init() {
        self.topText = ""
        self.bottomText = ""
        self.originalImage = UIImage()
        self.memeImage = UIImage()
    }
    
    init(topText: String?, bottomText: String?, originalImage: UIImage?, memedImage: UIImage?)
    {
        self.topText = topText ?? ""
        self.bottomText = bottomText ?? ""
        self.originalImage = originalImage ?? UIImage()
        self.memeImage = memedImage ?? UIImage()
    }

}
