//
//  ProductViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/27/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct ProductViewViewModel: Identifiable, Hashable {
    
    static func == (lhs: ProductViewViewModel, rhs: ProductViewViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var hashValue: Int {
        return id.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id = UUID()
    fileprivate var productModel: ProductModel!
    
    init(productModel: ProductModel) {
        self.productModel = productModel
    }
}

extension ProductViewViewModel {
    
    var image: String {
        return self.productModel.images?[0] ?? "www.apple.com"
    }
    
    var title: String {
        return self.productModel.title ?? ""
    }
    
    var description: String {
        return self.productModel.description ?? ""
    }
    
    var price: String {
        return "Price: \(self.productModel.price ?? 0) $"
    }
    
    var quantityAvailable: String {
        return "\(self.productModel.quantityAvailable ?? 0)"
    }
    
    var color: String {
        return self.productModel.colorsAvailable![0]
    }
    
}
