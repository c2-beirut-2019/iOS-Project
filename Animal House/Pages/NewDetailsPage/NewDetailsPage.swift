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
                        .frame(height: 200, alignment: .top)
                VStack(alignment: .trailing) {
                    Text(self.news.formatedDate!)
                    .padding(10)
                }
                VStack(alignment: .leading) {
                    Text(self.news.title ?? "")
                    .font(.headline)
                    Text(self.news.content ?? "")
                    .font(.subheadline)
                }
                Spacer()
            }
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
