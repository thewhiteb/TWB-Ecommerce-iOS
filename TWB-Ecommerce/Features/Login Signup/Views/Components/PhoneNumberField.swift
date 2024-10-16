//
//  SwiftUIView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct PhoneNumberField: View {
    @Binding var phoneNumber: String
    @State private var selectedCountry: Country? = Country(name: "United Arab Emirates", code: "+971", flag: "🇦🇪")
    @State private var isCountryPickerPresented = false
    
    var body: some View {
        HStack(spacing: 14) {
            // Flag Field
            Text(selectedCountry?.flag ?? "🇦🇪")  // Display the UAE flag
                .font(.largeTitle)
                .onTapGesture {
                    isCountryPickerPresented.toggle()  // Show country picker when tapped
                }
            
            Image("DownArrow")
            
            Divider()  // Horizontal divider between the flag and the phone number
            
            // Non-editable country code and editable phone number field
            HStack {
                Text(selectedCountry?.code ?? "+971")  // Non-editable country code
                    .font(.getFont(name: .libreBold , size: 16))
                    .foregroundColor(.gray)
                
                // Phone Number Field
                TextField("Phone Number", text: $phoneNumber)
                    .font(.getFont(name: .libreBold , size: 16))
                    .keyboardType(.phonePad)
                    .padding(.leading, 0)  // Add padding to the left of the TextField
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 0) // Adjust cornerRadius if needed
                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
        )
        .sheet(isPresented: $isCountryPickerPresented) {
            CountryPickerView(onCountrySelected: { selectedCountry in
                self.selectedCountry = selectedCountry // Update selected country when a new one is selected
            })
            .presentationDetents([.fraction(0.8), .large])
        }
    }
}


struct ContentView: View {
    @State private var phoneNumber: String = ""
    
    var body: some View {
        PhoneNumberField(phoneNumber: $phoneNumber)
    }
}

#Preview {
    ContentView()
}
