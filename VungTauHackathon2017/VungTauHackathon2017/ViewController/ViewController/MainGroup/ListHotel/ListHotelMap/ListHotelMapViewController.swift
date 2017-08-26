//
//  ListHotelMapViewController.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import NVActivityIndicatorView

class ListHotelMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

   
    @IBOutlet weak var mapView: GMSMapView!
    
    var location = ""
    let locationManager = CLLocationManager()
    var latitude = 0.0
    var longitude = 0.0
    var coordinate = CGPoint(x: 0, y: 0)
    
    var myLocation:CLLocationCoordinate2D?
    var placesClient: GMSPlacesClient!
    var geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.locationManager.delegate = self
        //mapView = GMSMapView(frame: view.bounds)
        
        mapView.isMyLocationEnabled = true
        mapView.sizeToFit()
        self.locationManager.startUpdatingLocation()
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 10.36408
            , longitude: 107.08377)
        marker.title = "Khánh Nguyên"
        //marker.snippet = "VietNam"
        marker.icon = GMSMarker.markerImage(with: .black)
        marker.tracksInfoWindowChanges = true
        marker.map = self.mapView
        
        //marker.userData = pitch
        self.mapView.camera = GMSCameraPosition.camera(withLatitude: 10.36408
            , longitude: 107.08377, zoom: 15)
        //self.locationManager.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //update location to my location
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 15.0)
        
        
        self.mapView?.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        //event on click info window
        print("load list detail")
        
    }
    
    

//    override func loadView() {
//        super.loadView()
//        
////        Net.shared.getPitch().continueWith { (task) -> Void in
////            if task.error != nil {
////                //
////            } else {
////                if let result = task.result as? [Pitch] {
////                    //self.stopAnimating(view: self.view)
////                    DispatchQueue.main.async {
////                        result.forEach({ (pitch) in
////                            let marker = GMSMarker()
////                            marker.position = CLLocationCoordinate2D(latitude: (pitch.location?.geoLocation?.lat)!
////                                , longitude: (pitch.location?.geoLocation?.lng)!)
////                            marker.title = "\((pitch.location?.address)!)"
////                            //marker.snippet = "VietNam"
////                            marker.icon = #imageLiteral(resourceName: "icons8-Stadiumpng")
////                            marker.tracksInfoWindowChanges = true
////                            marker.map = self.mapView
////                            
////                            marker.userData = pitch
////                        })
////                    }
////                    
////                    
////                }
////            }
////        }
////        
////        
////        
////
//   }
    
    
    //func set view for info
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let vc = HotelInfoMakerViewController()
        let info = vc.view
//        let pitch = marker.userData as! Pitch
//        vc.name = pitch.name!
//        vc.address = pitch.location?.address
//        vc.avatar = pitch.avatar
//        vc.phone = pitch.phone
//        vc.btnOrderPitch.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        
        return info
        
    }
}
