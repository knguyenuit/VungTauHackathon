//
//  ListHotelCarouselViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 12/6/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import iCarousel
import ObjectMapper

class ListHotelCarouselViewController: UIViewController {

    @IBOutlet weak var iCarousel: iCarousel!
    var screenWidth = UIScreen.main.bounds.size.width
    var listCurrentHotel = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iCarousel.delegate = self
        iCarousel.dataSource = self
        iCarousel.type = .cylinder
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if listCurrentHotel.count == 0 {
            readJSON()
        }
        iCarousel.reloadData()
        
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

extension ListHotelCarouselViewController: iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return listCurrentHotel.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: UIImageView
        //create new view if no view is available for recycling
        if (view == nil) {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 278/375 * screenWidth, height: 375))
        }
        else {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView
        }
        
        let view = ListHotelCarouselCellViewController()
        let a = view.view
        view.populateData(hotel: listCurrentHotel[index])
        itemView.addSubview(view.view)
        
        return itemView
    }
    
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .arc {
            return 1
        }
        if option == .spacing {
            return 1.1
        }
        if option == .showBackfaces {
            return 1
        }
        return value
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let vc = DetailHotelViewController()
        let hotel = listCurrentHotel[index]
        vc.name = hotel.hotelName!
        vc.address = hotel.hotelAddress!
        vc.phoneNumber = hotel.phoneNumber!
        vc.avatar = hotel.avatar!
        Global.currentServices = 2
        Global.currentHotel = hotel
        (UIApplication.shared.delegate as! AppDelegate).navigationController?.pushViewController(vc, animated: true)
        
    }
    
  
    
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        //viewModel?.currentPage.value = carousel.currentItemIndex
    }
}
