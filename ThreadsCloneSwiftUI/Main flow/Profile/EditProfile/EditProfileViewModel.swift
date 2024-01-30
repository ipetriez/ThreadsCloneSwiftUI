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
    
    init() {
        $selectedPhotoItem.sink { [unowned self] item in
            Task { await uploadImage() }
        }.store(in: &subscriptions)
    }
    
    private func uploadImage() async {
        guard let item = selectedPhotoItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        profileImage = Image(uiImage: uiImage)
    }
}
