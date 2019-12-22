//
//  CalcuButton.swift
//  calculator
//
//  Created by 高得泷 on 2019/12/22.
//  Copyright © 2019 gorder. All rights reserved.
//

import SwiftUI

extension Color {
    static let lightGray = Color(red: 0.6, green: 0.6, blue: 0.6)
    static let darkGray = Color(red: 0.2, green: 0.2, blue: 0.2)
}

struct CalButton: Identifiable,Hashable{
    let id=UUID()
    let title:String
    var color: Color = .darkGray
}

let buttonrows:[[CalButton]]=[
    [.init(title:"7"),
    .init(title:"8"),
    .init(title:"9"),
    .init(title:"%",color: Color.orange)],
    [.init(title:"4"),
    .init(title:"5"),
    .init(title:"6"),
    .init(title:"x",color: Color.orange)],
    [.init(title:"1"),
    .init(title:"2"),
    .init(title:"3"),
    .init(title:"-",color: Color.orange)],
    [.init(title:"AC",color: Color.lightGray),
    .init(title:"0"),
    .init(title:"=",color: Color.lightGray),
    .init(title:"+",color: Color.orange)]
]
