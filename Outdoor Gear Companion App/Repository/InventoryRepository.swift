//
//  InventoryRepository.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/20/25.
//

import FirebaseFirestore
import FirebaseStorage


struct InventoryRepository {
     private let db = Firestore.firestore().collection ("Inventory")
     private let storage = Storage.storage()
    
    
    
    //uplaod image
    func uploadImage(_ image: UIImage) async throws -> String {
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
    }
    //create Inventory Item
    func createInventoryItem(_ inventory: Inventory) async throws {
        try db.document(inventory.id).setData(from: inventory)
        
    }
    
    //fetch Inventory item
     func fetchInventoryItems() async throws -> [Inventory]{
        let snapshot = try await db.getDocuments()
        let items = snapshot.documents.compactMap { doc in
            try? doc.data(as: Inventory.self)
        }
        return items
    }
    
    
    //update item
    
    func updateInventoryItem(_ inventory: Inventory) async throws {
        try db.document(inventory.id).setData(from: inventory, merge: true)
    }
    //delete item
     func deleteItem(id: String) async throws {
        try await db.document(id).delete()
    }
    
}





