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
    private var bannerImages : [String] = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.setSearchBarinNavigationBar()
        self.setCustomButtonAtRighInNavigation(iconName : IconName.logout)
        self.setNavigationBarAttributes(title: ScreenTitle.home)
        self.updateItemBannerSellerList()
        self.setItemListAndSellerList()
        self.getItemAndSellerInfo()
    }
    

    //Register table view cell to show slider and ads
     func registerCell(){
        let cell = UINib(nibName: TableViewCellXib.SliderView, bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: ScreenIdentifier.SliderViewIdentifier)
        
        let cellAds = UINib(nibName: TableViewCellXib.AdvertisementListView, bundle: nil)
        self.tableView.register(cellAds, forCellReuseIdentifier: ScreenIdentifier.AdvertismentListViewIdentifier)
    }
    
    //Set item lists and seller list and banner list
    func setItemListAndSellerList(){
        self.adsViewModel.getItemListFromDB()
        self.adsViewModel.getSellerListFromDB()
        self.adsViewModel.setBannerImages()
    }
    
    //Update item,banner and seller List
    func updateItemBannerSellerList(){
        self.adsViewModel.bindItemListAdsViewModelToVC = {
            self.itemList = self.adsViewModel.itemListModel
           
        }
        self.adsViewModel.bindUserListAdsViewModelToVC = {
            self.sellerList = self.adsViewModel.sellerListModel
        }
        
        self.adsViewModel.bindBannerImagesAdsViewModelToVC = {
            self.bannerImages = self.adsViewModel.banner
        }
        
        self.tableView.reloadData()
    }
    
   

}


//Set table view delegate and data soure methods
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: ScreenIdentifier.SliderViewIdentifier, for: indexPath) as! SliderTableViewCell
            cell.setSliderImages(banner : self.bannerImages)
            return cell
        }else{
            let cellAds = tableView.dequeueReusableCell(withIdentifier: ScreenIdentifier.AdvertismentListViewIdentifier,for: indexPath) as! AdvertisementTableViewCell
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
        let storyboard = UIStoryboard(name : StoryboardName.AdsDetailsView, bundle : nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ScreenIdentifier.AdvertisementDetailsViewIdentifier) as! AdsItemDetailsViewController
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
