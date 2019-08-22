//
//  PetAdoptView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/13/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct PetAdoptCellView: View {
    
    var viewModel: PetAdoptCellViewViewModel!
    
    var body: some View {
        VStack(alignment: .leading) {
            LineInfoView(key: "Name", value: viewModel.name)
            LineInfoView(key: "Color", value: viewModel.color)
            LineInfoView(key: "Birth Date", value: viewModel.color)
            LineInfoView(key: "Category Name", value: viewModel.categoryName)
            LineInfoView(key: "Specy Name", value: viewModel.specyName)
        }
    }
}

#if DEBUG
struct PetAdoptView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptCellView()
    }
}
#endif
