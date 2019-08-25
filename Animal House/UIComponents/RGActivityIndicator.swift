//
//  RGActivityIndicator.swift
//  Animal House
//
//  Created by Roy Geagea on 8/26/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct RGActivityIndicator: UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<RGActivityIndicator>) -> UIActivityIndicatorView {
        let activityIndidator = UIActivityIndicatorView(style: style)
        activityIndidator.tintColor = .white
        return activityIndidator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<RGActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//struct RGActivityIndicator_Previews: PreviewProvider {
//    static var previews: some View {
//        RGActivityIndicator()
//    }
//}
