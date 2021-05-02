//
//  AppDelegate.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		app.router.start()
		return true
	}
}

