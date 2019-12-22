//
//  ContentView.swift
//  calculator
//
//  Created by 高得泷 on 2019/12/20.
//  Copyright © 2019 gorder. All rights reserved.
//

import SwiftUI

class CalViewModel:ObservableObject {
    @Published var disploy = "0"
    var olddisploy=""
    var fristnum=0
    var secondnum=0
    var add=false
    var sub=false
    var cheng=false
    var chu=false
    
    func butap(button: CalButton) {
        switch button.title {
            case "+":
                fristnum=Int(disploy)!
                disploy = olddisploy + button.title
                olddisploy=""
                add=true
            case "-"  :
                fristnum=Int(disploy)!
                disploy = olddisploy + button.title
                olddisploy=""
                sub=true
            case "x"  :
                fristnum=Int(disploy)!
                disploy = olddisploy + button.title
                olddisploy=""
                cheng=true
            case "%"  :
                fristnum=Int(disploy)!
                disploy = olddisploy + button.title
                olddisploy=""
                chu=true
            case "AC"  :
                fristnum=0
                secondnum=0
                olddisploy=""
                disploy = "0"
                add=false
                sub=false
                cheng=false
                chu=false
            case "="  :
                if(add){
                    secondnum = Int(disploy)!
                    disploy = String(fristnum+secondnum)
                }else if(sub){
                    secondnum = Int(disploy)!
                    disploy = String(fristnum-secondnum)
                }else if(cheng){
                    secondnum = Int(disploy)!
                    disploy = String(fristnum*secondnum)
                }else if(chu){
                    secondnum = Int(disploy)!
                    disploy = String(fristnum/secondnum)
                }
                add=false
                sub=false
                cheng=false
                chu=false
                fristnum=0
                secondnum=0
                olddisploy=""
            default :
                disploy = olddisploy + button.title
                olddisploy=disploy
        }
    }
}

struct ContentView: View {
    let spacing: CGFloat=12
    @ObservedObject var vm = CalViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: self.spacing){
                    Spacer()
                    HStack{
                        Spacer()
                        Text(self.vm.disploy)
                        .font(.system(size:74))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                    }.padding(.horizontal,self.spacing)
                    ForEach(buttonrows, id: \.self) {buttonrow in
                        CalLaw(
                            screenwidth: geometry.size.width,
                            spacing: self.spacing,
                            buttons: buttonrow,
                            Didtap:{button in self.vm.butap(button:button)})
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
