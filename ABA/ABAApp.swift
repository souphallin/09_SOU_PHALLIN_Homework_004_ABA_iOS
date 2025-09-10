//
//  ABAApp.swift
//  ABA
//
//  Created by Mac on 6/9/25.
//

import SwiftUI

@main
struct ABAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appdelegate
    var body: some Scene {
        WindowGroup {
            ABA()
        }
    }
}

class AppDelegate : NSObject,UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow? ) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
