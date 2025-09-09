//
//  Favorite.swift
//  ABA
//
//  Created by Mac on 8/9/25.
//

import SwiftUI

struct FavoritePath: View {
    let favoriteNames: [[String]] = [["CD", "Teacher"], ["MK", "Mark"], ["SM", "Seavmey"], ["KL", "Kimlong"], ["KS", "Krusork"], ["CT", "Chetra"]]

    var body: some View {
        VStack(alignment: .leading){
            Text("Favorite")
                .foregroundColor(.white)
                .font(.title3)

            ScrollView(.horizontal){
                LazyHStack(spacing: 10){
                    ForEach(favoriteNames, id: \.self){ favorite in
                        HStack{
                            CardFavorite(textProfile: favorite[0], title: favorite[1])
                        }
                    }
                }
            }.scrollIndicators(.hidden)
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 250, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
        }
    }
}

struct CardFavorite : View{
    var textProfile : String
    var title : String
    var body: some View {
        VStack{
            Text(textProfile)
                .frame(width: 30, height: 30)
                .font(.system(size: 15))
                .padding(10)
                .background(Color.random())
                .cornerRadius(100)
                .foregroundColor(.white)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.black, lineWidth: 1.5)
                })

            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.black)
            
        }
        .padding()
        .frame(width: 100, height: 100)
        .background(.white)
        .cornerRadius(15)
    }
}

extension Color{
    static func random(randomOpacity : Bool = false) -> Color {
        Color(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1),
                      opacity: randomOpacity ? .random(in: 0...1) : 1)
    }
}
