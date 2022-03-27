//
//  helpUApp.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI
import Firebase


@main
struct helpUApp: App {
    
    init(){
        FirebaseApp.configure()
        //GMSServices.provideAPIKey("AIzaSyDmwZMsAU1pxByiHmvaoDdqelJ4L_i9ACY")
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView().ignoresSafeArea()
            
        }
    }
}
