//
//  String+Extension.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 23/09/2024.
//

import SwiftUI

extension String {
    func colorWord(_ word: String, wordColor: Color, defaultColor: Color) -> Text {
        let attributedString = NSMutableAttributedString(string: self)
        
        // Set the default color for the entire text
        let fullRange = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.foregroundColor, value: UIColor(defaultColor), range: fullRange)
        
        // Set the color for the specific word
        let range = (self as NSString).range(of: word)
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: UIColor(wordColor), range: range)
        }
        
        return Text(AttributedString(attributedString))
    }
    
    static let defaultStr: Self = Constants.defaultString
}
