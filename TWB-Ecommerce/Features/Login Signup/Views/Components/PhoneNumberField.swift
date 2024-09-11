//
//  PhoneNumberField.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 13/08/2024.
//

import SwiftUI

struct PhoneNumberField: View {
    @Binding var phoneNumber: String
    @State private var selectedCountry: Country? = Country(name: "United States", code: "+1", flag: "🇺🇸")
    @State private var isCountryPickerPresented = false
    
    var body: some View {
        HStack(spacing: 16) {
            // Flag Field
            Text(selectedCountry?.flag ?? "🇺🇸")  // Display the selected country's flag
                .font(.largeTitle)
                .onTapGesture {
                    isCountryPickerPresented.toggle()  // Show country picker when tapped
                }
            
            Divider()  // Horizontal divider between the flag and the phone number
            
            // Phone Number Field
            TextField("Phone Number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .padding(.leading, 0)  // Add some padding to the left of the TextField
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8) // Adjust cornerRadius if needed
                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
        )
        .sheet(isPresented: $isCountryPickerPresented) {
            CountryPickerView(onCountrySelected: { selectedCountry in
                self.selectedCountry = selectedCountry // Update selected country
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
