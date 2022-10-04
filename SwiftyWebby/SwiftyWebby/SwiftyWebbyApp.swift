//
//  SwiftyWebbyApp.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI

@main
struct SwiftyWebbyApp: App {
    
    @StateObject var appPrefs = AppPreferences()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appPrefs)
        }
    }
}
