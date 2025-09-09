//
//  ProfileInfo.swift
//  ABA
//
//  Created by Mac on 6/9/25.
//

import SwiftUI

struct ProfileInfo: View {
    var body: some View {
        HStack{
            Image("AngkorWat")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.white, lineWidth: 3)
                )
            VStack(alignment: .leading){
                Text("Hello, Phallin Sou!")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("View Profile")
                    .font(.callout)
            }.foregroundColor(.white)
            
            Spacer()
            
            HStack{
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)

                Image("IconGoToQR")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .font(.title)
            .frame(width: 100, height: 30, alignment: .trailing)
        }
    }
}
