//
//  ProductCatalogueList.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/5/25.
//

import SwiftUI


struct ProductCatalogueList: View {
    let products: [Product]
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading, spacing:20){
                    ForEach(products){product in
                        ProductCatalogue(product: product)
                    }
                }
                
            }
            .navigationTitle("Product Catalogue")
            
        }
    }
}
#Preview {
    ProductCatalogueList(products: Product.mockProducts)
}
