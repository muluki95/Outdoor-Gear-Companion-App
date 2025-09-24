//
//  ProductCatalogueList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/5/25.
//

import SwiftUI


struct ProductCatalogueList: View {
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading, spacing:20){
                    if productVM.products.isEmpty {
                        ProgressView("Loading products...")
                    } else {
                        ForEach(productVM.products){product in
                            ProductCatalogue(product: product)
                        }
                    }
                }
                
            }
            .navigationTitle("Product Catalogue")
            .onAppear {
                Task{
                    try await productVM.fetchProducts()
                }
            }
            
        }
    }
}
#Preview {
    ProductCatalogueList()
        .environmentObject(ProductViewModel())
}
