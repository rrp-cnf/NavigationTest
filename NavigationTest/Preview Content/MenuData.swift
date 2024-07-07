//
//  MenuData.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import Foundation

let homeMenuData = MenuViewModel(name: "Home", icon: "house", type: .screen)
let searchMenuData = MenuViewModel(name: "Search", icon: "magnifyingglass", type: .search)
let hotMenuData = MenuViewModel(name: "Trending", icon: "chart.line.uptrend.xyaxis", type: .list)
let profileMenuData = MenuViewModel(name: "Profile", icon: "person", type: .profile)
let menuSampleData = [homeMenuData, searchMenuData, hotMenuData, profileMenuData]
