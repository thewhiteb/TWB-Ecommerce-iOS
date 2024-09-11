//
//  CountryPickerView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/08/2024.
//
import SwiftUI

struct CountryPickerView: View {
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedCountry: Country? // Track selected country
    var onCountrySelected: ((Country) -> Void)? // Closure to handle country selection
    
    let countries: [Country] = CountryData.allCountries
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            let searchTextLowercased = searchText.lowercased()
            return countries.filter {
                $0.name.lowercased().contains(searchTextLowercased) ||
                $0.code.lowercased().contains(searchTextLowercased)
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Country Code")
                    .font(.custom("Baskerville", size: 16))
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Close Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20) // Adjust size as needed
                }
            }
            .padding(.top, 18)
            .padding(.horizontal)
            
            HStack {
                ZStack(alignment: .leading) {
                    TextField("Type a country name or code", text: $searchText)
                        .padding(.leading, 30) // Add padding to make space for the icon
                        .padding(10)
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                        .cornerRadius(5)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                        .padding(.leading, 10) // Position the icon inside the text field
                }
                Spacer()
                Button(action: {
                    searchText = "" // Clear the search text
                }) {
                    Text("Cancel")
                        .font(.custom("Baskerville", size: 16))
                        .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                }
            }
            .padding(.horizontal)
            .padding(.top, 28)
            
            // List of filtered countries
            List(filteredCountries) { country in
                HStack {
                    Text(country.flag)
                        .padding(.leading, 16)
                    Text(country.name)
                        .padding(.leading, 8)
                    Text(country.code)
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                    
                    Spacer()
                    
                    if selectedCountry == country {
                        ZStack{
                            Image("unchecked_switch")
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            Image("checked_switch")
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                        }
                        
                    } else {
                        Image("unchecked_switch")
                            .foregroundColor(.blue)
                            .padding(.trailing, 16)
                    }
                }
                .padding(.vertical, 16) // Adjust vertical padding as needed
                .background(Color.white) // Ensure background color matches your design
                .onTapGesture {
                    selectedCountry = country
                    if let selectedCountry = selectedCountry {
                        onCountrySelected?(selectedCountry) // Call the callback
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                .listRowInsets(EdgeInsets()) // Remove default insets
            }
            .listStyle(PlainListStyle())
            .padding(.top, 28)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            // Set a default selected country if needed
            selectedCountry = countries.first
        }
    }
}

struct CountryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CountryPickerView(onCountrySelected: { _ in })
    }
}
