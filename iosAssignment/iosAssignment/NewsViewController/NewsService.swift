//
//  NewsService.swift
//  iosAssignment
//
//  Created by Vivek Patel on 14/05/22.
//

import Foundation
import Alamofire
import UIKit

class NewsService {
    func getNews(_ callBack: @escaping(_ object: NewsDataResponse?, _ error: String?)-> Void) {
        let url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1a0d1802c05940dc99e39053425c6d89"
        AF.request(url, method: .get).responseDecodable(of: NewsDataResponse.self) { response in
            switch response.result {
            case.success(let result):
                callBack(result, nil)
            case.failure(let error):
                callBack(nil, error.localizedDescription)
            }
            
            
        }
    }
}
