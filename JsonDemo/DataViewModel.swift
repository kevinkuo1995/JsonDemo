//
//  DataViewModel.swift
//  JsonDemo
//
//  Created by KUO Chin Wei on 2020/4/1.
//  Copyright © 2020 KUO Chin Wei. All rights reserved.
//

import Foundation
import UIKit

class DataViewModel {
    
    var jsonData:[JsonData] = []
    
    func downloadData(completion: @escaping ([JsonData]?) -> ()) {
        
        let url = URL(string:"https://jsonplaceholder.typicode.com/photos")
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data , let jsonData = try? JSONDecoder().decode([JsonData].self, from: data) {
                    completion(jsonData)
                }else {
                    completion(nil)
                }
            }
            task.resume()
        }
    }
    
    func downloadImage(url: URL, handler: @escaping (UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                handler(image)
            } else {
                handler(nil)
            }
        }
        task.resume()
    }
}
