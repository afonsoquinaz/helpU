//
//  ContentView.swift
//  helpU
//
//  Created by Afonso Quinaz on 25/03/2022.
//

import SwiftUI
import Firebase
import CoreLocation

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        List(model.list){ item in
            Text(item.userId)
        }
    }
    
    init(){
        model.getHelperData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
