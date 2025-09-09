//
//  ImageSlide.swift
//  ABA
//
//  Created by Mac on 7/9/25.
//

import SwiftUI

struct ImageSlide: View {
    let slideImages = ["ABA_Promote2", "ABA_Promote3", "ABA-promote_EON"]
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var currentImage = 0
    var body: some View {
        VStack(alignment: .leading){
            Text("New and Information")
                .foregroundColor(.white)
                .font(.title3)
            ScrollView{
                TabView(selection: $currentImage){
                    ForEach(0..<slideImages.count, id: \.self){ image in
                        VStack{
                            Image(slideImages[image])
                                .resizable()
                                .cornerRadius(20)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 210)
                    .onReceive(timer){_ in
                        withAnimation{
                            currentImage = (currentImage + 1) % slideImages.count
                        }
                    }
            }
        }
    }
}
