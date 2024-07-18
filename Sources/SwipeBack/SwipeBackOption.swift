//
//  SwipeBackOption.swift
//
//
//  Created by WonHee Jung on 7/18/24.
//

import Foundation

struct SwipeBackOption {
    //max move for X
    var maxMove : CGFloat = 40
    
    //max move for Additonal Y
    var maxMoveY : CGFloat = 7

    //set Confirm Action
    var confirmAction : () -> Void = {}
}


struct SwipeBackIconOption {
    // set Image From SF Symbol
    var systemImage = "chevron.left"
    
    // Icon Size
    var iconSize :CGFloat = 24
    
    // Circle Size
    var circeSize :CGFloat = 44
}
