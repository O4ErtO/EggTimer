//
//  LabelExtension.swift
//  EggTimerAC
//
//  Created by Artem Vekshin on 03.11.2023.
//

import UIKit

extension UILabel{
    convenience init (text: String, font: UIFont?, textColor: UIColor? = .white ,textAligment: NSTextAlignment? = .center, numberOfLines: Int) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
