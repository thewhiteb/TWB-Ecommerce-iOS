//
//  Constants.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 27/09/2024.
//

import Foundation

struct Constants {
    struct SocialMedia {
        static let facebookString = "https://www.facebook.com/TheWhiteBoutiqueFlowers"
        static let snapChatString = "https://www.snapchat.com/add/twb_ae"
        static let tikTokString = "https://www.tiktok.com/@twb_flowers"
        static let instagramString = "https://www.instagram.com/twb_flowers/"
    }

    struct HeadersKeys {
        static let deviceModel = "DEVICE_MODEL"
        static let appVersion = "APP_VERSION"
        static let osVersion = "OS_VERSION"
        static let contentType = "Content-Type"
    }

    // Dev
    static let baseURL = "https://dev-thewhitebtq-be.twb.ae/mobile"
    // Live
//    static let baseURL = "http://thewhitebtq.eu-west-1.elasticbeanstalk.com/mobile"
    static let imagesBaseURL = "https://d1951zx0r40k66.cloudfront.net/"
    static let defaultString = "Default"
}
