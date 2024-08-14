//
//  CountryPickerView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/08/2024.
//

import SwiftUI

struct CountryPickerView: View {
    @Binding var selectedCountry: Country?
    @State private var searchText = ""
    
    let countries = [
        Country(name: "United States", code: "+1", flag: "🇺🇸"),
        Country(name: "Canada", code: "+1", flag: "🇨🇦"),
        Country(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
        // Add more countries as needed
    ]
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredCountries) { country in
                HStack {
                    Text(country.flag)
                    Text(country.name)
                    Spacer()
                    Text(country.code)
                    if selectedCountry?.id == country.id {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCountry = country
                }
            }
            .searchable(text: $searchText, prompt: "Search Country")
            .navigationTitle("Select Country")
            .navigationBarItems(trailing: Button("Done") {
                // Dismiss the modal
            })
        }
    }
}

#Preview {
    CountryPickerView(selectedCountry: .constant(Country(name: "United States", code: "+1", flag: "🇺🇸")))
}
