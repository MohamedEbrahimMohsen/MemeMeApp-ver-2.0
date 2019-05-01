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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let memeImage = memeImage{
            self.memeImageView?.image = memeImage
        }
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
