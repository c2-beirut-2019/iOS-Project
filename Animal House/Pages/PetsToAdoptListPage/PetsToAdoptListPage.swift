//
//  PetsToAdoptListViewPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/22/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct PetsToAdoptListPage: View {

    @ObservedObject var viewModel: PetsToAdoptListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.pets) { pet in
                    PetAdoptCellView(viewModel: pet)
                }
                if !self.viewModel.isEndPagination {
                    LoadingRow(isLoading: true).onAppear {
                        if !self.viewModel.isLoading {
                            self.viewModel.getPetsToAdopt(isPage: true)
                        }
                    }
                }
            }
            .navigationBarTitle(Text(self.viewModel.title))
        }
        .onAppear {
            guard !self.viewModel.didAppear else {
                return
            }
            self.viewModel.didAppear = true
            self.viewModel.getPetsToAdopt(isPage: false)
        }
    }
    
}

struct PetsToAdoptListViewPage_Previews: PreviewProvider {
    static var previews: some View {
        PetsToAdoptListPage(viewModel: PetsToAdoptListViewModel())
    }
}
