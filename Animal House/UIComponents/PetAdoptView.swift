//
//  PetAdoptView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/13/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct PetAdoptView: View {
    var body: some View {
        VStack(alignment: .leading) {
            LineInfoView(key: "Name", value: "Lexi")
            LineInfoView(key: "Color", value: "Black")
            LineInfoView(key: "Birth Date", value: "date")
            LineInfoView(key: "Category Name", value: "Dog")
            LineInfoView(key: "Specy Name", value: "Buchon")
        }
    }
}

#if DEBUG
struct PetAdoptView_Previews: PreviewProvider {
    static var previews: some View {
        PetAdoptView()
    }
}
#endif
