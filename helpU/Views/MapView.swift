//
//  Map.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//
import Foundation
import MapKit
import SwiftUI
import UIKit
import CoreLocation
import Firebase



struct MapView: UIViewRepresentable {
    
    //var coordinate: CLLocationCoordinate2
    @ObservedObject var model = ViewModel()
    let map = MKMapView()
    typealias UIViewType = UIView
    @State var location = [Location]()
    @State var pointer = [MKPointAnnotation]()

    var coordinatess = [Location(id: "Sintra, Portugal", userId: "Pedro Madeira", lat: 2.312312, long: 3.34123, textPost: "Offer room for 4 in december"),
                       Location(id: "Algarve, Portugal", userId: "Leandro Almeida", lat: 4.2135789, long: 3.34123, textPost: "Offer room for 4 in december"),
                       Location(id: "Braga, Portugal", userId: "Sonia Araujo", lat: 9.231233, long: 1.123123, textPost: "Offer room for 4 in december"),
                       Location(id: "Expo, Portugal", userId: "Tomas Chambel", lat: 2.312312, long: 12.2425, textPost: "Offer room for 4 in december"),
                       Location(id: "Almada, Portugal", userId: "Goncalo Americo", lat: 32.312312, long: 31.34123, textPost: "Offer room for 4 in december"),
                       Location(id: "Costa da Caparica, Portugal", userId: "Lance Amstrong", lat: 22.312312, long: 33.314123, textPost: "Offer room for 4 in december"),]
   
   
    func addPointers(){
        var pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 4.2135789, longitude: 3.34123)
        pin.title = "Title"
        pin.subtitle = "Subtitle"
        map.addAnnotation(pin)
        
        var pin1 = MKPointAnnotation()
        pin1.coordinate = CLLocationCoordinate2D(latitude: 40.489909, longitude: -6.381862)
        pin1.title = "Pedro Madeira"
        pin1.subtitle = "Offer room for 4 in december"
        map.addAnnotation(pin1)
        
        var pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: 74)
        pin2.title = "Rodrigo Valerio"
        pin2.subtitle = "Offer room for 2 in September"
        map.addAnnotation(pin2)
        
        var pin3 = MKPointAnnotation()
        pin3.coordinate = CLLocationCoordinate2D(latitude: 38.7461523, longitude: -9.3066842)
        pin3.title = "Rodrigo Valerio"
        pin3.subtitle = "Offer room for 2 in September"
        map.addAnnotation(pin3)
        
        var pin4 = MKPointAnnotation()
        pin4.coordinate = CLLocationCoordinate2D(latitude: 38.74123, longitude: -9.306232)
        pin4.title = "Lourenco Vas"
        pin4.subtitle = "Food for 6"
        map.addAnnotation(pin4)
        
        var pin5 = MKPointAnnotation()
        pin5.coordinate = CLLocationCoordinate2D(latitude: 33.7461523, longitude: -1.3066842)
        pin5.title = "Lourenco Vas"
        pin5.subtitle = "Food for 6"
        map.addAnnotation(pin5)
        
        var pin6 = MKPointAnnotation()
        pin6.coordinate = CLLocationCoordinate2D(latitude: 47.1241128, longitude: -1.3066842)
        pin6.title = "Sofia Fill"
        pin6.subtitle = "Offer three packs of water"
        map.addAnnotation(pin6)
        
        var pin7 = MKPointAnnotation()
        pin7.coordinate = CLLocationCoordinate2D(latitude: 49.5534866, longitude: 13.4569879)
        pin7.title = "Thiago Hernandez"
        pin7.subtitle = "Offer three packs of water"
        map.addAnnotation(pin7)
        
        var pin8 = MKPointAnnotation()
        pin8.coordinate = CLLocationCoordinate2D(latitude: 38.6436905, longitude: -8.9147186)
        pin8.title = "Carlos D"
        pin8.subtitle = "Offer to give Portuguese Classes"
        map.addAnnotation(pin8)
        
        print("IMPRIMIMOS MAIS UM!!!!ASDASDAS")
        var aux = [MKPointAnnotation()]
        var counter = 0
        
        for p in location {
            aux.append(pin)
            aux.last?.coordinate = CLLocationCoordinate2D(latitude:  coordinatess[counter].lat, longitude:  coordinatess[counter].long)
            aux.last?.title = coordinatess[counter].userId
            aux.last?.subtitle = coordinatess[counter].textPost
            map.addAnnotation(aux.last as! MKAnnotation)
            counter += 1
        }
        
        
        
        for p in location {
            print("IMPRIMIMOS MAIS UM!!!!ASDASDAS")
            pin.coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: 74)
            pin.title = "Title"
            pin.subtitle = "Subtitle"
            
            
         //   counter += 1
        }
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let coordinate = CLLocationCoordinate2D(latitude: 38.660964, longitude: -9.2080017)
        
       
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        

        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2D(latitude: .random(in: -50.0 ... 50.0), longitude: .random(in: -50 ... -50.0))
        pin2.title = "Afonso"
        pin2.subtitle = "Offer food and place"
        map.addAnnotation(pin2)
        
        var pointers = [MKPointAnnotation()]
        var counter = 0
        
        print("AQUI CARALHO AFONSO ATENÇAO" + String(model.location.count))
        
        model.getLocations()
        //let a = model.getLocations()
        addPointers()
        
        
        for item in model.location {
            pointers[counter] = MKPointAnnotation()
            pointers[counter].coordinate = CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)
            pointers[counter].title = item.userId
            pointers[counter].subtitle = item.textPost
            counter += 1
            print("OLÁ ESTA É A VEZ " + String(counter))
        }
        
     
        
        return view
    }
    
    func updateUIView(_ uiView: UIView,context: Context){
        // do nothing
        
    }
    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: 74)
        pin.title = "Title"
        pin.subtitle = "Subtitle"
        map.addAnnotation(pin)
    }
    //Map
    func mapView(_ MapView: MKMapView,viewFor annotation: MKAnnotation) -> MKAnnotationView{
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            //Create the view
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        }else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "userIcon")
        return annotationView ?? MKAnnotationView(frame: CGRect(x: 1, y: 1, width: 1, height: 1))
    }
    
  

}
