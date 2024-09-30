//
//  ListingScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/09/2024.
//

import SwiftUI

struct ListingScreenView: View {
    
    @Binding var title: String
    @State private var scale: CGFloat = 1.0
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    var onBackButtonPressed: () -> Void
    @State private var isSortOptionClicked = false
    @State private var isFilterOptionClicked = false
    
    var body: some View {
        
        ZStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    
                    ArtWork(safeArea: safeArea, size: size)
                    
                    VStack {
                        
                        // Since We ignored Top Edge
                        GeometryReader{ proxy in
                            let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    Text(title)
                                        .font(
                                            Font.custom("Baskerville", size: 22)
                                        )
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .padding(.top,30)
                                        .offset(y: minY < -20 ? -(minY - (-20)) : 0)
                                    Spacer()
                                }
                                TabListSmallView(minY: minY)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .offset(y: minY < -20 ? -(minY - (-20)) : 0)
                                
                                
                                
                            }
                            
                            
                            //                            .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .bottom)),removal: .opacity))
                            //                            .animation(.easeInOut(duration: 1), value: minY > -30 ? minY : 1)  // Control the animation timing
                            
                            //                        VStack {
                            //                            TabListView(scale: minY < 75 ? max(minY / 75, 0.5) : 1) // Scale from 1 to 0.5
                            //                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            //                                .opacity(minY < 75 ? 1 : 1)  // Adjust opacity based on minY
                            //                                .transition(.move(edge: .top).combined(with: .opacity))  // Transition for the move and opacity
                            //                                .animation(.easeInOut, value: minY)  // Animate based on minY changes
                            //                                .zIndex(0)
                            //
                            //                            if minY < 5 {
                            //                                TabListSmallView()
                            //                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            //                                    .offset(y: -(minY + 120))
                            //                                    .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .bottom)),removal: .opacity))
                            //                                    .animation(.easeInOut(duration: 1), value: minY > -30 ? minY : 1)  // Control the animation timing
                            //
                            //
                            //                            }
                            //                        }
                        }
                        .zIndex(1)
                        
                        BottomView()
                        
                    }
                    .background(Color.white)
                    
                    
                }
                .overlay(alignment: .top) {
                    HeaderView(title: title, safeArea: safeArea, size: size,
                               onBackButtonPressed: {
                        onBackButtonPressed()
                    })
                }
            }
            .navigationBarBackButtonHidden(true) // Hide back button
            .edgesIgnoringSafeArea(.top)
            .coordinateSpace(name: "SCROLL")
            
            
            
            VStack {
                Spacer() // Push the button to the bottom
                HStack(spacing: 0) {
                    Button {
                        // Sort action here
                        isSortOptionClicked = true
                    } label: {
                        HStack(spacing: 0) {
                            Text("Sort")
                                .font(
                                    Font.custom("Lato", size: 14)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                            Image("swap_vert")
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 12)
                    .frame(width: 90)
                    
                    Rectangle()
                        .frame(width: 1, height: 20)
                        .foregroundColor(.white)
                    
                    Button {
                        // Filters action here
                        isFilterOptionClicked = true
                    } label: {
                        HStack(spacing: 0) {
                            Text("Filters")
                                .font(
                                    Font.custom("Lato", size: 14)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                            Image("filter_list")
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .frame(width: 90)
                }
                .background(Color.black)
                
                .padding(.horizontal, 20) // Add horizontal margin
                .padding(.vertical, 10) // Add vertical padding to the whole button view
            }
            .padding(.bottom, 30) // Add margin from the bottom
            .ignoresSafeArea()
        }
        .sheet(isPresented: $isSortOptionClicked) {
            SortSheet()
                .presentationDetents([.fraction(0.5), .medium])
        }
        .sheet(isPresented : $isFilterOptionClicked){
            FiltersSheet()
                .presentationDetents([.fraction(0.7), .large])
        }
        
    }
    
    
}

//#Preview {
//    @State var text = "Acrylic Boxes"
//    GeometryReader {
//        let safeArea = $0.safeAreaInsets
//        let size = $0.size
//        ListingScreenView(title: $text ,safeArea: safeArea, size: size,
//                          onBackButtonPressed: {
//
//        })
//        .ignoresSafeArea(.container, edges: .top)
//    }
//}
