//
//  ViewController.swift
//  edukandar
//
//  Created by Ghous Ali  Khan  on 5/4/2021.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipe(recognizer:)))
        let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipe(recognizer:)))
        
        
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        swipeDownRecognizer.direction = .down
        
        webView.addGestureRecognizer(swipeLeftRecognizer)
        webView.addGestureRecognizer(swipeRightRecognizer)

        
        let myURL = URL(string:"https://edukandar.pk/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
    @objc private func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.direction == .left) {
            if webView.canGoForward {
                webView.goForward()
            }
        }

        if (recognizer.direction == .right) {
            if webView.canGoBack {
                webView.goBack()
            }
        }
        
        if (recognizer.direction == .down) {
            webView.reload()
        }
    }
}
