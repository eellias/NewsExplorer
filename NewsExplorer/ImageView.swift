//
//  ImageView.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 12.06.2023.
//

import Foundation
import SwiftUI

struct URLImage:View {
    let urlString: String

    @State var data: Data?

    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "photo")
                .onAppear {
                    fetchData()
                }
        }
    }

    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
