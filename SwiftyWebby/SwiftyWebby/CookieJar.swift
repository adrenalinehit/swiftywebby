//
//  CookieJar.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI
import WebKit

struct CookieJar: View {
    
    @State var cookiePrint: [String]
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var body: some View {
        VStack {
            Text("show me the cookies").font(.title2)
            ScrollView {
                Text(cookiePrint.joined())
            }
            
        }.onAppear {
            getCookies()
        }
    }
    
    func getCookies() {
        
        print("getCookies...:\(appPrefs.webprefs.websiteDataStore.description)")
        
        appPrefs.webprefs.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                var temp = "\(cookie.name) is set to \(cookie.value)\n"
                print(temp)
                cookiePrint.append(temp)
            }
        }
    }
}

struct CookieJar_Previews: PreviewProvider {
    static var previews: some View {
        CookieJar(cookiePrint: [""])
    }
}
