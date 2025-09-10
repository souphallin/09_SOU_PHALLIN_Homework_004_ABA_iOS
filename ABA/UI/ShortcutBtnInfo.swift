//
//  ShortcutBtnInfo.swift
//  ABA
//
//  Created by Mac on 8/9/25.
//

import SwiftUI

struct DynamicButton: View {
    @State private var items: [CardItem] = [
            CardItem(id: UUID(), image: "wallet", title: "Account"),
            CardItem(id: UUID(), image: "bill", title: "Pay bills"),
            CardItem(id: UUID(), image: "transericon", title: "Transfer"),
            CardItem(id: UUID(), image: "favorite", title: "Favorites"),
            CardItem(id: UUID(), image: "scan-fill", title: "ABA Scan"),
            CardItem(id: UUID(), image: "service", title: "Service")
        ]
    @State private var draggingItem: CardItem? = nil
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(items) { item in
                CardDynamicButton(image: item.image, title: item.title)
                    .onDrag {
                        self.draggingItem = item
                        return NSItemProvider(object: item.id.uuidString as NSString)
                    }
                    .onDrop(of: [.text], delegate: DropViewDelegate(
                        item: item,
                        items: $items,
                        draggingItem: $draggingItem
                    ))
            }
        }
        .padding()
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

struct CardItem: Identifiable, Equatable {
    let id: UUID
    var image: String
    var title: String
}

struct DropViewDelegate: DropDelegate {
    let item: CardItem
    @Binding var items: [CardItem]
    @Binding var draggingItem: CardItem?
    
    func performDrop(info: DropInfo) -> Bool {
        draggingItem = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        guard let draggingItem = draggingItem, draggingItem != item else { return }
        
        // Swap positions
        if let fromIndex = items.firstIndex(of: draggingItem),
           let toIndex = items.firstIndex(of: item) {
            withAnimation {
                items.move(fromOffsets: IndexSet(integer: fromIndex),
                           toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
            }
        }
    }
}
