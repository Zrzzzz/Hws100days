//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Zr埋 on 2020/8/8.
//

import SwiftUI

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage, success: (() -> Void)? = nil, failure: ((Error) -> Void)? = nil) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
        self.successHandler = success
        self.errorHandler = failure
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
