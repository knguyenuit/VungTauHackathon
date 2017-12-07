//
//  SignUpViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 12/7/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignUpClick(_ sender: Any) {
        var user = User(id: "1", email: "knguyen.uit@gmail.com", userName: "KN7", phoneNumber: "01214231341", avatar: "Hotel", access_token: "123456", refresh_token: "123456")
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.saveCurrentUser(user: user)
        for vc in ((UIApplication.shared.delegate as! AppDelegate).navigationController?.viewControllers)! {
            if vc is MainScreenViewController {
                
                (UIApplication.shared.delegate as! AppDelegate).navigationController?.popToViewController(vc, animated: true)
            }
        }
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
