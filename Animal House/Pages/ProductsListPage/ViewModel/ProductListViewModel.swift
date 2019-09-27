//
//  ProductListViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/27/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class ProductListViewModel: ObservableObject {
    
    var title = "Products"
    
    @Published var products: [[ProductViewViewModel]] = [[ProductViewViewModel]]()
    
    var didAppear = false
    
    var isLoading: Bool = false

    /// Bindable Property used for ending the pagination loading view
    @Published var isEndPagination: Bool = false
    
    private var pageIndex = 1
    private let limit = 20
    private var next: String {
        return "page=\(pageIndex)&limit=\(limit)"
    }
    
    var sut: Future<PaginationListModel<ProductModel>, Error>?
    var cancellable: AnyCancellable?
    
    //MARK: - Setup
    
    init() {
        
    }
    
    // MARK: - APIs
    
    func getProducts(isPage: Bool) {
        self.isLoading = true
        self.isEndPagination = false
        if !isPage {
            self.pageIndex = 1
        }

        self.sut = NetworkManager.sharedInstance.request(endPointType: ProductsApi.getProducts(paginationURL: next))
        
        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { productsListModel in
            var viewModels = [ProductViewViewModel]()
            for each in productsListModel.data! {
                viewModels.append(ProductViewViewModel(productModel: each))
            }
            
            if isPage {
                _ = viewModels.publisher.collect(2).collect().sink(receiveValue:
                    {self.products.append(contentsOf: $0)}
                )
            }
            else {
                self.products.removeAll()
                _ = viewModels.publisher.collect(2).collect().sink(receiveValue:
                    {self.products.append(contentsOf: $0)}
                )
            }
            if self.products.flatMap({$0}).count < productsListModel.totalCount! {
                self.pageIndex += 1
            }
            else {
                self.isEndPagination = true
            }
        })
    }
}
