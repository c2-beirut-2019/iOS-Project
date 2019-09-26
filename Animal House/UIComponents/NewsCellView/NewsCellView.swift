//
//  NewView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import URLImage

struct NewsCellView: View {
        
    var newsCellModel: NewsCellViewViewModel!
    
    var body: some View {
        NavigationLink(destination: NewDetailsPage(news: self.newsCellModel)) {
            HStack(alignment: .top) {
                URLImage(URL(string: newsCellModel.image)!, placeholder: Image("squarelogogplaceholder").resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch))
                    .resizable()
                    .frame(width: 90, height: 90)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .aspectRatio(1, contentMode: .fill)
                VStack(alignment: .leading) {
                    HStack() {
                        Spacer()
                        Text(newsCellModel.date)
                        .font(.caption)
                        .fixedSize()
                    }
                    VStack(alignment: .leading) {
                        Text(newsCellModel.title)
                        .font(.headline)
                        .lineLimit(2)
                        Text(newsCellModel.content)
                        .font(.subheadline)
                        .lineLimit(2)
                    }
                }
            }
            .frame(height: 106, alignment: .leading)
        }
    }
}

#if DEBUG
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView()
    }

}
#endif
