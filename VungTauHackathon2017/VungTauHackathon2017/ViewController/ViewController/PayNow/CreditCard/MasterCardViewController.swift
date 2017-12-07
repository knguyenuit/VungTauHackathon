//
//  MasterCardViewController.swift
//  VungTauHackathon2017
//
//  Created by BeeSightSoft on 12/7/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class MasterCardViewController: UIViewController {

    @IBOutlet weak var vCreditCard: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vCreditCard.layer.cornerRadius = 10
        ///CreditCard.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
//        vCreditCard.layer.borderWidth = 0.5
        vCreditCard.layer.shadowOffset = CGSize(width: 0, height: 3)
        vCreditCard.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        vCreditCard.layer.shadowOpacity = 1
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
