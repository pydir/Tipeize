//
//  String+Extensions.swift
//  Tipsy
//
//  Created by Oguz Mert Beyoglu on 4.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

extension String {
    var isNumeric: Bool {
        return !self.isEmpty && self.allSatisfy { $0.isNumber }
    }
}
