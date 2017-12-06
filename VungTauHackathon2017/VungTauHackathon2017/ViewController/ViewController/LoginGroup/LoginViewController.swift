//
//  LoginViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnBackClick(_ sender: Any) {
        (UIApplication.shared.delegate as! AppDelegate).navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
//        var loginRequest = APILoginRequest(email: tfUserName.text!, passWord: tfPassword.text!)
//        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.login(loginRequest, showLoading: true).continueWith(continuation: { (task) -> Void in
//            if task.error != nil {
//                print("Error")
//            } else {
//                print("Login success")
//            }
//        })
        var user = User(id: "1", email: "knguyen.uit@gmail.com", userName: "KN7", phoneNumber: "01214231341", avatar: "Hotel", access_token: "123456", refresh_token: "123456")
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.saveCurrentUser(user: user)
        (UIApplication.shared.delegate as! AppDelegate).navigationController?.popViewController(animated: true)
    }

    @IBAction func btnCancelClick(_ sender: Any) {
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
