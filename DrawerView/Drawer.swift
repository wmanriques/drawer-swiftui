//
//  DrawerView.swift
//  DrawerView
//
//  Created by wsk on 4/21/20.
//  Copyright © 2020 wsk. All rights reserved.
//

import SwiftUI

struct Drawer<Content: View>: View {
    
    @Binding var isOpen: Bool
    var content: Content
    
    var body: some View {
        
        ZStack() {
            
            if isOpen {
                Rectangle()
                    .foregroundColor(Color.black)
                    .opacity(0.75)
                    .edgesIgnoringSafeArea(.all)
                    .animation(.default)
                    .onTapGesture {
                        self.isOpen.toggle()
                }
            }
            
            GeometryReader{ geometry in
                
                VStack {
                    self.content
                    Spacer()
                    Spacer()
                        .frame(height: geometry.safeAreaInsets.bottom)
                    
                }
                .frame(width: geometry.size.width)
                .frame(height: geometry.size.height / 3.0)
                .background(Color.white)
                .clipShape(DrawerShape())
                .offset(y: self.isOpen ? geometry.size.height / 3.0 : 2 * geometry.size.height / 3.0)
            }
            .animation(Animation.easeOut)
            .edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        Drawer(isOpen: .constant(true), content: Text("content"))
    }
}

extension Drawer {
    
    struct DrawerShape: Shape {
        
        var cornerRadious: CGFloat = 25
        
        func path(in rect: CGRect) -> Path {
            
            var path = Path()
            
            let w = rect.size.width
            let h = rect.size.height
            
            path.move(to: CGPoint(x: 0, y: cornerRadious))
            path.addArc(center: CGPoint(x: cornerRadious, y: cornerRadious), radius: cornerRadious, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            path.addLine(to: CGPoint(x: w - 2 * cornerRadious, y: 0))
            path.addArc(center: CGPoint(x: w - cornerRadious, y: cornerRadious), radius: cornerRadious, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: w, y: h))
            path.addLine(to: CGPoint(x: 0, y: h))
            
            return path
        }
    }
}
