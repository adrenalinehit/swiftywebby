//
//  AppPrefs.swift
//  SwiftyWebby
//
//  Created by Nick Payne on 04/10/2022.
//

import Foundation
import WebKit

class AppPreferences: ObservableObject {
    @Published var webprefs: WKWebViewConfiguration

    init() {
        var config = WKWebViewConfiguration()
        config.processPool = WKProcessPool()

        webprefs = config
    }
}
