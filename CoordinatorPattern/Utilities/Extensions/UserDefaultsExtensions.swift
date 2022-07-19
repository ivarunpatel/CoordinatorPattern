//
//  UserDefaultsExtensions.swift
//  CoordinatorPattern
//
//  Created by Varun on 19/07/22.
//

import Foundation

extension UserDefaults {
    @objc var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isLoggedIn")
        } set {
            set(newValue, forKey: "isLoggedIn")
        }
    }
}
