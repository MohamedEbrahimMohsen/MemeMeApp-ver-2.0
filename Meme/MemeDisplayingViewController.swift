//
//  MemeDisplayingViewController.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/28/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import UIKit

class MemeDisplayingViewController: UIViewController {

    @IBOutlet weak var memeImageView: UIImageView!
    var memeImage: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let memeImage = memeImage{
            self.memeImageView?.image = memeImage
        }
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
}
