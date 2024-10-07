//
//  Repository.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 04/10/2024.
//

import Foundation

protocol Repository {
    func getMainItemCategories() async -> MainItemCategories?
}

struct RepositoryImplementation: Repository {

    func getMainItemCategories() async -> MainItemCategories? {
        do {
           return nil
        } catch let error {
            return nil
        }
    }
}
