//
//  SwipeBackOption.swift
//
//
//  Created by WonHee Jung on 7/18/24.
//

import Foundation

public struct SwipeBackOption {
    //max move for X
    var maxMove : CGFloat = 40
    
    //max move for Additonal Y
    var maxMoveY : CGFloat = 7

    //set Confirm Action
    var confirmAction : () -> Void = {}
    
    public init(maxMove: CGFloat, maxMoveY: CGFloat, confirmAction: @escaping () -> Void) {
        self.maxMove = maxMove
        self.maxMoveY = maxMoveY
        self.confirmAction = confirmAction
    }
}


public struct SwipeBackIconOption {
    // set Image From SF Symbol
    var systemImage = "chevron.left"
    
    // Icon Size
    var iconSize :CGFloat = 24
    
    // Circle Size
    var circeSize :CGFloat = 44
    
    public init(systemImage: String = "chevron.left", iconSize: CGFloat, circeSize: CGFloat) {
        self.systemImage = systemImage
        self.iconSize = iconSize
        self.circeSize = circeSize
    }
    
    public init() {
        self.systemImage = "chevron.left"
        self.iconSize = 24
        self.circeSize = 44
    }
}
