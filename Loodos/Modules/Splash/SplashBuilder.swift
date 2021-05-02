//
//  SplashBuilder.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import UIKit

final class SplashBuilder {
	static func build() -> SplashViewController {
		let storyboard = UIStoryboard(storyboard: .splash)
		let view = storyboard.instantiateViewController(withStoryboardIdentifiers: .splashViewController) as! SplashViewController
		let router = SplashRouter(view: view)
		let interactor = SplashInteractor(networkService: app.networkService, remoteConfigService: app.remoteConfigService)
		let presenter = SplashPresenter(view: view, interactor: interactor, router: router)
		view.presenter = presenter
		return view
	}
}
