//
//  HapticManager.swift
//  
//
//  Created by WonHee Jung on 7/18/24.
//

import Foundation
import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    // warning, error, success
    func hapticNotification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    // heavy, light, meduium, rigid, soft
    func hapticImpact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
