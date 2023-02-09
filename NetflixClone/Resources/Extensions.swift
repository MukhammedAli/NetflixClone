//
//  Extensions.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 08.02.2023.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return String(self.prefix(1) + self.lowercased().dropFirst())
    }
}
