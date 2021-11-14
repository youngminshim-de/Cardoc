//
//  WebViewController.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/12.
//

import UIKit
import WebKit

final class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    private var url: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
        loadWebView()
    }
    
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
    
    private func setUpNavigationItem() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}
