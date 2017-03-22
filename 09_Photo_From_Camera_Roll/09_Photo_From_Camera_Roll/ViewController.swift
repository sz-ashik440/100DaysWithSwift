//
//  ViewController.swift
//  09_Photo_From_Camera_Roll
//
//  Created by Admin on 3/22/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func SelectImage(_ sender: UIBarButtonItem) {
        // created imageview controller instance
        let imagePickerController = UIImagePickerController()
        
        // add this for using camera roll (will work for real device)
        // imagePickerController.sourceType = .camera
        
        // set source type as photolibrary
        imagePickerController.sourceType = .photoLibrary
        // set delegate for imageview controller
        imagePickerController.delegate = self
        
        // present it into view
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: imagepickercontrollerDidCancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: imagepicckerController
    // -- DO desire things with your selected image from library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // get image from library
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image: \(info)")
        }
        // set image into imageView
        imageView.image = selectedImage
        // dismiss imagePicker
        dismiss(animated: true, completion: nil)
    }
}

