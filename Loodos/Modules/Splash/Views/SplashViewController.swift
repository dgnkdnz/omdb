//
//  SplashViewController.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import UIKit

final class SplashViewController: BaseViewController<SplashPresenter> {
	
	// MARK: - IBOutlets
	
	@IBOutlet private weak var titleLabel: UILabel!
	
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
			self.presenter.fetchRemoteConfigs()
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
	
	private func startTimerForNavigate() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
			self?.presenter.showSearch()
		}
	}
}

extension SplashViewController: SplashViewProtocol {
	func handleOutput(_ output: SplashPresenterOutput) {
		switch output {
		case .isConnectedToNetwork(let isConnected):
			self.isConnected = isConnected
			break
		case .updateTitle(let title):
			self.titleLabel.text = title
			self.startTimerForNavigate()
			break
		}
	}
}
