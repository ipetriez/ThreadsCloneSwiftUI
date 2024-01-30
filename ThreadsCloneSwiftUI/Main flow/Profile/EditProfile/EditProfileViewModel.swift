//
//  EditProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 30.01.24.
//

import SwiftUI
import PhotosUI
import Combine

@MainActor
final class EditProfileViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published var selectedPhotoItem: PhotosPickerItem?
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    init() {
        $selectedPhotoItem.sink { [unowned self] item in
            Task { await uploadImage() }
        }.store(in: &subscriptions)
    }
    
    private func uploadImage() async {
        guard let item = selectedPhotoItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        guard let image = uiImage else { return }
        do {
            guard let imageURL = try await ImageUploader.shared.uploadImageToFirebase(image) else { return }
            try await UserService.shared.updateUserProfileImage(imageURL)
        } catch {
            print("DEBUG: Failed to update profile image with error: \(error)")
        }
    }
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
}
