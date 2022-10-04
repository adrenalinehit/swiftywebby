//
//  CookieJar.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI
import WebKit

struct CookieJar: View {

    @State var webViewCookies: [MyHTTPCookie]

    @EnvironmentObject var appPrefs: AppPreferences
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        VStack {
            Text("show me the cookies").font(.title2)
            Table(webViewCookies) {
                TableColumn("Cookie") { cookie in
                    if horizontalSizeClass == .compact {
                        TableRowView(cookie: cookie)
                    } else {
                        Text(cookie.name)
                    }
                }

                TableColumn("Value", value: \.value)
                TableColumn("Domain", value: \.domain)
            }

        }.onAppear {
            getCookies()
        }
    }

    func getCookies() {

        print("getCookies...:\(appPrefs.webprefs.websiteDataStore.description)")

        appPrefs.webprefs.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                webViewCookies.append(MyHTTPCookie(cookie: cookie))
            }
        }
    }
}

struct TableRowView: View {
    var cookie: MyHTTPCookie
    var body: some View {
        HStack {
            Text(cookie.name).fontWeight(.semibold)
            Text(cookie.value).fontWeight(.light)
            Text(cookie.domain).fontWeight(.semibold)
        }
    }
}

struct MyHTTPCookie: Identifiable {
    let name: String
    let value: String
    let domain: String
    let id = UUID()

    init(cookie: HTTPCookie) {
        self.value = cookie.value
        self.name = cookie.name
        self.domain = cookie.domain
    }
}

struct CookieJar_Previews: PreviewProvider {
    static var previews: some View {
        CookieJar(webViewCookies: [])
    }
}
