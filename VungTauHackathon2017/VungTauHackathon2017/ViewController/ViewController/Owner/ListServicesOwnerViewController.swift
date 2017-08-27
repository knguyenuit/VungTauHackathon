//
//  ListServicesOwnerViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class ListServicesOwnerViewController: UIViewController {

    @IBOutlet weak var tbListServiceOwner: UITableView!
    
    var listServices = [APIResponseGetAllServices]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbListServiceOwner.delegate = self
        tbListServiceOwner.dataSource = self
        //let cell = ListChildTableViewCell()
        //cell.ref = self
        tbListServiceOwner.register(UINib(nibName: "ListViewRestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "ListRestaurantCell")
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getAllService()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAllService() {
        listServices.removeAll()
        let apiReqest = APIRequestGetServiceByOwner(ownerId: 3)
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getServiceByOwner(apiReqest).continueWith(continuation: { (task) -> Void in
            if let results = task.result {
                
                self.listServices = results
                self.tbListServiceOwner.reloadData()
            }
        })
        
        
    }

}

extension ListServicesOwnerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listServices.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 203
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbListServiceOwner.dequeueReusableCell(withIdentifier: "ListRestaurantCell") as! ListViewRestaurantTableViewCell
        let res = listServices[indexPath.row]
        cell.populateData(avatar: res.avatar!, name: res.serviceName!, address: res.address!)
        cell.gradientView(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailHotelViewController()
        let currentRestaurant = listServices[indexPath.row]
        vc.name = currentRestaurant.serviceName!
        vc.address = currentRestaurant.address!
        //vc.phoneNumber = currentRestaurant.addressLat
        vc.avatar = currentRestaurant.avatar!
        Global.currentServices = 1
        Global.currentRestaurant = currentRestaurant
        (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(vc, animated: true)
        tbListServiceOwner.deselectRow(at: indexPath, animated: true)
    }
}

