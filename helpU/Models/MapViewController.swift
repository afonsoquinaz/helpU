//
//  MapViewController.swift
//  helpU
//
//  Created by Afonso Quinaz on 26/03/2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(
        latitude: 40.728,
        longitude: -74
    )
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                          span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                 longitudeDelta: 0.1)), animated: false)
        
        map.delegate = self
        view.addSubview(map)
        addCustomPin()
    }
    
    private func addCustomPin(){
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Pokemon Here"
        pin.subtitle = "Go and catch them all"
        map.addAnnotation(pin)
    }
    
    func mapViewController(_ mapView: MKMapView,
                          viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "Costum")
   
        if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
               annotationView?.canShowCallout = true
               annotationView?.rightCalloutAccessoryView
        }else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "userIcon")
        
        return annotationView
    }
    
}
