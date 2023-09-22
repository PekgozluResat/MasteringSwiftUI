//
//  MatchedGeometryEffectBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 27/03/2022.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var nameSpace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "animationID", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
            
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "animationID", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation {
                isClicked.toggle()
            }
        }
        
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchedGeometryEffectBootcamp()
            MatchedGeometryEffectExample2()
        }
        
    }
}

struct MatchedGeometryEffectExample2: View {
    
    let categories: [String] = ["none", "popular", "saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
//                            .frame(width: 55, height: 2)
//                            .offset(y: 10)
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                    }
                    
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }.padding()
    }
}
