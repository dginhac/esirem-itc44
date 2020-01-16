//
//  AddPhotoViewController.swift
//  photo
//
//  Created by d0m on 06/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

// Do not forget to add the UINavigationControllerDelegate and UIImagePickerControllerDelegate protocols for managing imagePickerController
class AddPhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // The outlet in which the image is displayed
    @IBOutlet weak var photo: UIImageView!
    
    // The image Picker for choosing a photo
    var imagePicker: UIImagePickerController!
    
    // The first action: Load image from photo Gallery
    @IBAction func loadImage(_ sender: UIButton) {
        // Create an imagePickerController
        imagePicker =  UIImagePickerController()
        // Delegate to the View Controller
        imagePicker.delegate = self
        // Use the photo Gallery
        imagePicker.sourceType = .photoLibrary
        // Present modally the imagePicker
        present(imagePicker, animated: true, completion: nil)
    }
    
    // The second action: Take a photo. Only works on a real device and not on simulator
    // Do not forget to add the following option in the InfoPlist
    // Property: Privacy - Camera Usage Description
    // Value: The application needs to use the camera of the device
    
    @IBAction func takePicture(_ sender: UIButton) {
        // Create an imagePickerController
        imagePicker =  UIImagePickerController()
        // Delegate to the View Controller
        imagePicker.delegate = self
        // Use the camera
        imagePicker.sourceType = .camera
        // Present modally the imagePicker
        present(imagePicker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // This method is required by the UIImagePickerControllerDelegate protocol
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Close the imagePicker
        imagePicker.dismiss(animated: true, completion: nil)
        // Store the selected UIImage into the outlet
        photo.image = info[.originalImage] as? UIImage
        print (info[.imageURL])
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
