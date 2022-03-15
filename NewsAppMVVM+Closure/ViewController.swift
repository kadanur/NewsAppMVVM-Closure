//
//  ViewController.swift
//  NewsAppMVVM+Closure
//
//  Created by M Kaan Adanur on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebService().fetchData { result in
            print(result)
        }
        
    }


}

