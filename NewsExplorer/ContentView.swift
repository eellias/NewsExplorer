//
//  ContentView.swift
//  NewsExplorer
//
//  Created by Ilya Tovstokory on 11.06.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ViewModel()
    var dateFormatter = CustomDateFormatter()
    @State private var selectedParam = "publishedAt"
    let params = ["relevancy", "popularity", "publishedAt"]
    
    @State private var isDatePickerVisible = false
    @State private var isSelectDateRangeVisible = true
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        
        VStack {
            NavigationView {
                List(viewModel.articles, id: \.self) { article in
                    NavigationLink {
                        ArticleVIew(article: article)
                    } label: {
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
                .navigationTitle("NewsExplorer")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Picker("Sorting", selection: $selectedParam) {
                            ForEach(params, id: \.self) {param in
                                Text(param)
                            }
                        }
                        .padding()
                        .onChange(of: selectedParam) { newValue in
                            viewModel.fetchData(query: searchText.isEmpty ? "default" : searchText, sortBy: newValue, fromDate: nil, toDate: nil)
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            isDatePickerVisible.toggle()
                        }) {
                            Image(systemName: "calendar")
                            Text("Select Date Range")
                        }
                    }
                }
                .sheet(isPresented: $isDatePickerVisible) {
                    VStack {
                        DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding()
                        DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding()
                        Button("Apply") {
                            isDatePickerVisible = false
                            
                            viewModel.fetchData(query: searchText.isEmpty ? "default" : searchText, sortBy: selectedParam.isEmpty ? nil : selectedParam, fromDate: dateFormatter.formatDatePickerDate(startDate), toDate: dateFormatter.formatDatePickerDate(endDate))
                            
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search articles")
            
            .onChange(of: searchText, perform: { newValue in
                if !newValue.isEmpty {
                    viewModel.fetchData(query: newValue, sortBy: nil, fromDate: nil, toDate: nil)
                }
                else {
                    viewModel.fetchData(query: "default", sortBy: nil, fromDate: nil, toDate: nil)
                }
            })
            .onAppear {
                viewModel.fetchData(query: "default", sortBy: nil, fromDate: nil, toDate: nil)
            }
        }
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
