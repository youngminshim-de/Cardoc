//
//  WebViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/12.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    private var url: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
        loadWebView()
//        self.webView?.allowsBackForwardNavigationGestures = true  //뒤로가기 제스쳐 허용
//         webView.configuration.preferences.javaScriptEnabled = true  //자바스크립트 활성화
    }
    
//    override func loadView() {
//        super.loadView()
//
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
//    }
    
    static func create(with url: String) -> WebViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {
            return WebViewController()
        }
        viewController.url = url
        return viewController
    }
    
    func loadWebView() {
        guard let webUrl = URL(string: url ?? "") else {
            return
        }
        let request = URLRequest(url: webUrl)
        webView.load(request)
    }
    
    func setUpNavigationItem() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}
