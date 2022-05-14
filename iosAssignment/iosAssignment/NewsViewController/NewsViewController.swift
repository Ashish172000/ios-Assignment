//
//  ViewController.swift
//  iosAssignment
//
//  Created by Vivek Patel on 14/05/22.
//

import UIKit
import Kingfisher

class NewsViewController: UIViewController {

    private lazy var presenter = {
        return NewsPresenter(self)
    }()
    var articles: [Articles] = []
    
    private let refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = UIColor.gray
        control.addTarget(self, action:
                            #selector(didPullToRefresh(_:)),
                          for: .valueChanged)
        return control
    }()
    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    
    //MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        tblView.addSubview(refreshControl)
        presenter.apiCallForNewsData()
        // Do any additional setup after loading the view.
    }
    @objc private func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        presenter.apiCallForNewsData(false)
    }

}
//MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let newsData = articles[indexPath.row]
        cell.author.text = newsData.author
        cell.title.text = newsData.title
        cell.news.text = newsData.content
        cell.newsDescription.text = newsData.description
        cell.imgeView.kf.setImage(with: URL(string: newsData.urlToImage ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webURL = articles[indexPath.row]
        let nextCon = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        nextCon.webUrl = webURL.url
        self.navigationController?.pushViewController(nextCon, animated: true)
        
    }
    
    
}
extension NewsViewController: NewsView {
    func getNewsDetail(output: NewsDataResponse) {
        self.articles = output.articles ?? []
        self.refreshControl.endRefreshing()
        self.tblView.reloadData()
    }
}

