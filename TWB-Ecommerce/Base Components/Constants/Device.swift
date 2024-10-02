//
//  Device.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 01/10/2024.
//

import UIKit

struct Device {
    static var appNumber: String {
        if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return appVersion
        }
        return "0.0.0"
    }

    static var buildNumber: String {
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return buildNumber
        }
        return "0.0"
    }

    static var versionBuildNumber: String {
        return "\(appNumber) (\(buildNumber))"
    }

    static var osVersion: String {
        return UIDevice.current.systemVersion
    }

    static var deviceModel: String {
        return getDeviceModel()
    }
}

extension Device {
    static private func getDeviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        return mapToDevice(identifier: identifier) // Map to human-readable device names
    }

    static private func mapToDevice(identifier: String) -> String {
        switch identifier {
        case "iPhone13,4": return "iPhone 12 Pro Max"
        case "iPhone13,3": return "iPhone 12 Pro"
        case "iPhone13,2": return "iPhone 12"
        case "iPhone13,1": return "iPhone 12 mini"
        // Add more device mappings as necessary
        case "iPad8,11": return "iPad Pro 12.9-inch (4th generation)"
        // Include other mappings from Apple's device list...
        default: return identifier  // Return identifier if no mapping found
        }
    }
}
