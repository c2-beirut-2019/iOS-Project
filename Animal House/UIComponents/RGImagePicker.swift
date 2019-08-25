//
//  RGImagePicker.swift
//  Animal House
//
//  Created by Roy Geagea on 8/23/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import YPImagePicker

struct RGImagePicker: UIViewControllerRepresentable {

    typealias UIViewControllerType = YPImagePicker
    
    @Binding var isShown: Bool
    @Binding var isShowEditor: Bool
    @Binding var image: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<RGImagePicker>) -> YPImagePicker {
        var config = YPImagePickerConfiguration()
        config.showsPhotoFilters = false
        config.hidesStatusBar = false
        config.startOnScreen = YPPickerScreen.library
        self.isShowEditor = false
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if let photo = items.singlePhoto {
                self.isShown = false
                self.image = photo.image
                self.isShowEditor = true
            } else {
                self.isShown = false
                print("Picker was canceled")
            }
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: YPImagePicker, context: UIViewControllerRepresentableContext<RGImagePicker>) {
        
    }

}
