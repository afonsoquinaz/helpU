//
//  helpers.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI
import UIKit

struct helpers: View {
    
    @ObservedObject var model = ViewModel()

    @State var userId = ""
    @State var postText = ""
    @State var day = 0
    @State var hour = 0
    @State var minute = 0
    @State var description = ""
    @State var location = ""

    
    var body: some View {
        
        ZStack{
         
        VStack {
            if(userId == ""){
        List(model.list){ item in
            var cor = 0
            ZStack{
           //     Image("bgColor")
                    //        .resizable()
                           
                      //      .edgesIgnoringSafeArea(.all)
             
                    RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.blue).shadow(radius: 20)
                VStack {
                   
                    
                    ZStack{
                        HStack{
                            Spacer()
                            VStack{
                            Spacer()
                            
                            
                            }
                        }
                        
                        
                        
                        
                        Button{
                            print("ADMIN")
                            //appStatus = "admin"
                            //WelcomeView()
                            userId = item.userId
                        }label: {

                            UserTagView(userId: item.userId)
                            APostView(textPost: item.postText, day: item.day, hour: item.hour, minute: item.minute, location: item.location)
                        
                        }.frame(width: 350, height: 250)
                                
                       
                        
                        }.frame(width: 350, height: 250)
                    .multilineTextAlignment(.center)
                    }
                        
                        
                        
                        
                        
                    }.frame(width: 350, height: 250)
                    
                    
                 
            
        }
        }else if(userId != ""){
            helpPostView(day: day, hour: hour, minute: minute, postText: postText, description: description, userId: userId, location: location)
        }
        }
        
        }
    }
    
    
    init(){
        model.getHelperData()
    }
}

struct helpers_Previews: PreviewProvider {
    static var previews: some View {
        helpers()
    }
}
