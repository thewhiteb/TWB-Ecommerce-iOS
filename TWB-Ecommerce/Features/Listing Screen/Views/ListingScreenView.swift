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
    
    var body: some View {
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
                                        Font.custom("Baskerville", size: 20)
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
                HeaderView(title: title, safeArea: safeArea, size: size)
            }
        }
        .navigationBarBackButtonHidden(true) // Hide back button
        .edgesIgnoringSafeArea(.top)
        .coordinateSpace(name: "SCROLL")
    }
    
    
}

#Preview {
    GeometryReader {
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        @State var text = "Acrylic Boxes"
        ListingScreenView(title: $text ,safeArea: safeArea, size: size)
            .ignoresSafeArea(.container, edges: .top)
    }
}
