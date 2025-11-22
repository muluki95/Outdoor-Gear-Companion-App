import SwiftUI

struct AllInventoryList: View {
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var itemsToDelete: Any? = nil
   
    @State private var showConfirmDelete = false
    
    var body: some View {
        NavigationStack {
            List {
                gearSection
                productSection
            }
            .navigationTitle("Inventory")
            .confirmationDialog(
                "Are you sure you want to remove this item from inventory?",
                isPresented: $showConfirmDelete,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    if let gear = itemsToDelete as? Gear {
                        viewModel.removeGear(gear)
                    } else if let product = itemsToDelete as? Product {
                        viewModel.removeProduct(product)
                    }
                    itemsToDelete = nil
                }
                Button("Cancel", role: .cancel) {
                    itemsToDelete = nil
                }
            }
        }
    }
    
    //  Sections
    
    private var gearSection: some View {
        Group {
            if !viewModel.gears.isEmpty {
                Section(header: Text("Gears")) {
                    ForEach(viewModel.gears) { gear in
                        gearRow(gear)
                            .listRowBackground(Color.clear)
                    }
                }
            }
        }
    }
    
    private var productSection: some View {
        Group {
            if !viewModel.products.isEmpty {
                Section(header: Text("Products")) {
                    ForEach(viewModel.products) { product in
                        productRow(product)
                            .listRowBackground(Color.clear)
                    }
                }
            }
        }
    }
    
    // MARK: - Row Builders
    
    private func gearRow(_ gear: Gear) -> some View {
        VStack {
            AllInventory(gear: gear)
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .swipeActions {
                    Button(role: .destructive) {
                        itemsToDelete = gear
                        showConfirmDelete = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
        }
        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            //.padding(.vertical, 8)
    }
    
    private func productRow(_ product: Product) -> some View {
        VStack{
            ProductCatalogue(product: product)
                .frame(maxWidth : .infinity)
                .background(Color.clear)
                .swipeActions {
                    Button(role: .destructive) {
                        itemsToDelete = product
                        showConfirmDelete = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
        }
        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        //.padding(.vertical, 8)
    }
}

#Preview {
    AllInventoryList()
        .environmentObject(InventoryViewModel())
}
