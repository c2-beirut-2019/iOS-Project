//
//  ProductView.swift
//  Animal House
//
//  Created by Roy Geagea on 9/27/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import URLImage

struct ProductView: View {
    
    var size: CGSize
    
    var productViewModel: ProductViewViewModel!

    var body: some View {
        VStack {
            URLImage(URL(string: self.productViewModel.image)!, placeholder: Image("squarelogogplaceholder").resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch))
                .resizable()
                .frame(width: size.width, height: size.width)
                .aspectRatio(1, contentMode: .fill)
            Text(self.productViewModel.title)
            .lineLimit(1)
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            Text(self.productViewModel.price)
            .lineLimit(1)
        }
        .cornerRadius(10)
        .scaledToFit()
        .shadow(radius: 10)
    }
}
