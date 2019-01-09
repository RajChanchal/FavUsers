//
//  HomeViewController.swift
//  FavUsers
//
//  Created by Chanchal Raj on 08/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tblUsers: UITableView!
    
    //MARK:- Non-UI Instance Variables
    lazy var viewModel = HomeViewModel()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Remove TableView Empty Rows
        tblUsers.tableFooterView = UIView.init(frame: CGRect.zero)
        
        //Fetch Users
        self.fetchUsers()
    }

    //MARK:- Helper Methods
    private func fetchUsers(){
        viewModel.getUsers { [weak self] (result) in
            switch result{
                case .success(_):
                    DispatchQueue.main.async {
                        self?.tblUsers.reloadData()
                    }
                
                case .failure(let error):
                    print("Error occured: \(error.localizedDescription)")
            }
        }
    }
}
//MARK:- TableView Data Source
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalUsers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserTableViewCell
        userCell.viewModel = viewModel.userCellViewModelForIndex(index: indexPath.row)
        return userCell
    }
    
}
