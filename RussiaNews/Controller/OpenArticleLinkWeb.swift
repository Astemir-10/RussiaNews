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
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "CloseIcon"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addWebView()
        loadPage()
        addCloseButton()
    }
    
    func loadPage() {
        guard let urlStr = url else {return}
        
        guard let url = URL(string: urlStr) else {return}
        print(urlStr)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func addCloseButton() {
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(closeButton)
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    @objc func close() {
        dismiss(animated: true, completion: nil)
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
