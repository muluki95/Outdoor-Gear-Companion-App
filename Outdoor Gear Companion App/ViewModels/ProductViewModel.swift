//
//  ProductViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/24/25.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    private var db = Firestore.firestore()
    
    init() {
        Task{
            try await fetchProducts()
        }
    }
    
    
    func fetchProducts() async throws {
        do{
            let snapshot = try await db.collection("products").getDocuments()
            
            let products = try snapshot.documents.compactMap { try $0.data(as: Product.self)
            }
            self.products = products
                
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
            
        }
    }
}
