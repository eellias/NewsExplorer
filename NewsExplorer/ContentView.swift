//
//  ContentView.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 11.06.2023.
//

import SwiftUI



struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
            NavigationView {
                List(viewModel.articles, id: \.self) { article in
                    NavigationLink(destination: ArticleVIew(article: article)) {
                        HStack {

                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                Text(article.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
//                .navigationDestination(for: Article.self, destination: { article in
//                    ArticleVIew(article: article)
//                })
                .navigationTitle("NewsExplorer")
            }
            
            .onAppear {
                viewModel.fetch()
            }
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
