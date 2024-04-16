//
//  HomeView.swift
//  BottomNavBar-Template
//
//  Created by Michael Werbowy on 2024-03-09.
//

import SwiftUI

struct HomeView: View {
    @State private var navigateToNextScreen = false //when set to true, goes to activeTab in tab model (TabController)
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    Text("Bottom NavBar Template")
                        .foregroundColor(.white)
                        .font(.custom("IBMPlexMono-Regular", size: 24))
                        .bold()
                    
                    Text("Made Simple")
                        .foregroundColor(.white)
                        .font(.custom("IBMPlexMono-Regular", size: 18))
                    
                    // Sign in button
                    VStack(spacing: 10) {
                        Button(action: {
                            //on click of button, sets navigateToNextScreen to true which is requirement to navigate to defaulted activeTab (FirstView)
                            navigateToNextScreen = true
                        }) {
                            HStack {
                                Text("Continue to Tabbed Views")
                                    .foregroundColor(.white)
                                    .font(.custom("IBMPlexMono-Bold", size: 14))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .offset(x: 25)
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 36)
                                    .offset(x: -40)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            //NECESSARY DONT TOUCH:
                            .background(
                                NavigationLink(destination: TabBarView(), isActive: $navigateToNextScreen) {
                                    EmptyView()
                                }
                                    .hidden()
                            )
                        }
                        .padding(.bottom, 10)
                    }
                    .padding()
                    .offset(y: 420)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    
    // Preview
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
}
