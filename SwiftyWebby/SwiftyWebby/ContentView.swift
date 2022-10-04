//
//  ContentView.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink("Web View", destination: WebView(url: URL(string: "https://m.skybet.com")!))
                
                NavigationLink("Web View number 2", destination: WebView(url: URL(string: "https://m.skybet.com")!))
                
                NavigationLink("Multiple webviews on page",
                               destination: MultiWebView(url1: URL(string: "https://m.skybet.com")!, url2: URL(string: "https://m.skybet.com")!))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
