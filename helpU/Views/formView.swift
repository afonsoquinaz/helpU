//
//  formView.swift
//  helpU
//
//  Created by Afonso Quinaz on 26/03/2022.
//

import SwiftUI

struct formView: View {
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
            TextField("What do you want to help?", text: $user).background(Image("gB").resizable()
                                                                    .frame(width: 250, height: 50)).frame(width: 250, height: 50)
            TextField("Where?", text: $user).background(Image("gB").resizable()
                                                                    .frame(width: 250, height: 50)).frame(width: 250, height: 50)
         
            TextField("When?", text: $user).background(Image("gB").resizable()
                                                                    .frame(width: 250, height: 50)).frame(width: 250, height: 50)
            
            TextField("Other post information", text: $user).background(Image("gB").resizable()
                                                                    .frame(width: 250, height: 50)).frame(width: 250, height: 50)
         
            
            Button{
                print("Create/Update User")
                //appStatus = "profile"
                model.addUser(userId: user)
                
                
            }label: {
               
                //Text("Create/Update User")
              //  Image("userIcon").resizable().frame(width: 40, height: 40)
                
            }.background(Image(String("gB")).resizable()
                            .frame(width: 40, height: 40))
            
            
            //              CREATE HELP



                      
         
           
            
            
            
        }
    }
}

struct formView_Previews: PreviewProvider {
    static var previews: some View {
        formView()
    }
}
