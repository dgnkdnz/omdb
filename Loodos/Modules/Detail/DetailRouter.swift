//
//  DetailRouter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import UIKit

final class DetailRouter: DetailRouterProtocol {
	
	// MARK: - Private Variables
	
	weak var delegate: SearchProtocol?
	private weak var view: UIViewController?
	
	// MARK: - Initialization Methods
	
	init(view: UIViewController) {
		self.view = view
	}
	
	// MARK: - Router Methods
	
	func navigate(to route: DetailRoute) {
		switch route {
		case .back:
			self.view?.navigationController?.popViewController(animated: true)
		}
	}
}
