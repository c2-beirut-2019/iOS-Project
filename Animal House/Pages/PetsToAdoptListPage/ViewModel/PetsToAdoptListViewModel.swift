//
//  PetsToAdoptListViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 8/22/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class PetsToAdoptListViewModel: ObservableObject {

    var title = "Pets"
    
    @Published var petsToAdopt: [PetAdoptCellViewViewModel] = [PetAdoptCellViewViewModel]()
    @Published var mypets: [PetAdoptCellViewViewModel] = [PetAdoptCellViewViewModel]()
    
    var didAppear = false
    
    var isLoading: Bool = false
    var isLoadingMyPets = true
    
    /// Bindable Property used for ending the pagination loading view
    @Published var isEndPagination: Bool = false
    
    private var pageIndex = 1
    private let limit = 20
    private var next: String {
        return "page=\(pageIndex)&limit=\(limit)"
    }
    
    var petsToAdoptSut: Future<PaginationListModel<PetModel>, Error>?
    var mypetsSut: Future<[PetModel], Error>?
    var cancellable: AnyCancellable?
    
    //MARK: - Setup
    
    init() {
        
    }
    
    // MARK: - APIs
    
    func getPetsToAdopt(isPage: Bool) {
        self.isLoading = true
        self.isEndPagination = false
        if !isPage {
            self.pageIndex = 1
        }

        self.petsToAdoptSut = NetworkManager.sharedInstance.request(endPointType: PetsApi.petsToAdopt(paginationURL: next))
        
        self.cancellable = petsToAdoptSut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { petsListModel in
            var viewModels = [PetAdoptCellViewViewModel]()
            for each in petsListModel.data! {
                viewModels.append(PetAdoptCellViewViewModel(petModel: each))
            }
            
            if isPage {
                self.petsToAdopt.append(contentsOf: viewModels)
            }
            else {
                self.petsToAdopt.removeAll()
                self.petsToAdopt = viewModels
            }
            if self.petsToAdopt.count < petsListModel.totalCount! {
                self.pageIndex += 1
            }
            else {
                self.isEndPagination = true
            }
        })
    }
    
    func getMyPets() {
        self.mypetsSut = NetworkManager.sharedInstance.request(endPointType: PetsApi.myPets)
        
        self.cancellable = mypetsSut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }

        }, receiveValue: { petsListModel in
            var viewModels = [PetAdoptCellViewViewModel]()
            for each in petsListModel {
                viewModels.append(PetAdoptCellViewViewModel(petModel: each))
            }
            
            self.isLoadingMyPets = false
            self.mypets = viewModels
        })
    }
}
