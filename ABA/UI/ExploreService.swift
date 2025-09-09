//
//  ExploreService.swift
//  ABA
//
//  Created by Mac on 8/9/25.
//

import SwiftUI

struct ExploreService: View {
    let exploreNames: [[String]] = [["cambolink", "CamboLink 21"], ["comboticket", "ComboTicket"], ["manulife", "Manulife"], ["metfonelogo", "Metfone Service"], ["U&Me", "U&Me Spa"], ["VET", "VET Express"]]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Explore Services")
                    .foregroundColor(.white)
                Spacer()
                Button("VIEW ALL"){
                    
                }
                .foregroundColor(.white)
            }
            .font(.title3)

            ScrollView(.horizontal){
                LazyHStack(spacing: 10){
                    ForEach(exploreNames, id: \.self){ explore in
                        HStack{
                            CardExploreService(image: explore[0], title: explore[1])
                        }
                    }
                }
            }.scrollIndicators(.hidden)
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 260, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
        }
    }
}

struct CardExploreService : View{
    var image : String
    var title : String
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .font(.system(size: 15))
                .cornerRadius(15)
                .foregroundColor(.white)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 3)
                })
                .padding(.bottom, 10)
            
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.white)
            
        }
        .frame(width: 70, height: 110)
    }
}


#Preview {
    ExploreService()
}
