//
//  InventoryViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/20/25.
//
/***
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

@MainActor
class InventoryViewModel: ObservableObject {
    private let repository: InventoryRepository
    
    @Published var inventoryItems:[Inventory] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil
    
    
    init(repository: InventoryRepository = InventoryRepository()) {
        self.repository = repository
    }
    
    
    //read
    func fetchInventoryItems() async {
        isLoading = true
        
        do{
            self.inventoryItems = try await repository.fetchInventoryItems()
            
        } catch {
            errorMessage = "Error fetching inventory items: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    
    //create
    func addInventoryItem(image: UIImage?, imageName: String, description: String) async {
        isLoading = true
        
        do{
            //var imageURL: String? = nil
            //if let image = image {
               // imageURL = try await repository.uploadImage(image)
                
            }
            let newItem = Inventory(
                id: UUID().uuidString,
                //imageURL: imageURL,
                imageName: imageName,
                description: description
            )
           // try await repository.createInventoryItem(newItem)
           // inventoryItems.append(newItem)
            
        }catch {
            errorMessage = "Error adding new inventory item: \(error.localizedDescription)"
            
        }
        isLoading = false
    }
    
    //update
    
    func updateInventoryItem(_ item: Inventory) async {
        isLoading = true
        do{
            try await repository.updateInventoryItem(item)
            
            if let index = inventoryItems.firstIndex(where: {$0.id == item.id}){
                inventoryItems[index] = item
            }
            
        } catch {
            errorMessage = "Failed to update item:\(error.localizedDescription)"
            
        }
        isLoading = false
    }
    
    
    
    //delete
    func deleteInventoryItem(_ item: Inventory) async {
        isLoading = true
        
        do{
            try await repository.deleteItem(id: item.id)
            inventoryItems.removeAll(where: {$0.id == item.id})
        } catch {
            errorMessage = "Failed to delete item: \(error.localizedDescription)"
            
        }
        isLoading = false
    }
}
*/
