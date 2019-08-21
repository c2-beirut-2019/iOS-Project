//
//  NewsListViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 8/17/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class NewsListViewViewModel: ObservableObject {

    @Published var news: [NewsCellViewViewModel] = [NewsCellViewViewModel]()

    var didAppear = false
    
    var isLoading: Bool = false

    /// Bindable Property used for ending the pagination loading view
    @Published var isEndPagination: Bool = false
    
    private var pageIndex = 1
    private let limit = 20
    private var next: String {
        return "page=\(pageIndex)&limit=\(limit)"
    }
    
    var sut: Future<PaginationListModel<NewsModel>, Error>?
    var cancellable: AnyCancellable?
    
    //MARK: - Setup
    
    init() {
        
    }
    
    // MARK: - APIs
    
    func getNews(isPage: Bool) {
        self.isLoading = true
        self.isEndPagination = false
        if !isPage {
            self.pageIndex = 1
        }

        self.sut = NetworkManager.sharedInstance.request(endPointType: NewsApi.getNews(paginationURL: next))
        
        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { newsListModel in
            var viewModels = [NewsCellViewViewModel]()
            for each in newsListModel.data! {
                viewModels.append(NewsCellViewViewModel(newsModel: each))
            }
            
            if isPage {
                self.news.append(contentsOf: viewModels)
            }
            else {
                self.news.removeAll()
                self.news = viewModels
            }
            if self.news.count < newsListModel.totalCount! {
                self.pageIndex += 1
            }
            else {
                self.isEndPagination = true
            }
        })
        
        
    }
}
