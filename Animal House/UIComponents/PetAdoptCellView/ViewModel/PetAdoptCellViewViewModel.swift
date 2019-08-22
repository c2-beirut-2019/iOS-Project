//
//  PetAdoptCellViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 8/22/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct PetAdoptCellViewViewModel: Identifiable {

    let id = UUID()
    fileprivate var petModel: PetModel!
    
    init(petModel: PetModel) {
        self.petModel = petModel
    }
}

extension PetAdoptCellViewViewModel {
    
    var name: String {
        return self.petModel.name ?? ""
    }
    
    var color: String {
        return self.petModel.color ?? ""
    }
    
    var dateOfBirth: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormater.date(from: self.petModel.dateOfBirth!)
        dateFormater.dateFormat = "E dd MMM yyyy"
        return dateFormater.string(from: date!)
    }
    
    var categoryName: String {
        return self.petModel.category_name ?? ""
    }
    
    var specyName: String {
        return self.petModel.specie_name ?? ""
    }
    
    
}
