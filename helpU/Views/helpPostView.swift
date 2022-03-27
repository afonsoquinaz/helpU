//
//  PostView.swift
//  helpU
//
//  Created by Afonso Quinaz on 26/03/2022.
//

import SwiftUI

struct helpPostView: View {
    

    var day: Int
    var hour: Int
    var minute: Int
    var postText: String
    var description: String
    var userId : String
    var location: String
    
    
    var body: some View {
        VStack{
            UserTagView(userId: userId)
            APostView(textPost: postText, day: day, hour: hour, minute: minute, location: location)
            Text(description)
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        helpPostView(day: 0, hour: 0, minute: 0, postText: "", description: "", userId: "", location: "")
    }
}
