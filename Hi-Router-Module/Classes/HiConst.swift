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

public let HiSCREENBOUNDS = UIScreen.main.bounds
public let HiSCREENWIDTH = HiSCREENBOUNDS.width
public let HiSCREENHEIGHT = HiSCREENBOUNDS.height

public let HiIPhoneX = HiSCREENWIDTH == 375 && HiSCREENHEIGHT == 812

public let HiIPhoneXrMax = HiSCREENWIDTH == 414 && HiSCREENHEIGHT == 896

public let HiIPhonePlus = HiSCREENWIDTH == 414 && HiSCREENHEIGHT == 736

public let HiIPhone8 = HiSCREENWIDTH == 375 && HiSCREENHEIGHT == 667

public let HiIPhoneSe = HiSCREENWIDTH == 320 && HiSCREENHEIGHT == 568

public let HiIPhone12PRO = HiSCREENWIDTH == 390 && HiSCREENHEIGHT == 844

public let HiIPhone12Mini = HiSCREENWIDTH == 360 && HiSCREENHEIGHT == 780

public let HiIPhone12ProMax = HiSCREENWIDTH == 428 && HiSCREENHEIGHT == 926

public let isIPhoneX = (HiIPhoneX || HiIPhoneXrMax || HiIPhone12PRO || HiIPhone12Mini || HiIPhone12ProMax)

public let HiStatusBarH:CGFloat = (isIPhoneX ? 44 : 20)

public let HiNavigationBarH:CGFloat = 44

public let HiTabBarH:CGFloat = (isIPhoneX ? (49+34) : 49)

public let HiTabbarSafeBotM:CGFloat = (isIPhoneX ? (34) : 0)

public let HiStatusBarAndNavigationBarH:CGFloat = (isIPhoneX ? (88) : 64)
