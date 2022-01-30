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
    private var itemList : [ItemModel] = [ItemModel]()
    private var sellerList : [SellerModel] = [SellerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.setSearchBarinNavigationBar()
        self.setCustomButtonAtRighInNavigation(iconName : "logout")
        self.setNavigationBarAttributes(title: "Home")
        self.updateItemList()
        self.updateSellerList()
        self.setItemListAndSellerList()
        self.getItemAndSellerInfo()
    }
    

    //Register table view cell to show slider and ads
     func registerCell(){
        let cell = UINib(nibName: "SliderTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "sliderCell")
        
        let cellAds = UINib(nibName: "AdvertisementTableViewCell", bundle: nil)
        self.tableView.register(cellAds, forCellReuseIdentifier: "AdsTableViewCell")
    }
    
    //Set item lists and seller list
    func setItemListAndSellerList(){
        self.adsViewModel.setItemListModel()
        self.adsViewModel.setSellerList()
    }
    
    //Update itemList
    func updateItemList(){
        self.adsViewModel.bindItemListAdsViewModelToVC = {
            self.itemList = self.adsViewModel.itemListModel
           
        }
        self.tableView.reloadData()
    }
    
    //Update sellerList
    func updateSellerList(){
        self.adsViewModel.bindUserListAdsViewModelToVC = {
            self.sellerList = self.adsViewModel.sellerListModel
        }
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
            cellAds.configure(itemList : self.itemList)
            cellAds.delegate = self
            return cellAds
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 180.0
        }
        return CGFloat((205 * (self.itemList.count + 1) / 2))
    }
    
    func goToAdsDetailsScreen(itemInfo : ItemModel?, sellerInfo : SellerModel?){
        let storyboard = UIStoryboard(name : "AdsItemDetails", bundle : nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AdsItemDetailsIdentifier") as! AdsItemDetailsViewController
        vc.itemInfo = itemInfo
        vc.sellerInfo = sellerInfo
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    func getItemAndSellerInfo(){
        self.adsViewModel.bindSelectedItemAdsViewModelToVC = {
            let itemInfo = self.adsViewModel.selectedItem
            self.adsViewModel.bindSelectedSellerAdsViewModelToVC = {
                let sellerInfo = self.adsViewModel.selectedSeller
                self.goToAdsDetailsScreen(itemInfo: itemInfo, sellerInfo: sellerInfo)
            }
        }
       
    }
    
}

extension HomeViewController : CustomDelegate{
    func didSelectItem(selectedItem: ItemModel) {
        self.adsViewModel.getItemDetailsAndSellerInfo(item: selectedItem)
        
    }
}
