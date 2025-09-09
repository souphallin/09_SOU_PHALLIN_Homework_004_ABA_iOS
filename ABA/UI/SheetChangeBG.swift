//
//  SheetChangeBG.swift
//  ABA
//
//  Created by Mac on 9/9/25.
//

import SwiftUI

struct SheetChangeBackground: View {
    @State private var isEditHome : Bool = false
//    @State private var selectedAppearanceImage: Bool = false
    
    var body: some View {
        VStack{
            Button(action: {
                isEditHome.toggle()
            }, label: {
                Image(systemName: "highlighter")
                Text("Edit Home")
            })
            .foregroundColor(.black)
            .padding(.vertical, 8)
            .padding(.horizontal, 15)
            .background(.white)
            .cornerRadius(40)
            .sheet(isPresented: $isEditHome, content: {
                ShowSheetLongPress()
            })
        }
    }
}

struct ShowSheetLongPress: View {
    @State private var isSelectAppearance : String = "Themes"
    @Environment(\.colorScheme) var colorScheme
    let appearances : [String] = ["Themes", "Dark Mode", "Homescreen", "System", "Accessibility"]
    let appearanceImages : [[String]] = [["Bayon", "Bayon"], ["BonTeaySrey", "BonTeaySrey"], ["Cute Pets", "Cute Pets"], ["Khmer Heritage", "Khmer Heritage"], ["Moon Night", "Moon Night"], ["Sunset", "Moon Night"], ["Train", "Train"]]
    
    @State var selectedAppearanceImage: String? = nil
    
    var body: some View{
        VStack(alignment: .leading){
            Text("Appearance")
                .font(.title)
                .fontWeight(.bold)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(appearances, id: \.self){appearance in
                        Button(action: {
                            isSelectAppearance = appearance
                        }) {
                            Text(appearance)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: 150)
                                .foregroundColor(
                                    isSelectAppearance == appearance ? Color.white : Color.black.opacity(0.7)
                                )
                                .background(
                                    isSelectAppearance == appearance ? Color.gray.opacity(0.2) : Color.white
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
                            CardAppearanceImage(appearanceImage: appearanceImage[0], appearanceTitle: appearanceImage[1], selectedAppearanceImage : $selectedAppearanceImage)
                        }
                    }
                }
            }.scrollIndicators(.hidden)
                                                                        
        }.presentationDetents([.medium])
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
    }
}

extension Color{
    static let whiteSmoke = Color(red: 245/255, green: 245/255, blue: 245/255)
}

struct CardAppearanceImage: View {
    var appearanceImage: String
    var appearanceTitle: String
    @Binding var selectedAppearanceImage: String?
    
    var body: some View {
        VStack{
            Image(appearanceImage)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 180)
                .clipped()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedAppearanceImage == appearanceImage ? Color.blue : Color.white, lineWidth: selectedAppearanceImage == appearanceImage ? 8 : 5)
                })
                .onTapGesture {
                    if selectedAppearanceImage == appearanceImage {
                        selectedAppearanceImage = nil
                    }else{
                        selectedAppearanceImage = appearanceImage
                    }
                }
                .cornerRadius(20)

            Text(appearanceTitle)
                .padding(.vertical, 10)
        }
    }
}
