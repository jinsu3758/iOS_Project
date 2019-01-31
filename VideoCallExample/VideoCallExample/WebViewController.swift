//
//  WebViewController.swift
//  VideoCallExample
//
//  Created by 박진수 on 2018. 12. 27..
//  Copyright © 2018년 박진수. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://192.168.0.186:8080/examples/full-communication/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
