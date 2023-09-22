//
//  CustomPageViewBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 27/10/2022.
//

import SwiftUI

struct CustomPageViewBootcamp: View {
//    @StateObject var store = Store()
//        @State private var snappedItem = 0.0
//        @State private var draggingItem = 0.0
    
    @State var currentIndex: Int = 0
    @State var services: [NearbyService] = [NearbyService(name: "A"),
                                            NearbyService(name: "B"),
                                            NearbyService(name: "C"),
                                            NearbyService(name: "D")
    ]

        var body: some View {
            
            ZStack {
                
                // SnapCarousel
                TSnapCarousel(spacing: 40 ,index: $currentIndex, items: services) { service in
                    
                    GeometryReader { proxy in
                        
                        let size = proxy.size
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(.red)
                            Text(service.name)
                                .padding()
                        }
                        .frame(width: size.width)
                        .frame(height: 200)
                    }
                }
                .padding(.vertical, 80)
            }
        }
}
//                ForEach(store.items) { item in
//
//                    // article view
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 18)
//                            .fill(item.color)
//                        Text(item.title)
//                            .padding()
//                    }
//                    .frame(width: 200, height: 150)
//
//                    .scaleEffect(1.0 - abs(distance(item.id)) * 0.1 )
//                    .opacity(1.0 - abs(distance(item.id)) * 0.0 )
//                    .offset(x: myXOffset(item.id), y: 0)
//                    .zIndex(110.0 - abs(distance(item.id)) * 100.1)
//                }
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { value in
//                        draggingItem = snappedItem + value.translation.width / 100
//                    }
//                    .onEnded { value in
//                        withAnimation {
//                            draggingItem = snappedItem + value.predictedEndTranslation.width / 100
//                            draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
//                            snappedItem = draggingItem
//                        }
//                    }
//            )
//        }
//
//        func distance(_ item: Int) -> Double {
//            return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
//        }
//
//        func myXOffset(_ item: Int) -> Double {
//            let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
//            return sin(angle) * 300
//        }
//}

struct CustomPageViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomPageViewBootcamp()
    }
}


//struct ZItem: Identifiable {
//    var id: Int
//    var title: String
//    var color: Color
//}
//
//class Store: ObservableObject {
//    @Published var items: [ZItem]
//
//    let colors: [Color] = [.red, .orange, .blue, .teal, .mint, .green, .gray, .indigo, .black]
//
//    // dummy data
//    init() {
//        items = []
//        for i in 0...7 {
//            let new = ZItem(id: i, title: "Item \(i)", color: colors[i])
//            items.append(new)
//        }
//    }
//}


    
    
struct TSnapCarousel<Content: View, T: Identifiable>: View {
    
    var content:(T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
//            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ?  adjustMentWidth: 0) + offset)
            .offset(x: (CGFloat(currentIndex) * -width) + adjustMentWidth + offset)
            .gesture(
            
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
}
    
    



    
struct NearbyService: Identifiable {
    
    var id = UUID().uuidString
    var name: String = ""
    
}
