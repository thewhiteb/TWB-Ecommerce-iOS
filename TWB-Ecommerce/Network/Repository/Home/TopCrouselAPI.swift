//
//  TopCrouselAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 11/10/2024.
//

import Foundation
import Alamofire

struct TopCrouselAPI: Endpoint {
    typealias ResponseType = MainResponse<[Banner]>

    var pathURL: String = "/banner/Main/banners"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
}

struct Banner: Codable, Identifiable, Hashable, Equatable {
    let id: Int?
    let heading: String?
    let imageKey: String?
    let imageKeyForDesktop: String?
    let description: String?
    let buttonName: String?
    let link: String?
    let active: Bool?
    let createdDate: String?
    let bannerTypeEnum: String?
    let portalTypeEnum: String?
}

let globalBanners: [Banner] = [
    Banner(id: 21, heading: "", imageKey: "MobileBanner_06_2024-10-08 11.29.10 AM.jpg", imageKeyForDesktop: "DesktopBanner_03_2024-10-08 11.29.12 AM.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Mega%20Size", active: true, createdDate: "2024-09-27T14:19:41.2309374", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 18, heading: "", imageKey: "MobileBanner-001 copy_2024-09-13 5.21.54 PM.jpg", imageKeyForDesktop: "V2-DesktopBanner3 copy_2024-09-17 11.39.22 AM.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?productStyle=Bouquets", active: false, createdDate: "2024-08-19T14:02:14.9909485", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 16, heading: "", imageKey: "MobileBanner2_2024-07-16 3.20.48 PM.jpg", imageKeyForDesktop: "DesktopBanner2_2024-07-16 3.20.51 PM.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Congratulations", active: false, createdDate: "2024-07-16T11:31:10.2326624", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 15, heading: "", imageKey: "Mobile-GraduationBanner3-12.jpg", imageKeyForDesktop: "1DesktopBanner-EID21232.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Eid%20and%20Hajj%20Collection", active: false, createdDate: "2024-06-14T17:16:24.8644666", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 14, heading: "", imageKey: "FINAL_MobileBanner-Welcome1 copy_2024-09-13 4.49.49 PM.jpg", imageKeyForDesktop: "V2-DesktopBanner4_2024-09-17 11.39.39 AM.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?productStyle=Acrylic%20Boxes", active: true, createdDate: "2024-05-21T17:15:57.1537463", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 9, heading: "", imageKey: "MobileBanner Eid Mubarak.jpg", imageKeyForDesktop: "DesktopBanner  Eid Mubarak.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Eid%20Mubarak", active: false, createdDate: "2024-04-04T07:25:24.2917917", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 7, heading: "", imageKey: "MobileBanner Ramadan_lowres (2).jpg", imageKeyForDesktop: "DesktopBanner Ramadan_lowres.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Ramadan", active: false, createdDate: "2024-03-26T16:02:49.4194782", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 6, heading: "", imageKey: "Mobile-MainBanner Mother's Day (1).jpg", imageKeyForDesktop: "DesktopBanner Mother's Day _approved.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Mother%27s+Day", active: false, createdDate: "2024-03-19T09:26:42.7269109", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 5, heading: "", imageKey: "Valentines-MainBanner2.jpg", imageKeyForDesktop: "ValentinesBanner2.jpg", description: "", buttonName: "", link: "https://www.twb.ae/flowers/products-listing?occasion=Valentine%27s%20Day", active: false, createdDate: "2024-02-07T14:33:02.6952395", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 4, heading: "", imageKey: "MainBanner3-2.jpg", imageKeyForDesktop: "DesktopBanner3.jpg", description: "", buttonName: "", link: "http://www.twb.ae/flowers/products-listing?productStyle=Bouquets", active: false, createdDate: "2024-01-15T09:13:39.4714053", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 3, heading: "", imageKey: "MainBanner1 copy.jpg", imageKeyForDesktop: "DesktopBanner2.jpg", description: "", buttonName: "", link: "http://www.twb.ae/flowers/products-listing?productStyle=Bouquets", active: false, createdDate: "2024-01-15T09:13:08.0837714", bannerTypeEnum: "Main", portalTypeEnum: "Flower"),
    Banner(id: 2, heading: "", imageKey: "MainBanner2 copy.jpg", imageKeyForDesktop: "DesktopBanner1-2.jpg", description: "", buttonName: "", link: "http://www.twb.ae/flowers/products-listing?productStyle=Chocolate%20Arrangements", active: false, createdDate: "2024-01-15T09:12:04.7335301", bannerTypeEnum: "Main", portalTypeEnum: "Flower")
]
