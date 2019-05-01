//
//  MemeViewController.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/25/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{

    var currentTextFieldOriginYPlusHeight: CGFloat = 0.0
    var memes:[Meme]!{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    var isMemeSaved:Bool = false
    //MARK: Outlets
    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topCommentTextField: UITextField!
    @IBOutlet weak var bottomCommentTextField: UITextField!
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    //MARK: View Load Family
    override func viewDidLoad() {
        super.viewDidLoad()
        topCommentTextField.delegate = self
        bottomCommentTextField.delegate = self
        setTextFiledCommentsAttributes()
        shareButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    //MARK: Camera
    @IBAction func pickAnImageFromCamera(_ sender: UIBarButtonItem){
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    //MARK: Ablum
    @IBAction func pickAnImageFromAlbum(_ sender: UIBarButtonItem){
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: Share Meme
    @IBAction func shareMeme(_ sender: UIBarButtonItem) {
        let memeImage = generateMemedImage()
        let activityViewController = UIActivityViewController(activityItems: [memeImage], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {self.save(memedImage: memeImage)})
    }
    
    //MARK: New Meme
    @IBAction func cancelAndReturn(_ sender: UIBarButtonItem) {
        if !isMemeSaved && self.shareButton.isEnabled{
            let memeImage = generateMemedImage()
            save(memedImage: memeImage)
        }
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Internal Functions
    func save(memedImage: UIImage) {
        // Create the meme
        let meme = Meme(topText: topCommentTextField.text, bottomText: bottomCommentTextField.text, originalImage: originalImage.image, memedImage: memedImage)
        
        (UIApplication.shared.delegate as! AppDelegate).memes.append(meme)
        isMemeSaved = true
    }
    
    func generateMemedImage() -> UIImage {
        
        // TODO: Hide toolbar and navbar
        setAllNoneImageToBe(isHidded: true)
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        // TODO: Show toolbar and navbar
        setAllNoneImageToBe(isHidded: false)
        return memedImage
    }
    
    func setAllNoneImageToBe(isHidded: Bool){
        self.topToolbar.isHidden = isHidded
        self.bottomToolbar.isHidden = isHidded
        //self.navigationController?.isNavigationBarHidden = isHidded
        self.topCommentTextField.isHidden = self.topCommentTextField.text == "Top" ? isHidded : self.topCommentTextField.isHidden
        self.bottomCommentTextField.isHidden = self.bottomCommentTextField.text == "Bottom" ? isHidded : self.bottomCommentTextField.isHidden
    }
}

