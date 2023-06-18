//
//  FilterType.swift
//  04myls-Filter-app
//
//  Created by 04myls on R 5/06/18.
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

enum FilterType: String {
    case pixellate = "モザイク"
    case sepiaTone = "セピア"
    case sharpenLuminance = "シャープ"
    case photoEffectMono = "モノクロ"
    case gaussianBlur = "ブラー"

    private func makeFilter(inputImage: CIImage?) -> CIFilterProtocol {

        switch self {
            case .pixellate:
                let currentFilter = CIFilter.pixellate()
                currentFilter.inputImage = inputImage
                currentFilter.scale = 40
                return currentFilter
            case .sepiaTone:
                let currentFilter = CIFilter.sepiaTone()
                currentFilter.inputImage = inputImage
                currentFilter.intensity = 1
                return currentFilter
            case .sharpenLuminance:
                let currentFilter = CIFilter.sharpenLuminance()
                currentFilter.inputImage = inputImage
                currentFilter.sharpness = 0.5
                currentFilter.radius = 100
                return currentFilter
            case .photoEffectMono:
                let currentFilter = CIFilter.photoEffectMono()
                currentFilter.inputImage = inputImage
                return currentFilter
            case .gaussianBlur:
                let currentFilter = CIFilter.gaussianBlur()
                currentFilter.inputImage = inputImage
                currentFilter.radius = 10
                return currentFilter
        }
    }

    func filter(inputImage: UIImage) -> UIImage? {
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        let currentFilter = makeFilter(inputImage: beginImage)

        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return nil }

        // attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            return UIImage(cgImage: cgimg, scale: 0, orientation: inputImage.imageOrientation)
        } else {
            return nil
        }
    }
}
