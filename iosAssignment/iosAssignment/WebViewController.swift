//
//  WebViewController.swift
//  iosAssignment
//
//  Created by Vivek Patel on 15/05/22.
//

import UIKit

class WebViewController: UIViewController {
    var webUrl: String?
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWeb()
    }
    func showWeb() {
        if let url = webUrl {
            webView.loadRequest(URLRequest(url: URL(string: url)!))
                    }
                }
        }
