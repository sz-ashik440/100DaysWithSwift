//
//  ViewController.swift
//  14_GPS_MAP
//
//  Created by Admin on 5/1/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var cityCountryLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            
            self.currentLocation = locationManager.location
            
            let lat = self.currentLocation.coordinate.latitude
            let long = self.currentLocation.coordinate.longitude
            
            latitudeLabel.text = "Latitude: \(lat)"
            longitudeLabel.text = "Longitude: \(long)"

            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(self.currentLocation, completionHandler: {placeMarks, error in
                guard let addressDict = placeMarks?[0].addressDictionary else {
                    return
                }
                
                guard let city = addressDict["City"] as? String else {
                    return
                }
                
                guard let country = addressDict["Country"] as? String else {
                    return
                }
                
                self.cityCountryLabel.text = "\(city), \(country)"
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // for default apple MapKit
        //let controller = segue.destination as! MapViewController
        
        // for google map API
        let controller = segue.destination as! GoogleMapViewController
        controller.currentLocation = self.currentLocation
    }
}
