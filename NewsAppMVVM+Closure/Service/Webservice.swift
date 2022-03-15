//
//  Webservice.swift
//  NewsAppMVVM+Closure
//
//  Created by M Kaan Adanur on 15.03.2022.
//

import Foundation

enum WebServiceEndPoint: String {
    case BASE_URL = "https://newsapi.org/v2/"
    case PATH = "top-headlines?country=us&category=business&apiKey="
    case API_KEY = "17b2211c1a9b4c9aac76951ee93636d8"
    
    static func newsPath() -> URL {
        return URL(string: "\(BASE_URL.rawValue)\(PATH.rawValue)\(API_KEY.rawValue)")!
    }
}

class WebService {
    
    func fetchData(completion: @escaping ([News]?) -> Void) {
        
        URLSession.shared.dataTask(with: WebServiceEndPoint.newsPath()) { data, response, error in
            
            if error != nil {
                print("Url error.")
                completion(nil)
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsModel.self, from: data)
                    print(result)
                    completion(result.articles)
                } catch {
                    print("Decode error.")
                    completion(nil)
                }
            }
            
        }.resume()
        
    }
    
    func getNewsData(url: URL, completion: @escaping ([News]?) -> Void){
         URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR 1")
                    print(error.localizedDescription)
                    completion(nil)
                }else if let data = data {
                    do{
                        let result = try JSONDecoder().decode(NewsModel.self, from: data)
                        completion(result.articles)
                    }catch{
                        print("ERROR 2")
                        print("-------------")
                        print(error.localizedDescription)
                        print("--------------")
                        print(String(describing: error))
                        print("--------------")
                        completion(nil)
                    }
                }
            }.resume()
     }
    
}
