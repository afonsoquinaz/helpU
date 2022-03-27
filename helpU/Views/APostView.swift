//
//  APostView.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI

struct APostView: View {
    
    let textPost: String
    let day: Int
    let hour: Int
    let minute: Int
    let location: String
    let date = Date()
    let calendar = Calendar.current

    
    var body: some View {
        
              VStack{
                Text(textPost)
                .font(.title)
                .foregroundColor(.white)
                Spacer()
            HStack{
                let hour1 =  calendar.component(.hour, from: date) - hour
                let minutes1 = calendar.component(.minute, from: date) - minute
                let day1 = calendar.component(.day, from: date) - day
               
                Text(location)
                    .font(.title2)
                    .foregroundColor(.white)
                
                    Spacer()
                if(day1 > 0){
                    Text(String(day1) + " days ago")
                        .font(.title3)
                        .foregroundColor(.white)
                }else if(hour1 > 0){
                Text(String(hour1) + " hours ago")
                    .font(.title3)
                    .foregroundColor(.white)
                }else if(hour1 == 0){
                    Text(String(minutes1) + " minutes ago")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                }
                
            
        }.frame(width: 320, height: 160)
        .multilineTextAlignment(.center)
    }
}

struct APostView_Previews: PreviewProvider {
    static var previews: some View {
        APostView(textPost: "wrong", day: 0, hour: 0, minute: 0, location: "wrong")
    }
}
