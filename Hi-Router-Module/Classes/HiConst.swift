//
//  HiConst.swift
//  Hi-Router-Module
//
//  Created by stone on 2022/4/29.
//

import UIKit

public func HiLog<T>(_ message: T, _ file: String = #file, _ line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")):\(line):\(message)")
    #endif
}

public let SCREENBOUNDS = UIScreen.main.bounds
public let SCREENWIDTH = SCREENBOUNDS.width
public let SCREENHEIGHT = SCREENBOUNDS.height

public let IS_IPHONE_X = SCREENWIDTH == 375 && SCREENHEIGHT == 812

public let IS_IPHONE_XR_Max = SCREENWIDTH == 414 && SCREENHEIGHT == 896

public let IS_IPHONE_Plus = SCREENWIDTH == 414 && SCREENHEIGHT == 736

public let IS_IPHONE_8 = SCREENWIDTH == 375 && SCREENHEIGHT == 667

public let IS_IPHONE_SE = SCREENWIDTH == 320 && SCREENHEIGHT == 568

public let IS_IPHONE_12PRO = SCREENWIDTH == 390 && SCREENHEIGHT == 844

public let IS_IPHONE_12Mini = SCREENWIDTH == 360 && SCREENHEIGHT == 780

public let IS_IPHONE_12ProMax = SCREENWIDTH == 428 && SCREENHEIGHT == 926

public let isIPhoneX = (IS_IPHONE_X || IS_IPHONE_XR_Max || IS_IPHONE_12PRO || IS_IPHONE_12Mini || IS_IPHONE_12ProMax)

public let NAVBAR_HEIGHT: CGFloat = isIPhoneX ? 88.0 : 64.0

public let TABBAR_HEIGHT: CGFloat = isIPhoneX ? 83.0 : 49.0

public let StatusBarH:CGFloat = (isIPhoneX ? 44 : 20)

public let NavigationBarH:CGFloat = 44

public let TabBarH:CGFloat = (isIPhoneX ? (49+34) : 49)

public let TabbarSafeBotM:CGFloat = (isIPhoneX ? (34) : 0)

public let StatusBarAndNavigationBarH:CGFloat = (isIPhoneX ? (88) : 64)
