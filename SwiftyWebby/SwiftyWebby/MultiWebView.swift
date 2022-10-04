//
//  MultiWebView.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI

struct MultiWebView: View {
    var url1: URL
    var url2: URL
    
    var body: some View {
        VStack {
            WebView(url: url1)
            WebView(url: url2)
        }
    }
}

struct MultiWebView_Previews: PreviewProvider {
    static var previews: some View {
        MultiWebView(url1: URL(string: "https://www.example.com")!, url2: URL(string:"https://www.bbc.co.uk")!)
    }
}
