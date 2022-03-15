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
}


