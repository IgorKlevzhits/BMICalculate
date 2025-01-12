//
//  UIKit + Extention.swift
//  BMICalculate
//
//  Created by Игорь Клевжиц on 13.01.2025.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView]) {
        self.init(arrangedSubviews: subViews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(aligment: NSTextAlignment) {
        self.init()
        self.textAlignment = aligment
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.textColor = .darkGray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UISlider {
    convenience init(maxValue: Float) {
        self.init()
        
        self.maximumValue = maxValue
        self.value = maxValue / 2
        self.thumbTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

extension UIButton {
    convenience init(isBackgroundWhite: Bool) {
        self.init(type: .system)
        let color = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1.0)
        let text = isBackgroundWhite ? "RECALCULATE" : "CALCULATE"
        self.tintColor = isBackgroundWhite ? color : .white
        self.backgroundColor = isBackgroundWhite ? .white : color
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.setTitle(text, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
