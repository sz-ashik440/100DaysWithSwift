//
//  GoogleMapViewController.swift
//  14_GPS_MAP
//
//  Created by Admin on 5/1/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: UIView!
    var locationManager: CLLocationManager = CLLocationManager()

    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        guard let location = currentLocation else {
            return
        }
        GMSServices.provideAPIKey("AIzaSyAFBTYoEVYRD2a7DIYLA1jA0ccqSJS5UPw")
        
        let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 14)
        let gMap = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        mapView.addSubview(gMap)
        let marker = GMSMarker(position: location.coordinate)
        marker.title = "Home Sweet HOME"
        marker.map = gMap
    }

}
