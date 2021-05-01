//
//  BaseLabel.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import UIKit

open class BaseLabel: UILabel {
	@IBInspectable
	var localizationKey: String? {
		didSet {
			guard let key = self.localizationKey else { return }
			self.text = NSLocalizedString(key, comment: "")
		}
	}
}
