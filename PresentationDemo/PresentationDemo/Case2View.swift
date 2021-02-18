//
//  Case2View.swift
//  PresentationDemo
//
//  Created by Ma Xueyuan on 2021/02/18.
//

import SwiftUI

struct Case2View: View {
    @State private var sliderValue: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .center, spacing: 8, content: {
            Slider(value: $sliderValue, in: 0.5...1.5)
            
            Spacer()
            
            HStack(alignment: .center, content: {
                Image(systemName: "bolt.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                VStack {
                    Color.red
                        .frame(height: sliderValue * 30)
                    
                    Color.blue
                        .frame(height: sliderValue * 20)
                }
            }).padding(.horizontal)
            
            Spacer()
        })
        .navigationTitle("Case 2")
    }
}

struct Case2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Case2View()
        }
    }
}
