//
//  Image Picker Extensions.swift
//  Meme
//
//  Created by Mohamed Mohsen on 4/26/19.
//  Copyright © 2019 Mohamed Mohsen. All rights reserved.
//

import Foundation
import UIKit

//Image Picker
extension MemeViewController{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let chosenImage = info[.editedImage] as? UIImage{
            setChosenImage(with: chosenImage)
        }
        else if let chosenImage = info[.originalImage] as? UIImage{
            setChosenImage(with: chosenImage)
        }
        
        dismiss(animated:true, completion: nil)
    }
    
    func setChosenImage(with chosenImage: UIImage){
        originalImage.contentMode = .scaleAspectFit
        originalImage.image = chosenImage
        self.shareButton.isEnabled = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func chooseImageFromCameraOrPhoto(source: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = source
        present(imagePickerController, animated: true, completion: nil)
    }
}
