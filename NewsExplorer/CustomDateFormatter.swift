//
//  CustomDate.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 12.06.2023.
//

import Foundation

class CustomDateFormatter {
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    func date(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: string)
    }
    
    func formatDatePickerDate(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formattedDate = formatter.string(from: date)
        
        return formattedDate
    }
}


//var body: some View {
//    
//    VStack {
//        
//        Button("Select date range") {
//            isDatePickerVisible.toggle()
//        }
//        .padding()
//        if isDatePickerVisible {
//            VStack {
//                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
//                    .datePickerStyle(.compact)
//                    .padding()
//                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
//                    .datePickerStyle(.compact)
//                    .padding()
//                Button("Select") {
//                    viewModel.fetchData(query: searchText.isEmpty ? "default" : searchText, sortBy: selectedParam.isEmpty ? nil : selectedParam, fromDate: dateFormatter.formatDatePickerDate(startDate), toDate: dateFormatter.formatDatePickerDate(endDate))
//                    print(dateFormatter.formatDatePickerDate(startDate), dateFormatter.formatDatePickerDate(endDate))
//                    isDatePickerVisible.toggle()
//                }
//            }
//        }
//        
//        NavigationView {
//            List(viewModel.articles, id: \.self) { article in
//                NavigationLink(destination: ArticleVIew(article: article)) {
//                    HStack {
//                        
//                        VStack(alignment: .leading) {
//                            Text(article.title)
//                                .font(.headline)
//                            Text(article.description)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("NewsExplorer")
//        }
//        .searchable(text: $searchText, prompt: "Search articles")
//        .onChange(of: searchText, perform: { newValue in
//            if !newValue.isEmpty {
//                viewModel.fetchData(query: newValue, sortBy: nil, fromDate: nil, toDate: nil)
//            }
//            else {
//                viewModel.fetchData(query: "default", sortBy: nil, fromDate: nil, toDate: nil)
//            }
//        })
//        .onAppear {
//            viewModel.fetchData(query: "default", sortBy: nil, fromDate: nil, toDate: nil)
//        }
//        Picker("Sorting", selection: $selectedParam) {
//            ForEach(params, id: \.self) {param in
//                Text(param)
//            }
//            
//        }
//        .onChange(of: selectedParam) { newValue in
//            viewModel.fetchData(query: searchText.isEmpty ? "default" : searchText, sortBy: newValue, fromDate: nil, toDate: nil)
//        }
//        
//    }
//    
//}
