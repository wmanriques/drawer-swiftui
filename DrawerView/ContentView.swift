//
//  ContentView.swift
//  DrawerView
//
//  Created by wsk on 4/21/20.
//  Copyright © 2020 wsk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOpen: Bool = false
    
    var body: some View {
        
        GeometryReader{ geometry in
            HStack {
                
                Button(action: {
                    self.isOpen.toggle()
                }) {
                    Text("show")
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .overlay(Drawer(isOpen: self.$isOpen))

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
