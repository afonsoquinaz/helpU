//
//  UserProfileTopView.swift
//  helpU
//
//  Created by Afonso Quinaz on 26/03/2022.
//

import SwiftUI

struct UserProfileTopView: View {
    var body: some View {
        VStack{
            
               

            VStack{
                UserTagView(userId: "Afonsito")
                Text("Ready to help the ones who need the most!").font(.title2)
                    .foregroundColor(.black).frame(width: 300, height: 100)
     
                Text("Student in computer sceince and big care for dogs!  ").font(.title3)
                    .foregroundColor(.black).frame(width: 300, height: 100)
            
          

            
                Text("Telheiras, Portugal")
                .font(.title3)
                .foregroundColor(.black)
                
            }.background(Image("chatBG").resizable().frame(width: 400, height: 320))
        }.frame(width: 420, height: 320)
    }
}

struct UserProfileTopView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileTopView()
    }
}
