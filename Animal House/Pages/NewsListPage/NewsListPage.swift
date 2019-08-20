//
//  NewsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

struct NewsListPage: View {
    
    @ObservedObject var viewModel: NewsListViewViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.news) { news in
                    NewsCellView(news: news)
                }
                if !self.viewModel.isEndPagination {
                    LoadingRow(isLoading: true).onAppear {
                        if !self.viewModel.isLoading {
                            self.viewModel.getNews(isPage: true)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("News"))
        }
        .onAppear {
            guard !self.viewModel.didAppear else {
                return
            }
            self.viewModel.didAppear = true
            self.viewModel.getNews(isPage: false)
        }
    }
}

#if DEBUG
struct NewsListPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsListPage(viewModel: NewsListViewViewModel())
    }
}
#endif
