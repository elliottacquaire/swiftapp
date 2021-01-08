//
//  ColorUI.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/24.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import SwiftUI



extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}


import UIKit
 
extension UIColor {
     
    // Hex String -> UIColor
    convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
         
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
         
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
         
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
         
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
         
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
     
    // UIColor -> Hex String
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
         
        let multiplier = CGFloat(255.999999)
         
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
         
        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
        else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }
    
    
    /**
        *  16进制 转 RGBA
        */
       class func rgbaColorFromHex(rgb:Int, alpha:CGFloat) ->UIColor {
           
           return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                        green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                         blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                        alpha: alpha)
       }
       
       /**
        *  16进制 转 RGB
        */
       class func rgbColorFromHex(rgb:Int) ->UIColor {
           
           return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                        green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                         blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                        alpha: 1.0)
       }
}







