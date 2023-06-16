//
//  SquareViewController.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

import UIKit

protocol SquareView: AnyObject {
    
    func reloadSquareTableView()
    func startLoading()
    func endLoading()
    
}


class SquareViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var squaresTableView: UITableView!
    
    //MARK: - Vars
    private var presenter: SquarePresenter!
    private let child = SpinnerViewController()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SquarePresenter(self)
        configureTableView()
        presenter.getSquares()
        handleUI()
    }
    //MARK: - Configure TableView
    private func configureTableView() {
        squaresTableView.delegate = self
        squaresTableView.dataSource = self
        squaresTableView.register(UINib(nibName: String(describing: SquareCell.self), bundle: nil), forCellReuseIdentifier: SquareCell.identifier)
        
    }
    
    
    
}
//MARK: -  TableView Delegate

extension SquareViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.sqaureCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                squaresTableView.dequeueReusableCell(withIdentifier: SquareCell.identifier, for: indexPath) as?
                SquareCell else {return UITableViewCell()}
        cell.configureCell(with: presenter.getUsedSquare(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.DisplaySquare(at: indexPath.row)
    }
    
    
    
}

//MARK: - View Controller Extension

extension SquareViewController :SquareView {
    func reloadSquareTableView() {
        DispatchQueue.main.async { [weak self] in
            
            self?.squaresTableView.reloadData()
            
        }
    }
    
    func handleUI(){
        self.title = "Sequares Repo"
    }
    func startLoading() {
     
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        
    }
    
    func endLoading(){
        DispatchQueue.main.async {
            
            self.child.willMove(toParent: nil)
            self.child.view.removeFromSuperview()
            self.child.removeFromParent()
        }
        
    }
    
    
}
