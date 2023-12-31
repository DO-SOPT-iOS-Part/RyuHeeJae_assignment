//
//  UIFont+.swift
//  ProjectDescriptionHelpers
//
//  Created by 류희재 on 2023/10/24.
//

import UIKit

struct FontLiterals {
    static let SFPro = "SF Pro"
    static let SFProDisplayBold = "SF Pro Display Bold"
    static let SFProDisplayLight = "SF Pro Display Light"
    static let SFProDisplayMedium = "SF Pro Display Medium"
    static let SFProDisplayRegular = "SF Pro Display Regular"
    static let SFProDisplayThin = "SF Pro Display Thin"
}

extension UIFont {
    @nonobjc public class func SFPro(size: CGFloat) -> UIFont {
        return UIFont(name: FontLiterals.SFPro, size: size) ?? systemFont(ofSize: size)
    }
    
    @nonobjc public class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: FontLiterals.SFProDisplayBold, size: size) ?? systemFont(ofSize: size)
    }
    
    @nonobjc public class func light(size: CGFloat) -> UIFont {
        return UIFont(name: FontLiterals.SFProDisplayLight, size: size) ?? systemFont(ofSize: size)
    }
    
    @nonobjc public class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: FontLiterals.SFProDisplayMedium, size: size) ?? systemFont(ofSize: size)
    }
    
    @nonobjc public class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: FontLiterals.SFProDisplayRegular, size: size) ?? systemFont(ofSize: size)
    }
    
    @nonobjc class func thin(size: CGFloat) -> UIFont {
        return UIFont(name: FontLiterals.SFProDisplayThin, size: size) ?? systemFont(ofSize: size)
    }
}

