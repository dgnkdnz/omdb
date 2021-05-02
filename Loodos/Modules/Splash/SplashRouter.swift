//
//  SplashRouter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import UIKit

final class SplashRouter: SplashRouterProtocol {
	
	weak var view: UIViewController?
	
	init(view: UIViewController) {
		self.view = view
	}
	
	func navigate(to route: SplashRoute) {
		
	}
}
