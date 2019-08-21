//
//  NewPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/12/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import URLImage

struct NewDetailsPage: View {
    
    var news: NewsModel!
    
    var body: some View {
        ScrollView {
            VStack {
                URLImage(URL(string: news.image!)!, placeholder: Image(systemName: "circle"))
                    .resizable()
                    .aspectRatio(2, contentMode: .fill)
                    .clipped()
                HStack {
                    Spacer()
                    Text(self.news.formatedDate!)
                    .font(.caption)
                    .padding(10)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text(self.news.title ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .lineLimit(nil)
                        .padding(10)
                        Spacer()
                    }
                    HStack {
                        Text(self.news.content ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .lineLimit(nil)
                        .padding(10)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle(Text("Details"), displayMode: .inline)
    }
}

#if DEBUG
struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        NewDetailsPage()
    }
}
#endif
