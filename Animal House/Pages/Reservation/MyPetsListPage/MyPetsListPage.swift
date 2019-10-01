//
//  MyPets.swift
//  Animal House
//
//  Created by Roy Geagea on 9/30/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct MyPetsListPage: View {
    
    @EnvironmentObject var shared: ReserveAppointmentViewModel
    @ObservedObject var viewModel: PetsToAdoptListViewModel
    @Binding var selectedPet: String
    
    var body: some View {
        VStack {
            List {
                ForEach(self.viewModel.mypets) { pet in
                    Button(action: {
                        self.shared.pet = pet.petModel
                        self.$selectedPet.wrappedValue = pet.name
                    }) {
                        PetAdoptCellView(viewModel: pet)
                            .accentColor(.black)
                    }
                }
                if self.viewModel.isLoadingMyPets {
                    LoadingRow(isLoading: true).onAppear {
                        
                    }
                }
            }
            .navigationBarTitle(Text("My Pets"), displayMode: .inline)
        }
        .onAppear {
            guard !self.viewModel.didAppear else {
                return
            }
            self.viewModel.didAppear = true
            if UserDefaultsManager.shared.isUserLoggedIn() {
                self.viewModel.getMyPets()
            }
        }
    }
}
