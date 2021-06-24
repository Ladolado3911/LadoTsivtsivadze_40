//
//  NetworkManager.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import Foundation
import UIKit

struct Endpoints {
    static var endpoint1 = "https://imedinews.ge/ge/~/api/getnews/get?skipCount=28&portion=20&categoryId=17&pageId=59"
}

class NetworkManager {
    func fetchNews(completion: @escaping (Result<Response, Error>) -> Void) {
        guard let url = URL(string: Endpoints.endpoint1) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("error happened \(error)")
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let allNews = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(allNews))
                }
                catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
