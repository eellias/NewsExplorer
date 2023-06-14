//
//  ArticleVIew.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 12.06.2023.
//

import SwiftUI

struct ArticleVIew: View {
    
    let article: Article
    
    
    var formatter = CustomDateFormatter()
    
    var body: some View {
        VStack {
            URLImage(urlString: article.urlToImage ?? "https://live-production.wcms.abc-cdn.net.au/352b2cd883ebe14b3633550699f8d41f?impolicy=wcms_crop_resize&cropH=3000&cropW=3000&xPos=0&yPos=0&width=3000&height=3000")

            Text(article.description)
                .padding()
            HStack {
                Text(article.author ?? "")
                    .padding()
                Spacer()
                Text(article.source.name)
                    .padding(20)
            }
            Text(formatter.formatDate(article.publishedAt))
            Spacer()
            
        }
        
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ArticleVIew_Previews: PreviewProvider {
    static var previews: some View {
        ArticleVIew(article: Article.example)
    }
}
