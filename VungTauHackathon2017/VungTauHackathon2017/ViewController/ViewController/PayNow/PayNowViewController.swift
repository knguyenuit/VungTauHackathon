//
//  PayNowViewController.swift
//  VungTauHackathon2017
//
//  Created by BeeSightSoft on 12/6/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class PayNowViewController: UIViewController {

    @IBOutlet weak var vCreditCard: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ShadowView.init(view: vCreditCard)
        vCreditCard.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
