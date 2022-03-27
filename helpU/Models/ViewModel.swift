//
//  ViewModel.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [Help]()
    @Published var list1 = [Need]()
    @Published var user = [User]()
    
    @Published var location = [Location]()
    var locations = [Location]()
    
    init() {
        self.getUserData()

        self.getHelperData()
        self.getNeederData()
        self.getLocationData()
        print("COPO CAFE E LEITE")
        print(self.locations)

    }
    func getalldata(){
        self.getUserData()
        self.getHelperData()
        self.getLocationData()
    }
    
    func getUserByUserId(userName : String) -> User {
        let db = Firestore.firestore()
        print("Chegou aqui afonso0232")
        db.collection("User").whereField("userId", isEqualTo: String(userName))
           
        print(self.list)
        let p : User = User(id: "", userId: "", needs: [], helps: [])
        for u in self.user {
            print("asasdas")
            print(userName)
            print(u.userId)
            print("asasdas-----")
            if(userName == u.userId){
            return u
                
            }
        }

        return p
    }
    
    func getUserData(){
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //Read the documents at a specific
        db.collection("User").getDocuments { snapshot, error in
            if error == nil{
        //no errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        print("AAAAAAAAAAAAAAAAAA")
                        self.user =  snapshot.documents.map {
                            d in
                            return User(id: String(d.documentID),
                                        userId: d["userId"] as? String ?? "",
                                        needs: d["needs"] as? Array ?? [],
                                        helps: d["helps"] as? Array ?? [])
                        }
                }
                }
                
            }else {
                //Handle the error
            }
        }
        
    }
    
    func getHelperData(){
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //Read the documents at a specific
        db.collection("App/Posts/Helper").getDocuments { snapshot, error in
            if error == nil{
        //no errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        print("AAAAAAAAAAAAAAAAAA")
                        self.list =  snapshot.documents.map {
                            d in
                            return Help(id: String(d.documentID),
                                        day: d["day"] as? Int ?? 0 ,
                                        hour: d["hour"] as? Int ?? 0,
                                        minute: d["minute"] as? Int ?? 0,
                                        postText: d["postText"] as? String ?? "",
                                        userId: d["userId"] as? String ?? "", location: d["location"] as? String ?? "")
                        }
                    }
                }
                
            }else {
                //Handle the error
            }
        }
        
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
    
    func getNeederData(){
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //Read the documents at a specific
        db.collection("App/Posts/Needer").getDocuments { snapshot, error in
            if error == nil{
        //no errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        print("AAAAAAAAAAAAAAAAAA")
                        self.list1 =  snapshot.documents.map {
                            d in
                            return Need(id: String(d.documentID),
                                        day: d["day"] as? Int ?? 0 ,
                                        hour: d["hour"] as? Int ?? 0,
                                        minute: d["minute"] as? Int ?? 0,
                                        postText: d["postText"] as? String ?? "",
                                        userId: d["userId"] as? String ?? ""
                                        , location: d["location"] as? String ?? "")
                        }
                }
                }
                
            }else {
                //Handle the error
            }
        }
    }
        func getUser(userId: String) -> User {
           // var user : [User]
            //Get a reference to the database
            let db = Firestore.firestore()
            
            //Read the documents at a specific
            db.collection("App/Posts/Needer").getDocuments { snapshot, error in
                if error == nil{
            //no errors
                    if let snapshot = snapshot {
                        
                        DispatchQueue.main.async {
                            print("AAAAAAAAAAAAAAAAAA")
                            self.user =  snapshot.documents.map {
                                d in
                               //if(userId == getUserByUserId(userName: user))
                                return User(id: String(d.documentID),
                                            userId: d["userId"] as? String ?? "",
                                            needs: d["needs"] as? Array ?? [],
                                            helps: d["helps"] as? Array ?? [])

                            }
                    }
                    }
                }else {
                    //Handle the error
                }
            }
            return self.user[0]
    }
    
    //ADICIONAR DADOS
    
    func addUser(userId: String){
        let db = Firestore.firestore()
        //db.collection("User")
        db.collection(String("User/")).document(userId).setData(["userId": userId, "helpers": [""],  "needers": [""]]){ error in
            //check erros
            if(error == nil){
               // self.getData()
         
            }else{
                
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
    
    func deleteDataByName(userId: String){
        
        //Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify doc to delete
        db.collection("User").document(userId).delete() {
            error in
            
            if (error == nil ){
                DispatchQueue.main.async{
                    
                
                
                self.list.removeAll{ user in
                    return user.id == userId
                    
                }
            }
            }
        }
        
    }
    
    func addUserUpdated(user: User, helper: Help){
        let db = Firestore.firestore()
        //db.collection("User")
        let a = user.helps + [helper]
        print("Aqui->" + user.userId)
        db.collection(String("User/")).document(user.userId).setData(["userId": user.userId, "helpers": a,  "needers": user.needs]){ error in
            //check erros
            if(error == nil){
               // self.getData()
         
            }else{
                
            }
        }
    }
    
    func updateUserHelper(user: User, helper: Help){
        print("Chegou aqui afonso121211")
        let db = Firestore.firestore()
        self.deleteDataByName(userId: user.userId)
        let a = user.helps + [helper]
        print("Chegou aqui afonso")
       
        db.collection("User").document(user.userId).setData(["userId": user.userId , "needs": user.needs,  "helps": a])
        print("Chegou aqui afonso 2")
       
      
        }
        
        func deleteDataByName(dataUserToDelete: String){
            
            //Get a reference to the database
            let db = Firestore.firestore()
            
            // Specify doc to delete
            db.collection("User").document(dataUserToDelete).delete() {
                error in
                
                if (error == nil ){
                    DispatchQueue.main.async{
                        
                    
                    
                    self.list.removeAll{ user in
                        return user.id == dataUserToDelete
                        
                    }
                }
                }
            }
            
        }
        
        func addHelper(userId: String, day: Int, hour: Int, minute: Int, postText: String, location: String){
            let db = Firestore.firestore()
            let u = getUserByUserId(userName: userId)


            //db.collection("User")
            let i =  .random(in: 0...1000000)/255
            
            let h : Help = Help(id: userId + String(i), day: day, hour: hour, minute: minute, postText: postText, userId: userId, location: location)
            print("Chegou aqui afonso001")
            //self.updateUserHelper(user: u , helper: h)
            self.addUserUpdated(user: u, helper: h)
            print("Chegou aqui afonso00")
            db.collection(String("App/Posts/Helper")).document(userId + String(i)).setData(["userId" : userId, "day" : day,  "hour" : hour , "minute" : minute, "postText" : postText, "location" : location]){ error in
                //check erros
                if(error == nil){
                   // self.getData()
                    
                }else{
                    print("Chegou aqui afonso12312")
                }
            }
            
          
        }
}
