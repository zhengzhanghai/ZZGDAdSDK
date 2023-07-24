//
//  ADManager.swift
//  ZZGDAdSDK
//
//  Created by zhengzhanghai on 2023/7/24.
//

import Foundation
import BUAdSDK
import CSJMDebugTools

@objcMembers
@objc(ZZADManager)
public class ADManager: NSObject {
    
    public static let shared = ADManager()
    
    public func start(_ appId: String) {
        
        let buConfig = BUAdSDKConfiguration()
        buConfig.appID = appId
        buConfig.useMediation = true
        buConfig.debugLog = true
        
        BUAdSDKManager.start(asyncCompletionHandler: { isSuccess, error in
            
            print("====== 初始化完成")
        })
    }
    
    public func sdkVersion() -> String {
        return "9.9.9"
    }
    
    public func showDebugView() {
        CSJMDebugTools.startVisualDebug()
    }
}
