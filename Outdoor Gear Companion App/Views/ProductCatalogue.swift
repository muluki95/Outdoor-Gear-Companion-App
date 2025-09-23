import SwiftUI
import Kingfisher

struct ProductCatalogue: View {
    let product: Product
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var isAdded = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Product Image
            if let urlString = product.imageURL,
               let url = URL(string: urlString) {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 450)
                    .cornerRadius(12)
            }
            
            // Product Name
            Text(product.imageName)
                .font(.headline)
                .fontWeight(.semibold)
            
            
            RatingView(rating: product.rating)
            
            // Description
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Specifications
            VStack(alignment: .leading, spacing: 8) {
                Text("Specifications")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                ForEach(product.specifications.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    HStack {
                        Text(key)
                            .font(.subheadline)
                        Spacer()
                        Text(value)
                            .font(.subheadline)
                    }
                }
            }
            
            // Add to Inventory Button
            Button {
                // action
                Task{
                   try await viewModel.addInventory(product: product)
                }
            } label: {
                Text(isAdded ? "Added ✅" : "Add to Inventory")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(isAdded ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview {
    ProductCatalogue(product: Product.mockProducts[0])
}

