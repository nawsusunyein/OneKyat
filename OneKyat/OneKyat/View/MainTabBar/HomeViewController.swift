//
//  HomeViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class HomeViewController: UIRootViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.showNavigationBar()
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        //  self.setNavigationBarColor()
        let searchController = UISearchController(searchResultsController: nil)
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search artists"
       
           self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
            self.definesPresentationContext = true
    }
    

    private func registerCell(){
        let cell = UINib(nibName: "SliderTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "sliderCell")
        
        let cellAds = UINib(nibName: "AdvertisementTableViewCell", bundle: nil)
        self.tableView.register(cellAds, forCellReuseIdentifier: "AdsTableViewCell")
    }

}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! SliderTableViewCell
            cell.setSliderValues()
            return cell
        }else{
            let cellAds = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell",for: indexPath) as! AdvertisementTableViewCell
            return cellAds
        }
        
        //return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 180.0
        }
        return UITableView.automaticDimension
    }
    
    
}
