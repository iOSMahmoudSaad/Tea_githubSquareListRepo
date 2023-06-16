//
//  SquareCell.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

import UIKit

class SquareCell: UITableViewCell {
    //MARK: - Outlet
    @IBOutlet weak var SquareNameLbl: UILabel!
    
    @IBOutlet weak var SquareAvatar: UIImageView!
    
    @IBOutlet weak var SquareDescriptionLbl: UILabel!
    
    @IBOutlet weak var ContentView: UIView!
    
    //MARK: - Configure Cell
    func configureCell(with square: Square) {
        SquareNameLbl.text = square.squareName
        SquareDescriptionLbl.text = square.squareDescription ?? "There is no dscirption for this user"
        guard let owner = square.owner else {return}
        guard let imageURL = owner.avatarImage else {return}
        SquareAvatar.load(urlString: imageURL)
        ContentView.addShadow()
        
    }
    
     
    
}
