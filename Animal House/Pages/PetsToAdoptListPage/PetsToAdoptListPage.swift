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

    @State private var selectedIndex = 0
    @State private var numbers = ["To Adopt", "My Pets"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Numbers", selection: $selectedIndex) {
                      ForEach(0 ..< numbers.count) { index in
                          Text(self.numbers[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .navigationBarTitle(Text(self.viewModel.title), displayMode: .inline)

                if selectedIndex == 0 {
                    List {
                        ForEach(self.viewModel.petsToAdopt) { pet in
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
                }
                else {
                    if UserDefaultsManager.shared.isUserLoggedIn() {
                        List {
                            ForEach(self.viewModel.mypets) { pet in
                                PetAdoptCellView(viewModel: pet)
                            }
                            if self.viewModel.isLoadingMyPets {
                                LoadingRow(isLoading: true).onAppear {
                                    
                                }
                            }
                        }
                    }
                    else {
                        FeaturePermission()
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            guard !self.viewModel.didAppear else {
                return
            }
            self.viewModel.didAppear = true
            self.viewModel.getPetsToAdopt(isPage: false)
            if UserDefaultsManager.shared.isUserLoggedIn() {
                self.viewModel.getMyPets()
            }
        }
    }
    
}

struct PetsToAdoptListViewPage_Previews: PreviewProvider {
    static var previews: some View {
        PetsToAdoptListPage(viewModel: PetsToAdoptListViewModel())
    }
}
