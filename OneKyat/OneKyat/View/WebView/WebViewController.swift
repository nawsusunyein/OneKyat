//
//  WebViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit
import WebKit

class WebViewController: UIRootViewController {

    var urlToLoad : URL?
    
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavigationBar()
        self.addActivityToWebView()
        self.setWebViewAttributes()
        self.setNavigationBarAttributes(title : "Terms and Conditions")
    }
    
    func setWebViewAttributes(){
        self.webview.navigationDelegate = self
        webview.load(URLRequest(url: urlToLoad!))
    }
        
    func addActivityToWebView(){
        self.webview.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
        
    }

}

extension WebViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityIndicator.stopAnimating()
    }
}
