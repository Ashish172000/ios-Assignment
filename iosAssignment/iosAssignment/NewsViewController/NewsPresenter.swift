//
//  NewsPresenter.swift
//  iosAssignment
//
//  Created by Vivek Patel on 14/05/22.
//

import Foundation
import UIKit
import MBProgressHUD
protocol CommonView: NSObject {
    func showLoader()
    func hideLoader()
}
protocol NewsView: CommonView {
    func getNewsDetail(output: NewsDataResponse)
    
}

class NewsPresenter: NSObject {
    
    private lazy var service = {
        return NewsService()
    }()
    
    private weak var delegate: NewsView?
    init(_ delegate: NewsView) {
        self.delegate = delegate
    }
    
    func apiCallForNewsData(_ isShowLoader: Bool = true) {
        if isShowLoader {
            self.delegate?.showLoader()
        }
        service.getNews { (object, error) in
            self.delegate?.hideLoader()
            if let object = object {
                if object.status == "ok" {
                    self.delegate?.getNewsDetail(output: object)
                }
                else {
                    print(error)
                }
            }
        }
    }
}

extension UIViewController {
    func showLoader() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoader(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
