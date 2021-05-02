//
//  SplashRouter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import UIKit

final class SplashRouter: SplashRouterProtocol {
	
	// MARK: - Private Variables
	
	private weak var view: UIViewController?
	
	// MARK: - Initialization Methods
	
	init(view: UIViewController) {
		self.view = view
	}
	
	// MARK: - Router Methods
	
	func navigate(to route: SplashRoute) {
		switch route {
		case .search:
			self.view?.navigationController?.popViewController(animated: false)
			let searchView = SearchBuilder.build()
			self.view?.navigationController?.pushViewController(searchView, animated: true)
			break
		}
	}
}
