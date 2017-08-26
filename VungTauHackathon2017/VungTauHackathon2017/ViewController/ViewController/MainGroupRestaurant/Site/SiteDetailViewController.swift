//
//  SiteDetailViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class SiteDetailViewController: UIViewController {
    @IBOutlet weak var ivAvatar: UIImageView!

   
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    var avatar = ""
    var siteDescription = ""
    var siteTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ivAvatar.image = UIImage(named: avatar)
        lbTitle.text = siteTitle
        lbDescription.text = siteDescription
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
