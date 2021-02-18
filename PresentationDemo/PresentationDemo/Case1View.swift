//
//  Case1View.swift
//  PresentationDemo
//
//  Created by Ma Xueyuan on 2021/02/18.
//

import SwiftUI

struct Case1View: View {
    @State private var sliderValue: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .center, content: {
            Slider(value: $sliderValue, in: 0.5...1.5)
            
            Image(systemName: "hare.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Color.red
                .padding(.horizontal)
                .frame(height: sliderValue * 50)
            
            Color.blue
                .padding(.horizontal)
                .frame(height: sliderValue * 30)
            
            Spacer()
        })
        .navigationTitle("Case 1")
    }
}

struct Case1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Case1View()
        }
    }
}
