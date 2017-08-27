//
//  CreateServicesViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import BoltsSwift
import Alamofire
import ObjectMapper

class CreateServicesViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var ivAvatar: UIImageView!

    @IBOutlet weak var btnChooseImage: UIButton!
    @IBOutlet weak var btnChooseServices: DropMenuButton!
    @IBOutlet weak var tfAddress: UITextField!
    
    var currentTypeServices = 0
    var lat = 0.0
    var lng = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        btnChooseServices.initMenu(["Nhà Hàng", "Khách Sạn"], actions: [({ () -> (Void) in
            self.editWhenChoose()
            self.currentTypeServices = 1
        }), ({ () -> (Void) in
            self.editWhenChoose()
            self.currentTypeServices = 2
        })])
        
        ivAvatar.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func editWhenChoose() {
        self.btnChooseServices.contentHorizontalAlignment = .center
    }
    
    @IBAction func btnCreateClick(_ sender: Any) {
        //getCoordinateLocation(location: tfAddress.text!)
        let requestServices = APIRequestCreateServices(serviceType: self.currentTypeServices, name: self.tfName.text!, address: self.tfAddress.text!, lat: 10.358256, lng: 107.086480)
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.createService(requestServices, showLoading: true).continueWith(continuation: { (task) -> Void in
            if task.error != nil {
                print(task.error)
            } else {
                self.showAlert(title: "Success", message: "Add success")
            }
        })
    }
    
    @IBAction func btnChooseImageClick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CreateServicesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            ivAvatar.image = selectedImage
            ivAvatar.isHidden = false
            btnChooseImage.isHidden = true
            
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
}

