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
    
    @IBAction func btnLoginClick(_ sender: Any) {
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
