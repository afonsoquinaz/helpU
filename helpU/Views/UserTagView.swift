//
//  UserTagView.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI

struct UserTagView: View {
    
    let userId: String
    
    var body: some View {

       
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.white).shadow(radius: 20)

                   HStack {
                    
                    Spacer()
                    Image("userIcon").resizable().frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                       Text(userId)
                           .font(.title)
                           .foregroundColor(.gray)
                    
                  Spacer()
                    
                  
                    Image("gB").resizable().frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(90)
                   }
                   .multilineTextAlignment(.center)
                
          
            
               }
               .frame(width: 330, height: 40)
    }
}

struct UserTagView_Previews: PreviewProvider {
    static var previews: some View {
        UserTagView(userId: "not right")
    }
}
