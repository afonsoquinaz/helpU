//
//  formView.swift
//  helpU
//
//  Created by Afonso Quinaz on 26/03/2022.
//

import SwiftUI

struct formView1: View {
    @StateObject var model = ViewModel()
    @State var user: String = ""
 
    @State var day: String = ""
    @State var hour: String = ""
    @State var minute: String = ""
    @State var postText: String = ""
    @State var userId : String = ""
    @State var location: String = ""
    
    @State var userId1 : String = ""
    @State var postText1 : String = ""
    @State var lat : String = ""
    @State var long : String = ""
    
    var body: some View {
        
        
        
        VStack{
            
  
            
            
//              CREATE USER
            //Text("Create User")
            TextField("your name here", text: $user).frame(width: 250, height: 70)
            
            
            
            Button{
                print("Create/Update User")
                //appStatus = "profile"
                model.addUser(userId: user)
                
                
            }label: {
               
                //Text("Create/Update User")
                Image("userIcon").resizable().frame(width: 40, height: 40)
                
            }.background(Image(String("gB")).resizable()
                            .frame(width: 40, height: 40))
            
            
            //              CREATE HELP



                        Text("Create HELP")
                        
                     
                        TextField("your $long here", text: $long).frame(width: 250, height: 70)
                        TextField("your $lat here", text: $lat).frame(width: 250, height: 70)
                        TextField("your $postText1 here", text: $postText1).frame(width: 250, height: 70)
                        TextField("your userId1 here", text: $userId1).frame(width: 250, height: 70)

                        
                        Button{
                            print("Create/Update POST")
                            //appStatus = "profile"
                            
                           // model.addHelper(userId: userId, day:Int(day) ?? 0, hour: Int(hour) ?? 0, minute: Int(minute) ?? 0, postText: postText, location: location)
                            
                            model.addLocation(userId: userId1, textPost: postText1, lat: Double(lat) ?? 0, long: Double(long) ?? 0)
                            
                        }label: {
                           
                            //Text("Create/Update User")
                            Image("userIcon").resizable().frame(width: 40, height: 40)
                            
                        }.background(Image(String("gB")).resizable()
                                        .frame(width: 40, height: 40))
         
           
            
            
            
        }
    }
}

struct formView1_Previews: PreviewProvider {
    static var previews: some View {
        formView1()
    }
}
