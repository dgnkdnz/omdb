//
//  AppRouter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import UIKit

final class AppRouter {
	let window: UIWindow
	
	init() {
		self.window = UIWindow(frame: UIScreen.main.bounds)
	}
	
	func start() {
		let viewController = SplashBuilder.build()
		let navigationController = UINavigationController(rootViewController: viewController)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}
