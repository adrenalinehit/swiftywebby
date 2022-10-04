//
//  WebView.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    @EnvironmentObject var appPrefs: AppPreferences

    var url: URL

    func makeUIView(context: Context) -> WKWebView {

        return WKWebView(frame: CGRect(x: 100, y: 200, width: 200, height: 200), configuration: appPrefs.webprefs)
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        print("from the webview itself: \(webView.configuration.websiteDataStore.description)")
        webView.load(request)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://www.example.com")!)
    }
}
