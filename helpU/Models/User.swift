

import Foundation
import SwiftUI
import AVFoundation


struct User: Identifiable {

    var id: String
    var userId : String
    var needs: [Need]
    var helps: [Help]
    
}
