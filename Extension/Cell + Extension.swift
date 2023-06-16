//
//  Cell + Extension.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

 

import UIKit

extension UIView {
   
   func addShadow() {
       
       self.layer.shadowColor = UIColor.black.cgColor
       self.layer.shadowOpacity = 0.2
       self.layer.shadowOffset = .zero
       self.layer.shadowRadius = 4
       self.layer.shouldRasterize = true
       self.layer.rasterizationScale = UIScreen.main.scale
       self.layer.cornerRadius = 15
       
       }

}
