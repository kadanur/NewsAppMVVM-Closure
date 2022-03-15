//
//  NewModel.swift
//  NewsAppMVVM+Closure
//
//  Created by M Kaan Adanur on 15.03.2022.
//

import Foundation

struct NewsModel: Codable {
    let status: String
    let articles: [News]
}

struct News: Codable {
    let title: String?
    let url: String?
    let urlToImage: String?
    let author: String?
    let description: String?
    let content: String?
    let source: NewsSource?
}

struct NewsSource: Codable {
    let id: String?
    let name: String?
}
