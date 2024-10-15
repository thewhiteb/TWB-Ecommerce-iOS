//
//  OTPViewTabComponent.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 15/10/2024.
//

import SwiftUI

struct OTPViewTabComponent: View {
    
    @Binding var phoneNumber : String
     var isComingFromCheckout : Bool
    
    var onBackClick : () -> Void
    var body: some View {
        OtpView(phoneNumber: phoneNumber,isComingFromCheckout: isComingFromCheckout ,onBackButtonClick: {
            onBackClick()
        })
    }
}
