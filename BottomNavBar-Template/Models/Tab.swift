//
//  Tab.swift
//  BottomNavBar-Template
//
//  Created by Michael Werbowy on 2024-04-15.
//

import Foundation

enum Tab: String, CaseIterable {
    //four unique views, defaulted to first, second, third, fourth naming scheme
    case first = "First"
    case second = "Second"
    case third = "Third"
    case fourth = "Fourth"
    
    // MARK: - Custom Tab Bar Button Image Names
    // add to assets to use unless using SF Symbols name
    var symbol: String {
        switch self {
            //custom image for first tab
        case .first:
            return "1.circle" //this would mean that you have asset named 1.circle
        case .second:
            return "2.circle"
        case .third:
            return "3.circle"
        case .fourth:
            return "4.circle"
        }
    }
    
    //defaults to first tab as active once past HomeView
    class TabController: ObservableObject {
        
        //change this to any tab you would like to navigate to by default
        @Published var activeTab = Tab.first
        
        func open(_ tab: Tab) {
            activeTab = tab
        }
    }
}
