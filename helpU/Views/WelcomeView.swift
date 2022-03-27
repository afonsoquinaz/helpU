

import SwiftUI
import UIKit
//import GoogleMobileAds


struct WelcomeView: View {
    //@EnvironmentObject var viewModel: GameViewModel
    //@StateObject var viewModel = GameViewModel()
    let screenSize: CGRect = UIScreen.main.bounds
    @ObservedObject var model = ViewModel()
   // let testBannerId = "ca-app-pub-1333522676196951/6327473734"
   // private var fullScreenAd: Interstitial?
    //init(){
    //    fullScreenAd = Interstitial()
    //}
   @State var appStatus = "helpers"
    init(){
        model.getalldata()
    }
    var body: some View {
        
        NavigationView {
            ZStack {
               // (Color.purple).ignoresSafeArea()
                Image("bgColor")
                    .resizable()
                  
                            .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    
                    ZStack{
                    Image("HELPUU").resizable().frame(width: 130, height: 130)
                    }
                    HStack{
                        //Button{
                        //    print("ADMIN")
                        //    appStatus = "admin"
                        //}label: {
 
                        //    Image("gB").resizable().frame(width: 40, height: 40)
                        
                       // }.background(Image(String("gB")).resizable()
                       //                 .frame(width: 40, height: 40))
                        
                        Spacer()
                        
                        
                        Button{
                       
                            print("MAP VIEW")
                            appStatus = "map"
                        }label: {
 
                            Image("Map").resizable().frame(width: 80, height: 80)
                        
                        }.background(Image(String("Map")).resizable()
                                        .frame(width: 80, height: 80))
                        Spacer()
                       
                        Button{
                            print("Profile View")
                            appStatus = "profile"
                        }label: {
 
                            Image("Men").resizable().frame(width: 92, height: 92)
                        
                        }.background(Image(String("Men")).resizable()
                                        .frame(width: 92, height: 92))
                  
                        Spacer()
                        Button{
                            print("Chat View")
                            appStatus = "chat"
                        }label: {
 
                            Image("messagess").resizable().frame(width: 93, height: 93)
                        
                        }.background(Image(String("SENDMESSAGECRL")).resizable()
                                        .frame(width: 80, height: 80))
                        Spacer()
                    }.background(Image(String("bgColor")).resizable()
                                    .frame(width: 450, height: 100))
              
                   Spacer()
                    
                    switch appStatus {
                    case "admin":
                        formView1()
                    case "helpers":
                        VStack{
                            helpers()
                           // let a : MapViewController = MapViewController()
                                
                           
                           // ContentView()
                        }
                    case "plusPost":
                        formView()
                    case "needers":
                        Needers()
                    case "map":
                        MapView()
                    case "profile":
                        ProfileView()
                    case "chat":
                        ChatView()
                    default:
                        Button{
               
                        }label: {
 
                            Image("gB").resizable().frame(width: 70, height: 70)
                        
                        }.background(Image(String("gB")).resizable()
                                        .frame(width: 58, height: 58))
                    }
                    
                  //  NavigationLink(
                    //
                    //     destination: WelcomeView(),
                    //      label: {
                    //          //viewModel.PlayButtonSound()
                    //          Image("gB").resizable().frame(width: 75, height: 75, alignment: ///*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //       }).cornerRadius(45).shadow(radius: ///*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).simultaneousGesture(TapGesture().onEnded{
                    //        })
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Button{
                            print("helpers View")
                            appStatus = "helpers"
                        }label: {
 
                            Image("Support").resizable().frame(width: 70, height: 70)
                        
                        }.background(Image(String("Support")).resizable()
                                        .frame(width: 58, height: 58))
                        Spacer()
                        Button{
                            print("plus post view")
                            appStatus = "plusPost"
                        }label: {
 
                            Image("NewPost").resizable().frame(width: 91, height: 91)
                        
                        }.background(Image(String("IneedHelp")).resizable()
                                        .frame(width: 58, height: 58))
                        Spacer()
                        Button{
                            print("needers view")
                            appStatus = "needers"
                        }label: {
 
                            Image("Inneed").resizable().frame(width: 70, height: 70)
                        
                        }.background(Image(String("Inneed")).resizable()
                                        .frame(width: 58, height: 58))
                        Spacer()
                    }
                   
                }.background(Image(String("bgColor")))
               
                
               
                //Image.init("backgroundd")
              
            }
           
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
        
    }
}
