//
//  UIStoryboardExtension.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import Foundation
import UIKit

extension UIStoryboard {
	
	convenience init(storyboard: Storyboards) {
		self.init(name: storyboard.rawValue, bundle: nil)
	}
	
	convenience init(storyboard: Storyboards, bundle: Bundle) {
		self.init(name: storyboard.rawValue, bundle: bundle)
	}
	
	func instantiateViewController(withStoryboardIdentifiers storyboardIdentifiers: StoryboardIdentifiers) -> UIViewController{
		return self.instantiateViewController(withIdentifier: storyboardIdentifiers.rawValue)
	}
}
