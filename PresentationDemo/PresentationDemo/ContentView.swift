//
//  ContentView.swift
//  PresentationDemo
//
//  Created by Ma Xueyuan on 2021/02/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Case 1", destination: Case1View())
                NavigationLink("Case 2", destination: Case2View())
                NavigationLink("Case 3", destination: Case3View())
            }
            .navigationBarTitle("Demo")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
