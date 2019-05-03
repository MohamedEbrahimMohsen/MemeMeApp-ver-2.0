//
//  SentMemeTableViewController.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/28/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UITableViewController {

    var memes:[Meme]!{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMeme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }

    @objc func addNewMeme(){
        if let memeVC = storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as? MemeViewController{
            present(memeVC, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell", for: indexPath) as! MemeTableViewCell
        
        cell.memedImage.image = memes[indexPath.row].memeImage
        cell.memedDescription.text = memes[indexPath.row].description
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayingVC = storyboard?.instantiateViewController(withIdentifier: "MemeDisplayingViewController") as! MemeDisplayingViewController
        displayingVC.memeImage = memes[indexPath.row].memeImage
        navigationController?.pushViewController(displayingVC, animated: true)
    }

}
