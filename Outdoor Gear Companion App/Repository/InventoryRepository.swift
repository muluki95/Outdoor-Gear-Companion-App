//
//  InventoryRepository.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/20/25.
//

import FirebaseFirestore
import FirebaseStorage


struct InventoryRepository {
    static let inventoryReference = Firestore.firestore().collection ("Inventory")
    static let storage = Storage.storage()
    
    
    
    //uplaod image
    static func uploadImage(_ image: UIImage) async throws -> String {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            throw NSError(domain: "ImageConversion", code: 0, userInfo: [NSLocalizedDescriptionKey:"Failed to convert UIImage to Data"])
        }
        
        let fileName = UUID().uuidString
        let ref = storage.reference().child("inventory_images/\(fileName).jpg")
        
        //upload data
        
        _ = try await ref.putDataAsync(data)
        
        //get download URL
        
        let url = try await ref.downloadURL()
        return url.absoluteString
        
    //create Inventory Item
        func createInventoryItem(_ inventory: Inventory) async throws {
            let documentID = UUID().uuidString
            let documentRef = inventoryReference.document(documentID)
            try documentRef.setData(from: inventory)
            
        }
        
    }
    
}





