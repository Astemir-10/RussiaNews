//
//  OpenArticleLinkWeb.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 27.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit
import WebKit

class OpenArticleLinkWeb: UIViewController {
    
    var url: String?
    
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addWebView()
        loadPage()
    }
    
    func loadPage() {
        guard let urlStr = url else {print(url)
            return}
        
        guard let url = URL(string: urlStr) else {return}
        print(urlStr)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func addWebView() {
        view = webView
    }


}

extension OpenArticleLinkWeb: WKUIDelegate {
      override func loadView() {
          webView.uiDelegate = self
          let webConfigueration = WKWebViewConfiguration()
          webView = WKWebView(frame: .zero, configuration: webConfigueration)
          view = webView
      }
}
