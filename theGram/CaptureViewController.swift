//
//  
//  theGram
//
//  Created by student on 4/21/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var selectedPhoto: UIImage!
    
    @IBOutlet weak var displayImageVIew: UIImageView!
    @IBOutlet weak var choosePhotoBtn: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissKeyboard = UITapGestureRecognizer(target:  self, action: #selector(CaptureViewController.dismissKeyboard(_:)))
        dismissKeyboard.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissKeyboard)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard(_ tap: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func uploadImageDidTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.displayImageVIew.image = selectedPhoto
        picker.dismiss(animated: true, completion: nil)
        choosePhotoBtn.isHidden = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendDidTapped(_ sender: Any) {
        
        let image = displayImageVIew.image
        let caption = captionTextField.text
        Post.postUserImage(image: image, withCaption: caption, withCompletion: { (success: Bool, error: Error?) in
            if(success == true) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UserDidPost"), object: nil)
            } else {
                print(error?.localizedDescription)
            }
        })
        
    }
}

