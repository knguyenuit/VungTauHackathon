//
//  ReviewViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var tbListReview: UITableView!
    var listReview = [ReviewService]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbListReview.delegate = self
        tbListReview.dataSource = self
        //let cell = ListChildTableViewCell()
        //cell.ref = self
        tbListReview.register(UINib(nibName: "ListReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ListReviewCell")
        // Do any additional setup after loading the view..
//        tbListReview.register(UINib(nibName: "ListViewRestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "ListRestaurantCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if listReview.count == 0 {
            getReview()
        }
    }
    

    func getReview() {
        let apiRequest = APIRequestGetReviewByService(serviceId: 1)
//        if Global.currentServices == 1 {
//            apiRequest = APIRequestGetReviewByService(serviceId: Global.currentRestaurant.serviceID)
//        } else {
//            apiRequest = APIRequestGetReviewByService(serviceId: Int(Global.currentHotel.id))
//        }
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getAllReviewByService(apiRequest).continueWith(continuation: { (task) -> Void in
            if let listReview = task.result {
                self.listReview = listReview
                self.tbListReview.reloadData()
            }
            
        })

        
    }

}

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listReview.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbListReview.dequeueReusableCell(withIdentifier: "ListReviewCell") as! ListReviewTableViewCell
        let review = listReview[indexPath.row]
        cell.populateData(userName: review.userName!, content: review.reviewContent!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let vc = DetailHotelViewController()
//        let hotel = listCurrentHotel[indexPath.row]
//        vc.name = hotel.hotelName!
//        vc.address = hotel.hotelAddress!
//        vc.phoneNumber = hotel.phoneNumber!
//        vc.avatar = hotel.avatar!
//        Global.currentServices = 2
//        Global.currentHotel = hotel
//        (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(vc, animated: true)
//        tbListHotel.deselectRow(at: indexPath, animated: true)
    }
}

