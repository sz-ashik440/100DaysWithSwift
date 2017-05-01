//
//  MapViewController.swift
//  14_GPS_MAP
//
//  Created by Admin on 5/1/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let locaction = currentLocation else {
            return
        }
        
        let loc = locaction.coordinate
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegion(center: loc, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
    }
}
