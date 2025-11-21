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
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 450)
                    .clipped()
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
            }
            
            // Product Name
            Text(product.imageName)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
            
            
            RatingView(rating: product.rating)
                .padding(.horizontal, 16)
            
            // Description
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 16)
            
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
            .padding(.horizontal, 16)
            
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
                        .padding(.horizontal, 16)
                }
            } else {
                Text(" Added to Inventory")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .padding(.horizontal, 16)
            }
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal, 16)
            }
        }
        .padding(.vertical,20)
    }
}

