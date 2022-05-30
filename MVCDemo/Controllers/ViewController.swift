//
//  ViewController.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var roadsideTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    private var apiService : APIService!
    var items : [RoadsideSign] = [RoadsideSign]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        let nib = UINib(nibName: Constants.TableviewCells.RoadsignTableViewCell, bundle: .main)
        roadsideTableView.register(nib, forCellReuseIdentifier: Constants.TableviewCells.RoadsignTableViewCell)
        roadsideTableView.dataSource = self
        roadsideTableView.delegate = self
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
           refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        roadsideTableView.addSubview(refreshControl)
        apiService = APIService()
        setupData()
    }
    
    func setupData(){
        self.showLoader(activityLoader: activityLoader)
        apiService.apiToGetData { model in
            self.hideLoader(activityLoader: self.activityLoader)
            if model.status == "true" {
                self.items = model.data
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.roadsideTableView.reloadData()
                }
            }
        }
    }
    
    @objc func refresh(_ sender: Any) {
        // Code to refresh table view
        setupData()
    }
    
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableviewCells.RoadsignTableViewCell, for: indexPath) as! RoadsignTableViewCell
        cell.tag = indexPath.row
        let item = self.items[indexPath.row]
        cell.configCell(model: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: Constants.ViewControllers.DetailViewController) as! DetailViewController
        vc.model = self.items[indexPath.row] 
        navigationController?.pushViewController(vc, animated: true)
    }
}
