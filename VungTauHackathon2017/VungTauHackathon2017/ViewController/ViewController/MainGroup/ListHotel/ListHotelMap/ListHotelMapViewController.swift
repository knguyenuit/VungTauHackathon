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
import ObjectMapper

class ListHotelMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

   
    @IBOutlet weak var mapView: GMSMapView!
    var listHotel = [Hotel]()
    var listRestaurant = [APIResponseGetAllServices]()
    
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
        if Global.currentServices == 2 {
            if listHotel.count == 0 {
                readJSON()
            }
            mapView.isMyLocationEnabled = true
            mapView.sizeToFit()
            self.locationManager.startUpdatingLocation()
            if let listHotel = listHotel as? [Hotel] {
                DispatchQueue.main.async {
                    listHotel.forEach({ (hotel) in
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: hotel.lat
                            , longitude: hotel.lng)
                        marker.title = "\((hotel.hotelName)!)"
                        //marker.snippet = "VietNam"
                        marker.icon = #imageLiteral(resourceName: "ic_restaurant")
                        marker.tracksInfoWindowChanges = true
                        marker.map = self.mapView
                        
                        marker.userData = hotel
                    })
                }
                
                
            }
            self.mapView.camera = GMSCameraPosition.camera(withLatitude: (listHotel.first?.lat)!
                , longitude: (listHotel.first?.lng)!, zoom: 15)

        } else {
            listRestaurant.removeAll()
            let apiReqest = APIRequestGetServices(serviceTypeId: 1)
            ApplicationAssembler.sharedInstance.resolver.resolve(PAuthenticationService.self)?.getAllRestaurant(apiReqest).continueWith(continuation: { (task) -> Void in
                if let getKidReponse = task.result {
                    
                    self.listRestaurant = getKidReponse
                    
                    self.mapView.isMyLocationEnabled = true
                    self.mapView.sizeToFit()
                    self.locationManager.startUpdatingLocation()
                    if let listRestaurant = self.listRestaurant as? [APIResponseGetAllServices] {
                        DispatchQueue.main.async {
                            listRestaurant.forEach({ (res) in
                                let marker = GMSMarker()
                                marker.position = CLLocationCoordinate2D(latitude: res.addressLat!
                                    , longitude: res.addressLng!)
                                marker.title = "\((res.serviceName)!)"
                                //marker.snippet = "VietNam"
                                marker.icon = #imageLiteral(resourceName: "Venue post suburb icon")
                                marker.tracksInfoWindowChanges = true
                                marker.map = self.mapView
                                
                                marker.userData = res
                            })
                        }
                        
                        
                    }
  
                }
                self.mapView.camera = GMSCameraPosition.camera(withLatitude: (self.listRestaurant.first?.addressLat)!
                    , longitude: (self.listRestaurant.first?.addressLng)!, zoom: 15)

            })
            
        
        
        
                    //self.locationManager.delegate = self
        // Do any additional setup after loading the view.
    }
        
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
                            listHotel.append(test)
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //update location to my location
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 15.0)
        
        
        self.mapView?.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        if Global.currentServices == 2 {
            let vc = DetailHotelViewController()
            let hotel = marker.userData as! Hotel
            vc.name = hotel.hotelName!
            vc.address = hotel.hotelAddress!
            vc.phoneNumber = hotel.phoneNumber!
            vc.avatar = hotel.avatar!
            print("load list detail")
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = DetailHotelViewController()
            let res = marker.userData as! APIResponseGetAllServices
            vc.name = res.serviceName!
            vc.address = res.address!
            vc.phoneNumber = "0905358224"
            vc.avatar = res.avatar!
            navigationController?.pushViewController(vc, animated: true)
        }
       
        
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
        if Global.currentServices == 2 {
            let currentHotel = marker.userData as! Hotel
            vc.name = currentHotel.hotelName!
            vc.address = currentHotel.hotelAddress!
            vc.avatar = currentHotel.avatar!
            vc.phone = currentHotel.phoneNumber!
        } else {
            let currentRes = marker.userData as! APIResponseGetAllServices
            vc.name = currentRes.serviceName!
            vc.address = currentRes.address!
            vc.avatar = currentRes.avatar!
            vc.phone = "0905358224"
        }
       
        
        
        
        return info
        
    }
}
