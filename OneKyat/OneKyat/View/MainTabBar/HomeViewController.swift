//
//  HomeViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class HomeViewController: UIRootViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var adsViewModel : AdsViewModel = AdsViewModel()
    private var index : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.setSearchBarinNavigationBar()
        self.setCustomButtonAtRighInNavigation(iconName : "logout")
        self.setNavigationBarAttributes(title: "Home")
        
    }
    

    //Register table view cell to show slider and ads
     func registerCell(){
        let cell = UINib(nibName: "SliderTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "sliderCell")
        
        let cellAds = UINib(nibName: "AdvertisementTableViewCell", bundle: nil)
        self.tableView.register(cellAds, forCellReuseIdentifier: "AdsTableViewCell")
    }

}


//Set table view delegate and data soure methods
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! SliderTableViewCell
            cell.setSliderImages()
            return cell
        }else{
            let cellAds = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell",for: indexPath) as! AdvertisementTableViewCell
            cellAds.configure()
            cellAds.delegate = self
            return cellAds
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 180.0
        }
        return (205 * 16) / 2
    }
    
    
}

extension HomeViewController : CustomDelegate{
    func didSelectItem(index: Int) {
        let storyboard = UIStoryboard(name : "AdsItemDetails", bundle : nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AdsItemDetailsIdentifier") as! AdsItemDetailsViewController
        vc.idValue = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
