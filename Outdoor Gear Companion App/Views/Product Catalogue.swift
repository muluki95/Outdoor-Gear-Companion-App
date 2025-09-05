import SwiftUI
import Kingfisher

struct ProductCatalogue: View {
    let product: Product   // ✅ property at the struct level
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Product Image
            if let urlString = product.imageURL,
               let url = URL(string: urlString) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 250)
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
            } label: {
                Text("Add to Inventory")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ProductCatalogue(product: Product.mockProducts[0])
}

