//
//  NewsCellViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 8/21/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct NewsCellViewViewModel: Identifiable {

    let id = UUID()
    fileprivate var newsModel: NewsModel!
    
    init(newsModel: NewsModel) {
        self.newsModel = newsModel
    }
}

extension NewsCellViewViewModel {
    
    var image: String {
        return self.newsModel.image!
    }
    
    var title: String {
        return self.newsModel.title ?? ""
    }
    
    var content: String {
        return self.newsModel.content ?? ""
    }
    
    var date: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormater.date(from: self.newsModel.creationDate!)
        dateFormater.dateFormat = "E dd MMM yyyy"
        return dateFormater.string(from: date!)
    }
    
}
