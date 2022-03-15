//
//  ListTableViewController.swift
//  NewsAppMVVM+Closure
//
//  Created by M Kaan Adanur on 15.03.2022.
//

import Foundation
import UIKit

class NewsTableViewController: UITableViewController {
    
    var viewModel = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        WebService().fetchData { result in
            if let result = result {
                for i in result {
                    let newsItem = NewsViewModel.init(news: i)
                    self.viewModel.newsListVM.append(newsItem)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension NewsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = viewModel.newsViewModel(at: indexPath.row).title
        return cell
    }
    
}
