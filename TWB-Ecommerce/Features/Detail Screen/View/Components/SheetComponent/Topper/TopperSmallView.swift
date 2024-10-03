import SwiftUI

struct TopperSmallView: View {
    
    @Binding var text: String
    
    let toppers = [
        TopperItem(name: "Without Topper", price: ""),
        TopperItem(name: "Customized Topper (3 Working Days)", price: "AED 83"),
        TopperItem(name: "52 UAE", price: "AED 32"),
        TopperItem(name: "Love You", price: "AED 32"),
        TopperItem(name: "Happy Birthday", price: "AED 32"),
        TopperItem(name: "Hajj Mubarak", price: "AED 32"),
        TopperItem(name: "Get Well Soon", price: "AED 32"),
        TopperItem(name: "Thank You", price: "AED 32"),
        TopperItem(name: "Happy Anniversary", price: "AED 32"),
        TopperItem(name: "Best Wishes", price: "AED 32")
    ]
    
    @State private var selectedTopper: TopperItem = TopperItem(name: "Choose topper", price: "")  // Default selected topper
    @State private var showTopperLargeView = false  // State to show the large view
    
    // Callback to return the selected topper to the parent view
    var onSelectionChanged: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Topper")
                    .font(.getFont(name: .libreRegular, size: 13))
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            // Button to trigger the large topper sheet
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 56)  // Set fixed height
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                    )
                
                HStack {
                    Text(selectedTopper.name)  // Show selected topper
                        .font(.getFont(name: .libreBold, size: 12))
                        .foregroundColor(Constants.gray)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    if !selectedTopper.price.isEmpty{
                        Text(selectedTopper.price)  // Show selected topper price
                            .font(.getFont(name: .libreBold, size: 12))
                            .foregroundColor(Constants.gray)
                    }
                  
                    
                    Image("DownArrow")
                        .padding(.horizontal, 10)
                }
            }
            .frame(height: 56)  // Ensure the height matches the TextField
            .padding(.horizontal)
            .padding(.top, 30)
            .onTapGesture {
                showTopperLargeView.toggle()  // Open the large view when tapped
            }
            .sheet(isPresented: $showTopperLargeView) {
                TopperLargeView(
                    selectedTopper: $selectedTopper,
                    toppers: toppers,
                    onSelectionDone: { selected in
                        // Handle the selection when the sheet is dismissed
                        selectedTopper = selected
                        if selected.name == "Customized Topper (3 Working Days)" {
                            text = ""
                        } else {
                            text = selected.name
                        }
                        
                        onSelectionChanged(selected.name)
                    }
                )
                .presentationDetents([.fraction(0.7), .medium])
            }
            
            // Show TextField if "Customized Topper" is selected
            if selectedTopper.name == "Customized Topper (3 Working Days)" {
                TextField("Input Customized Topper Text", text: $text)
                    .font(.getFont(name: .libreRegular, size: 12))
                    .frame(height: 56)  // Set fixed height to match the ZStack
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    @Previewable @State var textFieldValue: String = ""
    
    TopperSmallView(text: $textFieldValue, onSelectionChanged: { selectedTopper in
        print("Selected Topper: \(selectedTopper)")
    })
}
