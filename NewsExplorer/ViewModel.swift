//
//  ViewModel.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 11.06.2023.
//



import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    let apiKey = "2c6f41b8c92b4d90b278f468e1016138"
    let apiURL = "https://newsapi.org/v2/everything"
    var parameters: [String : String] = ["q":""]
    
    @Published var articles: [Article] = []
    
    
    
    func clearByFields(fields: [String]) {
        for field in fields {
            parameters[field] = nil
        }
        
    }
    
    func fetchData(query: String?, sortBy: String?, fromDate: String?, toDate: String?) {
        parameters["q"] = query
        
        if let sortBy = sortBy {
            parameters["sortBy"] = sortBy
        }
        
        if let fromDate = fromDate {
            parameters["from"] = fromDate
        }
        if let toDate = toDate {
            parameters["to"] = toDate
        }
        
        let queryParams = getParams()
        
        guard let url = URL(string: "\(apiURL)\(queryParams)&apiKey=\(apiKey)") else {
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
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
    }
    
    func getParams() -> String {
        var url: String = "?q=\(parameters["q"] ?? "default")"
        
        if parameters["sortBy"] != nil {
            url += "&sortBy=" + (parameters["sortBy"] ?? "")
        }
        
        if parameters["from"] != nil {
            url += "&from=" + (parameters["from"] ?? "")
        }
        
        if parameters["to"] != nil {
            url += "&to=" + (parameters["to"] ?? "")
        }
        
        return url
    }
}
