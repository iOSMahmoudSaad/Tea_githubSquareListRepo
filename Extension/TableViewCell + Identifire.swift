//
//  TableViewCell + Identifire.swift
//  Tea_githubSquareListRepo
//
//  Created by MLG on 15/06/2023.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}
