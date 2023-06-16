//
//  ViewController + Identifire.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        String(describing: Self.self)
    }
}
