//
//  SquarePresenter.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

import Foundation

class SquarePresenter {

    //MARK: - Vars
    var  sqaures : [Square] = []
    private weak var view : SquareView?
    
    //MARK: - Pagination Vars
    
    var squarePerPages = 10
    var limit = 10
    var paginationSqaures : [Square] = []
    
    //MARK: - Init
    
    init(_ view: SquareView? = nil) {
        self.view = view
         
    }
    
    //MARK: - Public funcs
    
    func getSquares(){
        APIService.sharedService.getSquareRepso { (squares :[Square]? , error) in
            guard let squares = squares else {
                return
            }
            self.sqaures = squares
            self.limit = self.sqaures.count
            
            for i in 0..<10 {
                self.paginationSqaures.append(squares[i])
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.view?.reloadSquareTableView()
                
            }
        }
    }
    
    func sqaureCount() -> Int {
        return paginationSqaures.count
    }
    
    func getUsedSquare(at row :Int) -> Square{
        
        return paginationSqaures[row]
    }
    func DisplaySquare(at row :Int) {
        if row == paginationSqaures.count - 1{
            addNewSquares()
        }
            
    }
}


extension SquarePresenter {
    private func addNewSquares() {
        
        if squarePerPages >= limit {
            return
        }
        else if squarePerPages >= limit - 10 {
            for i in squarePerPages..<limit{
                paginationSqaures.append(sqaures[i])
            }
            self.squarePerPages += 10
        }
        else {
            for i in squarePerPages..<squarePerPages + 10 {
                paginationSqaures.append(sqaures[i])
            }
            self.squarePerPages += 10
            
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.reloadSquareTableView()
            
        }
    }
}
