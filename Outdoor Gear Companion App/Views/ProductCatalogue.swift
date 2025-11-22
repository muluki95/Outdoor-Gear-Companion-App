import SwiftUI
import Kingfisher

struct ProductCatalogue: View {
    let product: Product
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

           
            if let urlString = product.imageURL,
               let url = URL(string: urlString) {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 450)
                    .clipped()
                    .cornerRadius(12)
            }

            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.imageName)
                    .font(.headline)
                    .fontWeight(.semibold)

                
                HStack {
                    RatingView(rating: product.rating)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }

            // Specifications
            VStack(alignment: .leading, spacing: 8) {
                Text("Specifications")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                ForEach(product.specifications.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    HStack {
                        Text(key).font(.subheadline)
                        Spacer()
                        Text(value).font(.subheadline)
                    }
                }
            }

            
            if !viewModel.products.contains(where: { $0.id == product.id }) {
                Button {
                    Task {
                        do {
                            try await viewModel.addProduct(product: product)
                        } catch {
                            print("Failed to add inventory: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text("Add to Inventory")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Text("Added to Inventory")
                    .foregroundColor(.green)
                    .font(.subheadline)
            }

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }

        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .fixedSize(horizontal: false, vertical: true)
    }
}
