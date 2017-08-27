//
//  ListSiteViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import ObjectMapper

class ListSiteViewController: UIViewController {

    @IBOutlet weak var tbListSite: UITableView!
    var listCurrentSite = [Site]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbListSite.delegate = self
        tbListSite.dataSource = self
        //let cell = ListChildTableViewCell()
        //cell.ref = self
        tbListSite.register(UINib(nibName: "ListViewRestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "ListRestaurantCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        listCurrentSite.removeAll()
        readJSON()
        tbListSite.reloadData()
    }
    
    func readJSON() {
        if let path = Bundle.main.path(forResource: "sites", ofType: "json")
        {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let reader = Mapper<BaseJSonSite>().map(JSONObject: jsonResult) {
                        reader.listSite.forEach({ (test) in
                            listCurrentSite.append(test)
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

extension ListSiteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCurrentSite.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 203
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbListSite.dequeueReusableCell(withIdentifier: "ListRestaurantCell") as! ListViewRestaurantTableViewCell
        let site = listCurrentSite[indexPath.row]
        cell.populateSite(title: site.title!, avatar: site.avatar!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SiteDetailViewController()
        let site = listCurrentSite[indexPath.row]
        vc.siteTitle = site.title!
        vc.siteDescription = site.siteDescription!
        vc.avatar = site.avatar!
        
        print("load list detail")
        navigationController?.pushViewController(vc, animated: true)
        tbListSite.deselectRow(at: indexPath, animated: true)
    }
}

