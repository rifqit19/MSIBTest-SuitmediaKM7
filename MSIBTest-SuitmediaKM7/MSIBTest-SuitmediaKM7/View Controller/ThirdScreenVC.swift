//
//  ThirdScreenVC.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import UIKit

class ThirdScreenVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableview_user: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var users: [User] = []
    var currentPage = 1
    var perPage = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        loadData()
    }

}


//MARK: -Function Section
extension ThirdScreenVC{
    //Setup Tabelview
    func setupTableView(){
        tableview_user.dataSource = self
        tableview_user.delegate = self
        tableview_user.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        activityIndicator.hidesWhenStopped = true
        tableview_user.tableFooterView = activityIndicator
        
        //pull to refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableview_user.refreshControl = refreshControl
        
        //empty state
        emptyStateLabel.isHidden = true

    }
    
    @objc func refreshData() {
        currentPage = 1
        loadData()
    }
    

    

    //Load data
    func loadData(){
        activityIndicator.startAnimating()
        ApiHelper.shared.fetchUsers(page: currentPage, perPage: perPage) { [weak self] users, error in
            guard let self = self else { return }
            
            if let error = error{
                print("Error fetching data: \(error.localizedDescription)")
                
            }else if let users = users{
                
                if self.currentPage == 1{
                    self.users = users
                }else{
                    self.users.append(contentsOf: users)
                }
                
                //update view
                DispatchQueue.main.async {
                    self.tableview_user.reloadData()
                    self.tableview_user.refreshControl?.endRefreshing()
                    
                    //show empty state label based on data availability
                    self.emptyStateLabel.isHidden = !self.users.isEmpty
                }
            }
            self.activityIndicator.stopAnimating()
        }
    }

    // MARK: - UITableViewDataSource

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCellVC
        let user = users[indexPath.row]

        cell.label_username.text = "\(user.first_name) \(user.last_name)"
        cell.label_email.text = user.email
        cell.image_avatar.loadImage(from: URL(string: user.avatar)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        updateSelectedUserLabel(name: "\(selectedUser.first_name) \(selectedUser.last_name)")
        navigationController?.popViewController(animated: true)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (tableview_user.contentOffset.y + tableview_user.frame.size.height) >= tableview_user.contentSize.height {
            currentPage += 1
            loadData()
        }
    }

    func updateSelectedUserLabel(name: String) {
            if let secondViewController = navigationController?.viewControllers.first(where: { $0 is SecondScreenVC }) as? SecondScreenVC {
                secondViewController.label_selected_user.text = name
            }
        }
    
}
