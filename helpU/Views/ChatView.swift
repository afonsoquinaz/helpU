//
//  ChatView.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        Text("Chat View")
        Image(String("chatBG")).resizable().frame(width: 420, height: 400)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
