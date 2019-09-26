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
    
    var news: NewsCellViewViewModel!
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    HStack {
                        Text(self.news.title)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .lineLimit(nil)
//                        .padding(10)
                        .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    .padding(10)
                    URLImage(URL(string: self.news.image)!, placeholder: Image("logoPlaceholder").resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch))
                        .resizable()
                        .clipped()
                        .aspectRatio(2, contentMode: .fill)
                        .frame(width: geo.size.width, height: 0.5*geo.size.width)
                    HStack {
                        Spacer()
                        Text(self.news.date)
                        .font(.caption)
                        .padding(10)
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(self.news.content)
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                    }
                    .padding(10)
                }
            }
            .navigationBarTitle(Text("Details"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        NewDetailsPage()
    }
}
#endif
