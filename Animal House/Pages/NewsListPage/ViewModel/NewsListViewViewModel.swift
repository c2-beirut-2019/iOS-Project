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

    @Published var news: [NewsModel] = [NewsModel]()

    var didAppear = false
    
    var didChange = PassthroughSubject<Void, Never>()

    var isLoading: Bool = false

    /// Bindable Property used for ending the pagination loading view
    @Published var isEndPagination: Bool = false
    
    private var pageIndex = 1
    private let limit = 20
    private var next: String {
        return "page=\(pageIndex)&limit=\(limit)"
    }
    
    var sut: Future<NewsListModel, Error>?
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
//        let dataUpdater = AnySubscriber<NewsListModel, Error>(
//            receiveValue: { [weak self] newsListModel -> Subscribers.Demand in
//                if isPage {
//                    self?.news.append(contentsOf: newsListModel.data!)
//                }
//                else {
//                    self?.news = newsListModel.data!
//                }
//                if (self?.news.count)! < newsListModel.totalCount! {
//                    self?.pageIndex += 1
//                }
//                else {
//                    self?.isEndPagination = true
//                }
//                return .max(1)
//            },
//            receiveCompletion: { [weak self] completion in
//                if case let .failure(error) = completion {
//                    print(error)
//                }
//                self?.isLoading = false
//            }
//        )

        self.sut = NetworkManager.sharedInstance.request(endPointType: NewsApi.getNews(paginationURL: next))
        
        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { newsListModel in
            if isPage {
                self.news.append(contentsOf: newsListModel.data!)
            }
            else {
                self.news = newsListModel.data!
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
