//
//  LoadingView.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import UIKit

final class LoadingView: UIView {
	
	// MARK: - Private Variables
	
	private var parentView: UIView!
	private var activityIndicator: UIActivityIndicatorView!
	
	// MARK: - Initialization Methods
	
	init(parentView: UIView) {
		super.init(frame: CGRect.zero)
		self.parentView = parentView
		
		// Configure
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7000171586)
		
		self.activityIndicator = UIActivityIndicatorView(frame: CGRect.zero)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.style = .large
		activityIndicator.hidesWhenStopped = true
		activityIndicator.color = .white
		
		self.addSubview(self.activityIndicator)
		
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
		
		self.parentView.addSubview(self)
		
		NSLayoutConstraint.activate([
			self.trailingAnchor.constraint(equalTo: self.parentView.safeAreaLayoutGuide.trailingAnchor),
			self.leadingAnchor.constraint(equalTo: self.parentView.safeAreaLayoutGuide.leadingAnchor),
			self.bottomAnchor.constraint(equalTo: self.parentView.safeAreaLayoutGuide.bottomAnchor),
			self.topAnchor.constraint(equalTo: self.parentView.safeAreaLayoutGuide.topAnchor)
		])
		
		self.hide()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - View Methods
	
	func show() {
		self.alpha = 1
		self.activityIndicator.startAnimating()
	}
	
	func hide() {
		self.alpha = 0
		self.activityIndicator.stopAnimating()
	}
}
