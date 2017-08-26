//
//  ServiceMapViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ServiceMapViewController: UIViewController {

    @IBOutlet weak var vMap: GMSMapView!
    var lat = 10.358256
    var lng = 107.086480
    var name = "Nguyen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Global.currentServices == 1 {
            lat = Global.currentRestaurant.addressLat!
            lng = Global.currentRestaurant.addressLng!
            name = Global.currentRestaurant.serviceName!
        } else {
            lat = Global.currentHotel.lat
            lng = Global.currentHotel.lng
            name = Global.currentHotel.hotelName!
        }
        vMap.isMyLocationEnabled = true
        vMap.sizeToFit()
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat
            , longitude: lng)
        marker.title = "\(name)"
        //marker.snippet = "VietNam"
        marker.icon = #imageLiteral(resourceName: "Location Icon")
        marker.tracksInfoWindowChanges = true
        marker.map = self.vMap
        self.vMap.camera = GMSCameraPosition.camera(withLatitude: lat
            , longitude: lng, zoom: 18)

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
