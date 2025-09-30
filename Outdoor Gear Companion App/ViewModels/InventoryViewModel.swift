//
//  InventoryViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/20/25.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class InventoryViewModel: ObservableObject {
    @Published var items: [Inventory] = []
    @Published var gears: [Gear] = []
    @Published var products: [Product] = []
       
    
    
   
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
    
    func addGear(_ gear: Gear) {
            if !gears.contains(where: { $0.id == gear.id }) {
                gears.append(gear)
            }
        }
    
    
    //add new inventory item
    func addProduct(product: Product) async throws {
        if !products.contains(where: { $0.id == product.id }) {
                    products.append(product)
                }
        
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

