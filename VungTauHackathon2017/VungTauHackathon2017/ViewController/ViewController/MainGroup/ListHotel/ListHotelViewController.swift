//
//  ListHotelViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import ObjectMapper

class ListHotelViewController: UIViewController {

    @IBOutlet weak var tbListHotel: UITableView!
    var listCurrentHotel = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbListHotel.delegate = self
        tbListHotel.dataSource = self
        //let cell = ListChildTableViewCell()
        //cell.ref = self
        tbListHotel.register(UINib(nibName: "ListHotelTableViewCell", bundle: nil), forCellReuseIdentifier: "ListHotelCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        readJSON()
        tbListHotel.reloadData()
    }
    
    func readJSON() {
        if let path = Bundle.main.path(forResource: "hotel", ofType: "json")
        {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let reader = Mapper<BaseJSonHotel>().map(JSONObject: jsonResult) {
                        reader.listHotel.forEach({ (test) in
                            listCurrentHotel.append(test)
                        })
                    }
                    if let people : [NSDictionary] = jsonResult["tests"] as? [NSDictionary] {
                        
                        people.forEach({ (test) in
                            //print(test["behaviors"]!)
                        })
                    }
                } catch {}
            } catch {}
        }
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
    }

    @IBAction func btnFindNearByClick(_ sender: Any) {
        let vc = ListHotelMapViewController()
        vc.listHotel = self.listCurrentHotel
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ListHotelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCurrentHotel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 307
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbListHotel.dequeueReusableCell(withIdentifier: "ListHotelCell") as! ListHotelTableViewCell
        let hotel = listCurrentHotel[indexPath.row]
        cell.poplulateDate(avatarName: hotel.avatar!, name: hotel.hotelName!, address: hotel.hotelAddress!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }}

