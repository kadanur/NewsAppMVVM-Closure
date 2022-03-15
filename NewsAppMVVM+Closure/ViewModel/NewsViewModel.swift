//
//  NewsViewModel.swift
//  NewsAppMVVM+Closure
//
//  Created by M Kaan Adanur on 15.03.2022.
//

import Foundation

class NewsListViewModel {
    var newsListVM: [NewsViewModel]
    
    init(){
           self.newsListVM = [NewsViewModel]()
       }
    
    func numberOfRows() -> Int {
        return self.newsListVM.count
    }
    
    func newsViewModel(at index: Int) -> NewsViewModel{
          return self.newsListVM[index]
      }
}

struct NewsViewModel {
    let news: News
    
    var title: String {
        return self.news.title ?? "Title Not Found"
    }
}
