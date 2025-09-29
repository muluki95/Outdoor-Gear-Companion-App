//
//  BrowseGearViewModel.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/29/25.
//
import Foundation
import FirebaseFirestore
import SwiftUI



class BrowseGearViewModel: ObservableObject {
    @Published var gears: [Gear] = []
    private var db = Firestore.firestore()
    
    
    
    
    func fetchGears() async throws {
        do{
            let snapshot = try await db.collection("gears").getDocuments()
            self.gears = snapshot.documents.compactMap { document in
                try? document.data(as: Gear.self)
                
            }
            
        } catch {
            print("Error fetching gears: \(error.localizedDescription)")
        }
        
    }
    
}
