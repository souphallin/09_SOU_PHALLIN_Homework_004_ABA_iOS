//
//  SheetChangeBG.swift
//  ABA
//
//  Created by Mac on 9/9/25.
//

import SwiftUI

struct SheetChangeBackground: View {
    @State private var isEditHome : Bool = false
    @Binding var backgroundImageName: String
    @Binding var abaTheme: ABATheme
    
    
    var body: some View {
        VStack{
            Button(action: {
                isEditHome.toggle()
            }, label: {
                Image(systemName: "highlighter")
                Text("Edit Home")
            })
            .foregroundColor(abaTheme == .dark ? .white : .black)
            .padding(.vertical, 8)
            .padding(.horizontal, 15)
            .background(abaTheme == .dark ? .black.opacity(0.5) : .white)
            .cornerRadius(40)
            .sheet(isPresented: $isEditHome, content: {
                ShowSheetLongPress(selectedImage: $backgroundImageName, abaTheme: $abaTheme)
                    .presentationBackground(
                        abaTheme == .dark ? Color.black : Color.white
                    )
            })
        }
    }
}

struct ShowSheetLongPress: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedImage: String
    @Binding var abaTheme: ABATheme

    let appearanceImages : [[String]] = [["Bayon", "Bayon"], ["BonTeaySrey", "BonTeaySrey"], ["Cute Pets", "Cute Pets"], ["Khmer Heritage", "Khmer Heritage"], ["Moon Night", "Moon Night"], ["Sunset", "Moon Night"], ["Train", "Train"]]
    let appearances: [ABATheme] = [.themes, .system, .dark, .homescreen, .accessibility]

        
    var body: some View{
        VStack(alignment: .leading){
            Text("Appearance")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(abaTheme == .dark ? Color.white : Color.black)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(appearances, id: \.self){appearance in
                        Button(action: {
                            abaTheme = appearance
                        }){
                            Text(appearance.rawValue.capitalized)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: 150)
                                .foregroundColor(
                                    abaTheme == appearance ? Color.white : Color.black.opacity(0.7)
                                )
                                .background(
                                    abaTheme == appearance ? Color.black.opacity(0.7) : Color.white
                                )
                                .cornerRadius(50)
                        }
                    }
                }
                .presentationBackground(Color.whiteSmoke)
            }.scrollIndicators(.hidden)
                .frame(width: .infinity, height: 60)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(appearanceImages, id: \.self){appearanceImage in
                        HStack(spacing: 20){
                            CardAppearanceImage(appearanceImage: appearanceImage[0], appearanceTitle: appearanceImage[1], selectedImage : $selectedImage)
                        }
                        .foregroundColor(abaTheme == .dark ? .white : .black)
                    }
                }
            }.scrollIndicators(.hidden)
                                                                        
        }.presentationDetents([.medium])
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .background(abaTheme == .dark ? Color.gray : Color.whiteSmoke)
    }
}

extension Color{
    static let whiteSmoke = Color(red: 245/255, green: 245/255, blue: 245/255)
}

struct CardAppearanceImage: View {
    var appearanceImage: String
    var appearanceTitle: String
    @Binding var selectedImage: String
    
    var body: some View {
        VStack{
            Image(appearanceImage)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 180)
                .clipped()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedImage == appearanceImage ? Color.blue : Color.white, lineWidth: selectedImage == appearanceImage ? 8 : 5)
                })
                .onTapGesture {
                    print("Selected image: \(appearanceImage)")
                    selectedImage = appearanceImage
                }
                .cornerRadius(20)

            Text(appearanceTitle)
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    ABA()
}
