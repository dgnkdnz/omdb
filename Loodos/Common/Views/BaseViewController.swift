//
//  BaseViewController.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import UIKit

open class BaseViewController<T: BasePresenterProtocol>: UIViewController {
	
	// MARK: - Public variables
	
	var presenter: T!
	
	// MARK: - LifeCycle Methods
	
	open override func viewDidLoad() {
		super.viewDidLoad()
		self.prepare()
	}
	
	// MARK: - ViewController Methods
	
	open func prepare() {
	}
}
