import SwiftUI
import Kingfisher

struct ProductCatalogue: View {
    let product: Product
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Product Image
            if let urlString = product.imageURL,
               let url = URL(string: urlString) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
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
            if !viewModel.products.contains(where: {$0.id == product.id}) {
                Button {
                    // action
                    Task{
                        do{
                            try await viewModel.addProduct(product: product)
                        }catch {
                            print("Failed to add inventory: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text( "Add to Inventory")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background( Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Text(" Added to Inventory")
                    .foregroundColor(.green)
                    .font(.subheadline)
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

