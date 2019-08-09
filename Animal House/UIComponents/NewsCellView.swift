//
//  NewView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct NewsCellView: View {
        
    var body: some View {
        HStack() {
            Image(uiImage: UIImage(imageLiteralResourceName: "test.jpeg"))
                .resizable()
                .frame(width: 90, height: 90)
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .scaledToFill()
            VStack (alignment: .leading) {
                Text("Title")
                .font(.headline)
                Text("asdasdsadasd")
                .font(.subheadline)
                
            }
            Spacer(minLength: 8)
            VStack(alignment: .trailing) {
                Text("Date")
                .offset(x: 0, y: -30)
            }
            .padding(.horizontal, 8)
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
