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
    @State private var textFieldValue: String = ""
    
    // Callback to return the selected flavour to the parent view
    var onSelectionChanged: (String) -> Void
    
    // Track the selected flavour
    @State private var selectedTopper: String? = nil
    
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Topper")
                    .font(.getFont(name: .libreRegular, size: 12))
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            // ZStack for the dropdown
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 56)  // Set fixed height
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                    )
                
                HStack {
                    Text("Choose small topper")
                        .font(.getFont(name: .libreBold, size: 12))
                        .foregroundColor(Constants.gray)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    Image("DownArrow")
                        .padding(.horizontal, 10)
                }
            }
            .frame(height: 56)  // Ensure the height matches the TextField
            .padding(.horizontal)
            .padding(.top, 30)
            
            // TextField for customized input
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

#Preview {
    
    @Previewable @State var textFieldValue: String = ""
    
    TopperSmallView(text: $textFieldValue, onSelectionChanged: { selectedTopper in
        print("Selected Topper: \(selectedTopper)")
    })
}
