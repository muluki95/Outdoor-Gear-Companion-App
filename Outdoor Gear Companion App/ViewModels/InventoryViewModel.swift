//
//  InventoryViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/20/25.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore


class InventoryViewModel: ObservableObject {
    @Published var items: [Inventory] = []
    
    
    private let db = Firestore.firestore()
    
    
    func addInventoryItem(image: UIImage ,imageName: String, description: String ){
        uploadImage(image) {[weak self] result in
            switch result {
                
            }
            
        }
    }
}
