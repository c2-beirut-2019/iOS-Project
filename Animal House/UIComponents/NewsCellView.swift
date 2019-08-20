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
        
    var news: NewsModel!
    
    var body: some View {
        NavigationLink(destination: NewDetailsPage(news: self.news)) {
            HStack() {
                URLImage(URL(string: news.image!)!, placeholder: Image(systemName: "circle"))
                    .resizable()
                    .frame(width: 90, height: 90)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .scaledToFill()
                VStack (alignment: .leading) {
                    Text(news.title ?? "")
                    .font(.headline)
                    Text(news.content ?? "")
                    .font(.subheadline)
                    
                }
                Spacer(minLength: 8)
                VStack(alignment: .trailing) {
                    Text(news.formatedDate ?? "")
                        .font(.caption)
                    .offset(x: 0, y: -40)
                }
                .padding(.horizontal, 8)
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
