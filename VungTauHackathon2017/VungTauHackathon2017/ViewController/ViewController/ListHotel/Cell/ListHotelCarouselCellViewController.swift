//
//  ListHotelCarouselCellViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 12/6/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class ListHotelCarouselCellViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShadowView(view: self.view)
        
        // Do any additional setup after loading the view.
    }
    
    func populateData(hotel: Hotel) {
        lbName.text = hotel.hotelName
        if let avatar = hotel.avatar {
         ivAvatar.image = UIImage(named: avatar)
        }
        lbAddress.text = hotel.hotelAddress
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
