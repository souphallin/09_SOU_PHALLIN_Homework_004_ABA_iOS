//
//  ABA.swift
//  ABA
//
//  Created by Mac on 6/9/25.
//

import SwiftUI

enum ABATheme: String {
    case themes = "Themes"
    case system = "System"
    case dark = "Dark Mode"
    case homescreen = "Homescreen"
    case accessibility = "Accessibility"
}
struct ABA: View {
    @State private var showChangeBackgroundSheet = false
    @State private var backgroundImageName: String = "Bayon"
    @State private var abaTheme: ABATheme = .themes

    var body: some View {
        ZStack{
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .onLongPressGesture(minimumDuration: 0.5, perform: {
                    print("Long Pressss")
                    showChangeBackgroundSheet.toggle()
                })
                .sheet(isPresented: $showChangeBackgroundSheet, content: {
                    ShowSheetLongPress(selectedImage: $backgroundImageName, abaTheme: $abaTheme)
                })
            
            VStack{
                ProfileInfo()
                ScrollView{
                    MoneyInfo()
                        .padding(20)
                        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading)
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                    
                    DynamicButton()
                        .padding(20)
                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .center)
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                    
                    ImageSlide()
                    FavoritePath()
                    ExploreService()
                    GovernmentService()
                    SheetChangeBackground(backgroundImageName: $backgroundImageName, abaTheme: $abaTheme)
                }.scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.horizontal, 35)
        }
        .preferredColorScheme(
            abaTheme == .system ? nil : (abaTheme == .dark ? .dark : .light)
        )
    }
}

#Preview {
    ABA()
}
