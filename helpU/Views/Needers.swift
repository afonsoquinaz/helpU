//
//  Needers.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI

struct Needers: View {
   
    @ObservedObject var model = ViewModel()

    var body: some View {
        
       
        VStack {
          
        List(model.list1){ item in
            
          
            
            ZStack{
               
                
                RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.pink).shadow(radius: 20)
            VStack {
                        
                UserTagView(userId: item.userId)
                APostView(textPost: item.postText, day: item.day, hour: item.hour, minute: item.minute, location: item.location)
            }.frame(width: 350, height: 250)
            .multilineTextAlignment(.center)

            }
                  
        }
        }
        
       
    }
    
    init(){
        model.getNeederData()
    }
}

struct Needers_Previews: PreviewProvider {
    static var previews: some View {
        Needers()
    }
}
