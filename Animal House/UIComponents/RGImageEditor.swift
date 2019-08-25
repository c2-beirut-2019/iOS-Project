//
//  RGImageEditor.swift
//  Animal House
//
//  Created by Roy Geagea on 8/25/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import CropViewController

struct RGImageEditor: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = CropViewController
    
    @Binding var isShown: Bool
    var inputImage: UIImage!
    @Binding var outputImage: Image?
    
    class Coordinator: NSObject, CropViewControllerDelegate {

        @Binding var isShown: Bool
        var inputImage: UIImage!
        @Binding var outputImage: Image?

        init(isShown: Binding<Bool>, inputImage: UIImage, outputImage: Binding<Image?>) {
            _isShown = isShown
            self.inputImage = inputImage
            _outputImage = outputImage
        }
        
        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            self.outputImage = Image(uiImage: image)
            self.inputImage = image
            self.isShown = false
        }
    }
    
    func makeCoordinator() -> RGImageEditor.Coordinator {
        return Coordinator(isShown: $isShown, inputImage: self.inputImage, outputImage: $outputImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<RGImageEditor>) -> CropViewController {
        let cropController = CropViewController(croppingStyle: .circular, image: self.inputImage)
        cropController.delegate = context.coordinator
        return cropController
    }
    
    func updateUIViewController(_ uiViewController: CropViewController, context: UIViewControllerRepresentableContext<RGImageEditor>) {
        
    }
}

