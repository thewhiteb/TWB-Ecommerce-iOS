//
//  AddOnsDetailSheet.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 06/10/2024.
//

import SwiftUI

struct AddOnsDetailSheet: View {
    
    let addOnItem : TrendingProduct2
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 0
    @Binding var count : Int
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Close Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 25)
            ScrollView{
                VStack(alignment : .leading,spacing: 0) {
                    ZStack (alignment: .top) {
                        // Image slider using TabView
                        TabView(selection: $currentPage) {
                            ForEach(0..<addOnItem.images.count, id: \.self) { index in
                                Image(addOnItem.images[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: .infinity, height: 325) // Fixed height, dynamic width
                                    .clipped()
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
                        .frame(width: .infinity, height: 325) // Fixed height for image slider
                        
                        // Custom page indicator dots
                        VStack {
                            Spacer()
                            HStack(spacing: 5) { // Customize the spacing between indicators
                                ForEach(0..<addOnItem.images.count, id: \.self) { index in
                                    Circle()
                                        .frame(width: currentPage == index ? 8 : 6, height: currentPage == index ? 8 : 6)
                                        .foregroundColor(currentPage == index ? .black : .gray)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .background(Color(hex: "#F5F5F5"))
                    .padding(.horizontal)
                    .padding(.top,50)
                    .frame(width: .infinity, height: 325)
                    
                    Text(addOnItem.itemName)
                        .font(.getFont(name: .libreRegular,size: 24))
                        .foregroundColor(Constants.black)
                        .padding(.horizontal)
                        .padding(.top,50)
                    
                    HStack {
                        Text(addOnItem.itemPrice)
                            .font(.getFont(name: .libreRegular,size: 20))
                            .foregroundColor(Constants.black)
                        
                        Text("Including VAT")
                            .font(.getFont(name: .libreRegular,size: 10))
                            .foregroundColor(Constants.gray)
                        
                        Spacer()
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 90 ,height: 35)
                                .foregroundColor(Constants.white)
                                .overlay(
                                    Rectangle()
                                        .stroke(Constants.black)
                                )
                            
                            HStack{
                                ZStack {
                                    
                                    Color.clear.frame(width: 20, height: 20)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            withAnimation(.easeInOut) {
                                                if(count > 0){
                                                    count -= 1
                                                }
                                                
                                            }
                                        }
                                    
                                    Image(systemName: "minus")
                                        .frame(width: 20, height: 20)
                                        .padding(.leading, 10)
                                }
                                Spacer()
                                Text("\(count)")
                                    .font(.getFont(name: .libreRegular,size: 14))
                                    .foregroundColor(Constants.black)
                                Spacer()
                                Image(systemName: "plus")
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing,10)
                                    .onTapGesture {
                                        if (count >= 0){
                                            count += 1
                                        }
                                    }
                            }
                            .frame(width: 90 ,height: 35)
                        }
                        .frame(width: 90 , height: 35)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    
                    Rectangle()
                        .frame(width: .infinity,height: 1)
                        .foregroundColor(Constants.grayBorder)
                        .padding(.horizontal)
                        .padding(.top,30)
                    
                    Text("Description")
                        .font(.getFont(name: .libreBold,size: 14))
                        .padding(.horizontal)
                        .padding(.top,30)
                    
                    Text("This arrangement comes with delicious premium desserts, guaranteed to delight your lucky recipient!")
                        .font(.getFont(name: .libreRegular,size: 12))
                        .padding(.horizontal)
                        .padding(.top,20)
                    
                    Spacer()
                }
            }
            HStack(spacing: 10) {
                AddToBagButton(action: {
                    // See results action
                }, text: "View Bag", imageName: "bag")
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        }
       
        
    }
}

#Preview {
    @Previewable @State var addOnItem =
    TrendingProduct2( images: ["Bouquet1","Bouquet1","Bouquet1"],
                     itemName: "Rectangular Acrylic 061",
                     itemPrice: "AED 365",
                     isCustomizable: true)
    @Previewable @State var count : Int = 0
    AddOnsDetailSheet(addOnItem: addOnItem, count: $count)
}
