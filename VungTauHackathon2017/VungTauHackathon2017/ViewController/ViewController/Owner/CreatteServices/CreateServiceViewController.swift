//
//  CreateServiceViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import BoltsSwift
import Alamofire
import ObjectMapper

class CreateServiceViewController: UIViewController {
    

    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var btnChooseImage: UIButton!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var btnChooseServices: DropMenuButton!

    
    var currentTypeServices = 0
    var lat = 0.0
    var lng = 0.0
    
    override func viewDidLoad() {
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
    
    @IBAction func btnChooseImageClick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)

        
    }
//    @IBAction func btnBackClick(_ sender: Any) {
//       navigationController?.popViewController(animated: true)
//    }

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
   
  
    func getCoordinateLocation(location: String){
        
        let temp1 = location.replacingOccurrences(of: "Đ", with: "D")
        let temp2 = temp1.replacingOccurrences(of: "đ", with: "d")
        let oldString = temp2.folding(options: .diacriticInsensitive, locale: .current)
        let newString = oldString.replacingOccurrences(of: " ", with: "+")
        Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json", method: .get, parameters: ["address": newString, "key": "AIzaSyCaNIA8p6P0fRDHDXP9FGUUX7h8Iwqbayg"], encoding: URLEncoding.default, headers: nil).responseJSON { (reponse) in
            switch reponse.result {
            case .failure(let error) :
                print(error)
            case .success(let responseObject) :
                
                if let apiResponse = Mapper<APIResponseArray<MapReponse>>().map(JSONObject: responseObject) {
                    apiResponse.result?.forEach({ (results) in
                        if results.geometry != nil {
                            self.lat = (results.geometry?.location?.lat!)!
                            self.lng = (results.geometry?.location?.lng!)!
                            
                            
                        }
                    })
                }
            }
        }
    }

}

extension CreateServiceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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

