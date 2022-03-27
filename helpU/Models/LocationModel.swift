//
//  ViewModel.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import Foundation
import Firebase

class LocationModel: ObservableObject {

    @Published var location = [Location]()
    var locations = [Location]()
    
    init() {
        self.getLocationData()
        print("COPO CAFE E LEITE")
        print(self.locations)
    }



    

    func getLocations() -> Array<Location>{
        print("PLSPLSPLSPPLSSLDKASODHFJASHDFJIHIASFBIASHFIBAHISFBHIASBFHIBASHIFBHIABSFHIB")
        print(locations)
        return locations
    }
    func getLocationData(){
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //Read the documents at a specific
        db.collection("Locations/Locations/Locations").getDocuments { snapshot, error in
            if error == nil{
        //no errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        print("AAAAAAAAAAAAAABAAAA")
                        self.location =  snapshot.documents.map {
                            d in
                            print(Location( id: String(d.documentID),
                                            userId: d["userId"] as? String ?? "",
                                            lat: ["lat"] as? Double ?? 0.00,
                                            long: ["lat"] as? Double ?? 0.0,
                                            textPost: d["textPost"] as? String ?? "").textPost)
                            print(self.locations)
                            self.locations.append(Location( id: String(d.documentID),
                                                       userId: d["userId"] as? String ?? "",
                                                       lat: ["lat"] as? Double ?? 0.00,
                                                       long: ["lat"] as? Double ?? 0.0,
                                                       textPost: d["textPost"] as? String ?? ""))
                            print(self.locations)
                            return Location( id: String(d.documentID),
                                            userId: d["userId"] as? String ?? "",
                                            lat: ["lat"] as? Double ?? 0.00,
                                            long: ["lat"] as? Double ?? 0.0,
                                            textPost: d["textPost"] as? String ?? "")
                              }
                }
                }
                
            }else {
                //Handle the error
            }
        }
        
    }
    


    func addLocation(userId: String, textPost: String, lat: Double, long: Double){
        let db = Firestore.firestore()
        //db.collection("User")
        db.collection(String("Location/")).document(userId + String(lat)).setData(["userId": userId, "textPost": textPost, "lat": lat,  "needers": long]){ error in
            //check erros
            if(error == nil){
               // self.getData()
         
            }else{
                
            }
        }
    }
    


}
