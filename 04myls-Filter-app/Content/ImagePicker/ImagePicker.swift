//
//  ImagePicker.swift
//  04myls-Filter-app
//
//  Created by 04myls on R 5/06/18.
//

import Foundation
import SwiftUI

struct ImagePicker {
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType
}

extension ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker

    init(parent: ImagePicker) {
        self.parent = parent
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        parent.image = originalImage
        parent.isShown = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isShown = false
    }
}

