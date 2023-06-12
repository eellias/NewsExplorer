//
//  ViewModel.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 11.06.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    let apiKey = "9a99da32061842ab832940886fbce64b"
    let apiURL = "https://newsapi.org/v2/everything?q=default&apiKey="
    
    @Published var articles: [Article] = []
    
    func fetch() {
        
        guard let url = URL(string: apiURL + apiKey) else {
            return
        }
        
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            do {
                let articlesList = try decoder.decode(ArticleList.self, from: data)

                
                DispatchQueue.main.async {
                    self?.articles = articlesList.articles
                }
                print(articlesList)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    
}
