//
//  MoneyInfo.swift
//  ABA
//
//  Created by Mac on 6/9/25.
//

import SwiftUI

struct MoneyInfo: View {
    @State private var isShowPrice: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                
                Button(action: {
                    isShowPrice.toggle()
                }){
                    HStack{
                        if isShowPrice == true {
                            Text("$10000.00")
                                .foregroundColor(.white)
                        }else{
                            Text("$10000.00")
                                .blur(radius: 5)
                                .foregroundColor(.white)
                        }
                        Image(systemName: isShowPrice ? "eye.slash" :"eye")
                            .frame(width: 17, height: 17)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
                if isShowPrice == true {
                    
                }
                HStack{
                    Text("Default")
                        .padding(4)
                        .background(.blue.opacity(0.5))
                        .cornerRadius(5)
                    Text("Saving")
                }
                .foregroundColor(.white)
                .font(.system(size: 14))
            }
            
            Spacer()
            
            HStack{
                HStack{
                    Image("receive-circle")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text("Receive money")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                HStack{
                    Image("send-circle")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text("Send money")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
            }.padding(.top, 20)
        }
    }
}
