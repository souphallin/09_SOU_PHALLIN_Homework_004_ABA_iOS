//
//  ShortcutBtnInfo.swift
//  ABA
//
//  Created by Mac on 8/9/25.
//

import SwiftUI

struct DynamicButton: View {
    var body: some View {
        VStack(spacing: 10){
            HStack(spacing: 10){
                CardDynamicButton(image: "wallet", title: "Account")
                CardDynamicButton(image: "bill", title: "Pay bills")
                CardDynamicButton(image: "transericon", title: "Transfer")
            }
            HStack(spacing: 10){
                CardDynamicButton(image: "favorite", title: "Favorites")
                CardDynamicButton(image: "scan-fill", title: "ABA Scan")
                CardDynamicButton(image: "service", title: "Service")
            }
        }
    }
}

struct CardDynamicButton : View{
    var image : String
    var title : String
    var body: some View {
        Button(action: {
            
        }){
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(title)
                    .font(.system(size: 15))

            }
            .foregroundColor(.black)
        }
        .padding()
        .frame(maxWidth: 100, maxHeight: 100)
        .background(.white)
        .cornerRadius(15)
    }
}
