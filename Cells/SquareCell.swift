//
//  SquareCell.swift
//  Tea_githubSquareListRepo
//
//  Created by MLG on 15/06/2023.
//

import UIKit

class SquareCell: UITableViewCell {

    @IBOutlet weak var SquareNameLbl: UILabel!
    
    @IBOutlet weak var SquareDescriptionLbl: UILabel!
    
    //MARK: - Configure Cell
    func configureCell(with square: Square) {
        SquareNameLbl.text = square.squareName
        SquareDescriptionLbl.text = square.squareDescription ?? "There is no dscirption for this user"
        
    }
}
