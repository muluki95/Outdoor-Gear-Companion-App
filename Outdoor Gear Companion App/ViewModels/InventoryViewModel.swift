//
//  InventoryViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/20/25.
//

import SwiftUI
import FirebaseFirestore


class InventoryViewModel: ObservableObject {
    @Published var items: [Inventory] = []
   
    private var db = Firestore.firestore()
    
    init() {
        Task {
            await fetchInventory()
        }
    }
    
    
    func fetchInventory() async {
        do{
            let snapshot = try await db.collection("inventory")
                .order(by: "imageName")
                .getDocuments()
            
            let inventory = try snapshot.documents.compactMap {
                try $0.data(as: Inventory.self)
            }
            self.items = inventory
            
        } catch {
            
        }
        
    }
    
    
    //add new inventory item
    func addInventory(product: Product) async throws {
        let newInventoryItem = Inventory (
            uid: nil,
            imageURL: product.imageURL,
            imageName: product.imageName,
            description: product.description,
        )
        
        do{
            _  = try db.collection("inventory").addDocument(from: newInventoryItem)
            print("Added to inventory collection ")
            
            await fetchInventory()
            
        } catch {
            print("Error adding new inventory item: \(error.localizedDescription)")
        }
    }
}

