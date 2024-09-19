//
//  Fonts+Extension.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 18/09/2024.
//

import Foundation
import SwiftUI

public enum FontNames: String {
    case libreBold = "LibreBaskerville-Bold"
    case libreItalic = "LibreBaskerville-Italic"
    case libreRegular = "LibreBaskerville-Regular"
    case baskerville = "Baskerville"
    case latoBold = "Latobold"
}

extension Font {
    static func getFont(name: FontNames, size: CGFloat = 14) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}
