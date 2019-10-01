//
//  ProductsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 9/27/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ProductsListPage: View {
    
    @ObservedObject var viewModel: ProductListViewModel

    var body: some View {
        GeometryReader { geometry in
            ScrollView() {
                VStack {
                    ForEach(0..<self.viewModel.products.count, id: \.self) { productsPair in
                        HStack(alignment: .center) {
                            Spacer()
                            ForEach(self.viewModel.products[productsPair], id: \.self) { product in
                                ProductView(size: CGSize(width: (geometry.size.width-40)/2, height: (geometry.size.width-40)/2 + 40), productViewModel: product)
                                    .padding(.vertical, 10)
                            }
                            Spacer()
                        }
                    }
                    if !self.viewModel.isEndPagination {
                        LoadingRow(isLoading: true).onAppear {
                            if !self.viewModel.isLoading {
                                self.viewModel.getProducts(isPage: true)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(self.viewModel.title))
        .onAppear {
            guard !self.viewModel.didAppear else {
                return
            }
            self.viewModel.didAppear = true
            self.viewModel.getProducts(isPage: false)
        }
    }
    
}

//struct ProductsListPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductsListPage()
//    }
//}
