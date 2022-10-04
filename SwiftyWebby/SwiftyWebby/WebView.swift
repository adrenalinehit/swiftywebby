//
//  WebView.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import SwiftUI
import WebKit

var wbv: WKWebView = WKWebView()

struct WebView: UIViewRepresentable {
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var url: URL
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> WKWebView {
        wbv = WKWebView(frame: CGRect(x: 100, y: 200, width: 200, height: 200), configuration: appPrefs.webprefs)
        wbv.scrollView.bounces = true
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(context.coordinator, action: #selector(Coordinator.handleRefreshControl), for: .valueChanged)
        
        wbv.scrollView.addSubview(refreshControl)
        
        return wbv
        
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        print("from the webview itself: \(webView.configuration.websiteDataStore.description)")
        webView.load(request)
    }
    
    
}

class Coordinator: NSObject {
    
    @objc func handleRefreshControl(sender: UIRefreshControl) {
        sender.endRefreshing()
        wbv.reload()
    }
}



struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://www.example.com")!)
    }
}
