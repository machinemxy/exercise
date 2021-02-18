//
//  Case3View.swift
//  PresentationDemo
//
//  Created by Ma Xueyuan on 2021/02/18.
//

import SwiftUI

struct Case3View: View {
    @State private var sliderValue: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .center, content: {
            Slider(value: $sliderValue, in: 0.5...1.5)
            
            ZStack {
                Color.yellow
                
                VStack {
                    Image(systemName: "tortoise")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Color.red
                        .padding(.horizontal)
                        .frame(height: sliderValue * 50)
                    
                    Color.blue
                        .padding(.horizontal)
                        .frame(height: sliderValue * 30)
                    
                    Spacer()
                }.padding(.vertical)
            }.frame(height: 300)

            Spacer()
        })
        .navigationTitle("Case 3")
    }
}

struct Case3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Case3View()
        }
    }
}
