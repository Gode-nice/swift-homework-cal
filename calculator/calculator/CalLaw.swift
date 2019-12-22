//
//  CalLaw.swift
//  calculator
//
//  Created by 高得泷 on 2019/12/22.
//  Copyright © 2019 gorder. All rights reserved.
//

import SwiftUI

struct CalLaw: View {
    let screenwidth:CGFloat
    let spacing:CGFloat
    let buttons:[CalButton]
    
    var Didtap:(CalButton)->()
    
    var body: some View {
        HStack{
            ForEach(self.buttons){button in
                Button(action: {
                    self.Didtap(button)
                }) {
                    Text(button.title)
                    .font(.system(size:32))
                    .foregroundColor(.white)
                    .frame(width:(self.screenwidth-self.spacing*5)/4,
                           height:(self.screenwidth-self.spacing*5)/4)
                    .background(button.color)
                    .cornerRadius(50)
                }
            }
        }
    }
}

struct CalLaw_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            CalLaw(screenwidth: geometry.size.width, spacing: 12, buttons: buttonrows[0], Didtap: {button in print("but \(button.title) tap")})
        }
    }
}
