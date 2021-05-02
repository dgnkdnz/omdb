//
//  SplashViewController.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import UIKit

final class SplashViewController: BaseViewController<SplashPresenter> {
	
	private var isConnected = false
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default
	}
	
	override func prepare() {
		super.prepare()
		self.presenter.load()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.handleNetworks(self.isConnected)
	}
	
	// MARK: - Helper Methods
	
	private func handleNetworks(_ isConnected: Bool) {
		if isConnected {
			
		} else {
			let strTitle = NSLocalizedString("splash.networkErrorTitle", comment: "")
			let strMessage = NSLocalizedString("splash.networkErrorMessage", comment: "")
			let strOk = NSLocalizedString("general.ok", comment: "")
			let alert = UIAlertController(title: strTitle, message: strMessage, preferredStyle: .alert)
			let ok = UIAlertAction(title: strOk, style: .default, handler: nil)
			alert.addAction(ok)
			self.present(alert, animated: true, completion: nil)
		}
	}
}

extension SplashViewController: SplashViewProtocol {
	func handleOutput(_ output: SplashPresenterOutput) {
		switch output {
		case .isConnectedToNetwork(let isConnected):
			self.isConnected = isConnected
			break
		}
	}
}
