//
//  GovernmentService.swift
//  ABA
//
//  Created by Mac on 8/9/25.
//

import SwiftUI

struct GovernmentService: View {
    let governmentNames: [[String]] = [["foreigner", "Foreigner"], ["general", "General"], ["NSSF", "NSSF"], ["PPSHV", "PPSHV"], ["publicWork", "Public Work"]]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Government Services")
                    .foregroundColor(.white)
                Spacer()
                Button("VIEW ALL"){
                    
                }
                .foregroundColor(.white)
            }
            .font(.title3)

            ScrollView(.horizontal){
                LazyHStack(spacing: 10){
                    ForEach(governmentNames, id: \.self){ explore in
                        HStack{
                            CardGovernmentService(image: explore[0], title: explore[1])
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

struct CardGovernmentService : View{
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
    GovernmentService()
}
