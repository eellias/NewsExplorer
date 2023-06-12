//
//  Articles.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 11.06.2023.
//

import Foundation
import SwiftUI

struct ArticleList: Codable, Hashable {
    let articles: [Article]
}

struct Source: Codable, Hashable {
    var id: String?
    var name: String
}

struct Article: Codable, Hashable {

    var source: Source
    var author: String?
    var title: String
    var description: String
    var url: String
    var urlToImage: String?
    var publishedAt: Date
    var content: String
    
    static let formatter = CustomDateFormatter()
    static let example = Article(source: Source(id: "the-verge", name: "The Verge"), title: "Apple restricts employees from using ChatGPT over fear of data leaks", description: "Apple says employees shouldn’t use generative AI tools including OpenAI’s AI chatbot ChatGPT. ChatGPT stores users conversations by default, leading companies to worry about data leaks.", url: "https://www.theverge.com/2023/5/19/23729619/apple-bans-chatgpt-openai-fears-data-leak", publishedAt: formatter.date(from: "01.06.2023")!,content: "Apple restricts employees from using ChatGPT over fear of data leaks\r\nApple restricts employees from using ChatGPT over fear of data leaks\r\n / Apple is the latest company to ban employees from using … [+2083 chars]")
}
