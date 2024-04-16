//
//  TabBarView.swift
//  BeatBridge
//
//  Created by Michael Werbowy on 2024-03-09.
//

import SwiftUI

struct TabBarView: View {
    @State private var activeTab: Tab = .first

    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Your content views would be placed here
                switch activeTab {
                case .first:
                    FirstView()
                case .second:
                    SecondView()
                case .third:
                    ThirdView()
                case .fourth:
                    FourthView()
                }
                
                Spacer()
                
                // Custom Tab Bar
                HStack {
                    Spacer()
                    TabBarButton(activeTab: $activeTab, tab: .first, label: "First", imageName: Tab.first.symbol)
                    Spacer()
                    TabBarButton(activeTab: $activeTab, tab: .second, label: "Second", imageName: Tab.second.symbol)
                    Spacer()
                    TabBarButton(activeTab: $activeTab, tab: .third, label: "Third", imageName: Tab.third.symbol)
                    Spacer()
                    TabBarButton(activeTab: $activeTab, tab: .fourth, label: "Fourth", imageName: Tab.fourth.symbol)
                    Spacer()
                }
                .frame(width: geometry.size.width, height: 70)
                .background(.black)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarButton: View {
    @Binding var activeTab: Tab
    let tab: Tab
    let label: String
    let imageName: String

    var body: some View {
        Button(action: {
            activeTab = tab
        }) {
            VStack {
//                Image(imageName) //use this line for images from assets
                Image(systemName: tab.symbol) // Use systemName initializer for SF Symbols
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                // Active tab indicator dot
                if activeTab == tab {
                    Circle()
                        .fill(Color(.blue))
                        .frame(width: 10, height: 10)
                        .transition(.scale)
                }
            }
        }
        .foregroundColor(activeTab == tab ? .blue : .gray)
    }
}

// Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
