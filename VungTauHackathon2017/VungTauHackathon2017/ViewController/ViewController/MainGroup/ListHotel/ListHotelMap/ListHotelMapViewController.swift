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
    var listHotel = [Hotel]()
    
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

        let hotel = listHotel.first
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: (hotel?.lat)!
            , longitude: (hotel?.lng)!)
        marker.title = "Khánh Nguyên"
        //marker.snippet = "VietNam"
        marker.icon = GMSMarker.markerImage(with: .black)
        marker.tracksInfoWindowChanges = true
        marker.map = self.mapView
        
        marker.userData = hotel
        self.mapView.camera = GMSCameraPosition.camera(withLatitude: 10.36408
            , longitude: 107.08377, zoom: 15)
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
        let currentHotel = marker.userData as! Hotel
        vc.name = currentHotel.hotelName!
        vc.address = currentHotel.hotelAddress!
        vc.avatar = currentHotel.avatar!
        vc.phone = currentHotel.phoneNumber!
        
        
        
        return info
        
    }
}
