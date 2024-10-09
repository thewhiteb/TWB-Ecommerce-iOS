//
//  DetailBottomView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailBottomView: View {
    
    var animation : Namespace.ID
    let bannerHeight: CGFloat
    @Binding var headerOpacity: Double
    @State var customizedTextValue: String = ""
    

    var itemName : String
    
    let description = DescriptionModel(
        mainDescription: "A gift box arrangement comes with delicious chocolate-dipped strawberries guaranteed to delight your lucky recipient!",
        arrangementIncludes: ["Dessert Box Small", "Chocolate Dipped Strawberries"],
        note: "Depending on the season, we might change some flowers, but don't stress! If we do, the substitute will be just as nice or even better than you picked."
    )
    
    let careInstruction = CareInstructionModel(
        mainDescription: "A gift box arrangement comes with delicious chocolate-dipped strawberries guaranteed to delight your lucky recipient! \n Second Line \n \n Third Line"
    )
    
    @State var selectedWrapperColor: String? = nil
    var body: some View {
        VStack (spacing : 0) {
            GeometryReader { geo -> Color in
                let minY = geo.frame(in: .global).minY
                DispatchQueue.main.async {
                    let newOpacity = min(max(((bannerHeight*0.4) - minY) / (bannerHeight * 0.3), 0), 1)
                    headerOpacity = newOpacity
                }
                return Color.clear
            }
            .frame(height: 0)  // Hidden GeometryReader to track scroll position
            
            // Scrollable content
            VStack(alignment :.center,spacing: 0) {
                
                Text(itemName)
                    .font(
                        .getFont(name: .libreBold, size: 18)
                    )
                    .foregroundColor(.black)
                    .padding(.top, 15)
                
                
                Text("AED 447")
                    .font(
                        .getFont(name: .libreBold, size: 16)
                    )
                    .foregroundColor(.black)
                    .padding(.top, 15)
                
                Text("Including VAT")
                    .font(
                        .getFont(name: .libreBold, size: 10)
                    )
                    .foregroundColor(Constants.gray)
                    .padding(.top, 5)
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 56)  // Set fixed height
                        .overlay(
                            Rectangle()
                                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                        )
                    
                    HStack{
                        
                        Image("tabby_ic")
                            .padding(.leading, 10)
                        
                        Image("info")
                        
                        Divider()
                            .frame(width: 1,height: 56)
                        Spacer()
                        
                        Text("Buy now pay later")
                            .font(.getFont(name: .latoBold, size: 12))
                            .foregroundColor(Constants.black)
                        
                        Spacer()
                        Divider()
                            .frame(width: 1,height: 56)
                        Image("tamara_ic")
                        
                        Image("info")
                            .padding(.trailing, 10)
                        
                        
                        
                    }
                }
                .padding()
                .padding(.top, 15)
                
                Rectangle()
                    .fill(Constants.lightGray)
                    .frame(height: 1)
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                LetterSmallView(allowMultipleSelection: false, maxSelectionCount: 5, onSelectionChanged: { selectedLetters in
                    print("Selected letters: \(selectedLetters)")
                })
                .padding(.top, 30)
                
                FlavourView(onSelectionChanged: { selectedFlavour in
                    print("Selected flavour: \(selectedFlavour)")
                })
                .padding(.top,30)
                
                TopperSmallView(text: $customizedTextValue, onSelectionChanged: { selectedTopper in
                    print("Selected Topper: \(selectedTopper)")
                })
                .padding(.top,30)
                
                ColorDropdownView(selectedColor: $selectedWrapperColor, title: "Select Wrapping Color", isCollapsible: false)
                    .padding(.top, 30)
                
                Rectangle()
                    .fill(Constants.lightGray)
                    .frame(height: 10)
                    .padding(.top, 20)
                
                //                ColorDropdownView(selectedColor: $selectedWrapperColor, title: "Select Leather Bag Color", isCollapsible: false)
                //                    .padding(.top, 30)
                
                DescriptionView(description: description)
                    .padding(.top, 20)
                
                Rectangle()
                    .fill(Constants.lightGray)
                    .frame(height: 1)
                    .padding(.top, 10)
                
                CareInstructionView(careInstruction: careInstruction)
                    .padding(.top, 10)
                
                NeedHelpSmallView()
                    .padding(.top, 10)
                
                
                HStack{
                    Text("Related Products")
                        .font(.getFont(name: .libreBold, size: 18))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal)
                
                RelatedProductsView(animation: animation)
                    .padding(.top, 30)
                
                Rectangle()
                    .fill(Constants.lightGray)
                    .frame(height: 2)
                    .padding(.top, 30)
                
                HStack{
                    Text("Trending Products")
                        .font(.getFont(name: .libreBold, size: 18))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal)
                
                RelatedProductsView(animation: animation)
                    .padding(.top, 30)
                    .padding(.bottom, 50)
                
            }
        }
    }
}

//#Preview {
//    DetailBottomView(bannerHeight: 400, headerOpacity: .constant(0.0), itemName: "Tube Acrylic 018")
//}
