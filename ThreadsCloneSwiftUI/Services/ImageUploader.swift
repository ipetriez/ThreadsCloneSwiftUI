//
//  ImageUploader.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 30.01.24.
//

import Foundation
import Firebase
import FirebaseStorage

final class ImageUploader {
    
    static let shared = ImageUploader()
    
    private init() { }
    
    func uploadImageToFirebase(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(NSUUID().uuidString)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image to Firebase with error: \(error)")
            return nil
        }
    }
}
