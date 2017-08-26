//
//  ListRestaurantViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit

class ListRestaurantViewController: UIViewController {

    @IBOutlet weak var tbListRestaurant: UITableView!
    
    var listCurrentRestaurant = [APIResponseGetAllServices]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbListRestaurant.delegate = self
        tbListRestaurant.dataSource = self
        //let cell = ListChildTableViewCell()
        //cell.ref = self
        tbListRestaurant.register(UINib(nibName: "ListViewRestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "ListRestaurantCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if listCurrentRestaurant.count == 0 {
           getAllRestaurant()
        }
        
    }
    
    func getAllRestaurant() {
        listCurrentRestaurant.removeAll()
        let apiReqest = APIRequestGetServices(serviceTypeId: 1)
        ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getAllRestaurant(apiReqest).continueWith(continuation: { (task) -> Void in
            if let getKidReponse = task.result {
                
                self.listCurrentRestaurant = getKidReponse
                self.tbListRestaurant.reloadData()
            }
        })
        
        
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

extension ListRestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCurrentRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 203
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbListRestaurant.dequeueReusableCell(withIdentifier: "ListRestaurantCell") as! ListViewRestaurantTableViewCell
        let res = listCurrentRestaurant[indexPath.row]
        cell.populateData(avatar: res.avatar!, name: res.serviceName!, address: res.address!)
        cell.gradientView(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailHotelViewController()
        let currentRestaurant = listCurrentRestaurant[indexPath.row]
        vc.name = currentRestaurant.serviceName!
        vc.address = currentRestaurant.address!
        //vc.phoneNumber = currentRestaurant.addressLat
        vc.avatar = currentRestaurant.avatar!
        Global.currentServices = 1
        Global.currentRestaurant = currentRestaurant
        (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(vc, animated: true)
        tbListRestaurant.deselectRow(at: indexPath, animated: true)
    }
}
