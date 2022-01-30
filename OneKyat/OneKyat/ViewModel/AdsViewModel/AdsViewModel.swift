//
//  AdsViewModel.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import Foundation

class AdsViewModel : NSObject{
    
    private(set) var itemListModel : [ItemModel]! {
        didSet{
            self.bindItemListAdsViewModelToVC()
        }
    }
    
    private(set) var sellerListModel : [SellerModel]!{
        didSet{
            self.bindUserListAdsViewModelToVC()
        }
    }
    
    private(set) var selectedItem : ItemModel!{
        didSet{
            self.bindSelectedItemAdsViewModelToVC()
        }
    }
    
    private(set) var selectedSeller : SellerModel!{
        didSet{
            self.bindSelectedSellerAdsViewModelToVC()
        }
    }
    
    var bindItemListAdsViewModelToVC : (() -> ()) = {}
    var bindUserListAdsViewModelToVC : (() -> ()) = {}
    var bindSelectedItemAdsViewModelToVC : (() -> ()) = {}
    var bindSelectedSellerAdsViewModelToVC : (() -> ()) = {}
    
    func setItemListModel(){
        var itemList = [ItemModel]()
        let item1 = ItemModel(itemId : 1, itemName : "iPhone 13", itemPrice : 1800000.00 ,sellerId : "shweyamone", itemDescription : "99% new condition , you need to come to Tamwe to check the product. Accept bank transfer.", itemImage : "iphone13", itemUploadTime : "")
        let item2 = ItemModel(itemId : 2, itemName : "Power Bank", itemPrice : 67000.00 ,sellerId : "myuhninko28", itemDescription : "Made in China. you need to come to Dagon to check the product. Accept only cash", itemImage : "charger", itemUploadTime : "")
        let item3 = ItemModel(itemId : 3, itemName : "Tablet", itemPrice : 2300000.00 ,sellerId : "kgmalay28", itemDescription : "99% new condition , you need to come to Kyouk Myaung to check the product. Accept bank transfer.", itemImage : "tablet", itemUploadTime : "")
        let item4 = ItemModel(itemId : 4, itemName : "Bicycle", itemPrice : 35000.00 ,sellerId : "jinyongxyz", itemDescription : "99% new condition , Made in japan. Accept bank transfer.", itemImage : "bicycle", itemUploadTime : "")
        let item5 = ItemModel(itemId : 5, itemName : "Blanket", itemPrice : 10000.00 ,sellerId : "shweyamone", itemDescription : "BKK made.  Accept bank transfer and cash on delivery. you can't cancel after order is confirmed", itemImage : "blanket", itemUploadTime : "")
        let item6 = ItemModel(itemId : 6, itemName : "Vivo", itemPrice : 240000.00 ,sellerId : "yaungnioo09", itemDescription : "99% new condition , you need to come to Bahan to check the product. Accept bank transfer and cash. 6 months waranty", itemImage : "vivo", itemUploadTime : "")
        let item7 = ItemModel(itemId : 7, itemName : "Acer", itemPrice : 754000.00 ,sellerId : "jinyongxyz", itemDescription : "99% new condition , you need to come to Yankin to check the product. Accept only cash.", itemImage : "acer", itemUploadTime : "")
        let item8 = ItemModel(itemId : 8, itemName : "Pen ", itemPrice : 2300.00 ,sellerId : "kgmalay28", itemDescription : "Made in korea. Wholesale for 100 pens. Accept bank transfer.", itemImage : "pen", itemUploadTime : "")
        let item9 = ItemModel(itemId : 9, itemName : "Cup", itemPrice : 5490.20 ,sellerId : "myuhninko28", itemDescription : "Made in china. Accept bank transfer. and Cash on delivery ", itemImage : "cup", itemUploadTime : "")
        let item10 = ItemModel(itemId : 10, itemName : "T Shirt", itemPrice : 23400.00 ,sellerId : "yaungnioo09", itemDescription : "BKK made. 100% cotton. Cash on Delivery in Yangon. If you are not at Yangon, you need to give prepaid", itemImage : "shirt", itemUploadTime : "")
        itemList.append(item1)
        itemList.append(item2)
        itemList.append(item3)
        itemList.append(item4)
        itemList.append(item5)
        itemList.append(item6)
        itemList.append(item7)
        itemList.append(item8)
        itemList.append(item9)
        itemList.append(item10)
        self.itemListModel = itemList
    }
    
    func setSellerList(){
        var sellerList = [SellerModel]()
        let seller1 = SellerModel(sellerId : "shweyamone", sellerName : "Shwe Yamone Oo", sellerImage : "seller1", sellerLocation : "Yangon, Tamwe", sellerPhoneNumber : "0923463738")
        let seller2 = SellerModel(sellerId : "myuhninko28", sellerName : "Myuu Hnin Nyo", sellerImage : "seller2", sellerLocation : "Yangon, Dagon", sellerPhoneNumber : "09234637222")

        let seller3 = SellerModel(sellerId : "kgmalay28", sellerName : "Pang Pang", sellerImage : "seller3", sellerLocation : "Yangon, Kyouk Myaung", sellerPhoneNumber : "0943017282")

        let seller4 = SellerModel(sellerId : "jinyongxyz", sellerName : "Jing Yong", sellerImage : "seller4", sellerLocation : "Yangon, yangon", sellerPhoneNumber : "09445878888")

        let seller5 = SellerModel(sellerId : "yaungnioo09", sellerName : "Yaung Ni Oo", sellerImage : "seller5", sellerLocation : "Yangon, yangon", sellerPhoneNumber : "0923666666")
        sellerList.append(seller1)
        sellerList.append(seller2)
        sellerList.append(seller3)
        sellerList.append(seller4)
        sellerList.append(seller5)
        sellerListModel = sellerList
    }
    
    func getItemDetailsAndSellerInfo(item : ItemModel){
        let sellerId = item.sellerId
        let seller = self.sellerListModel.filter({$0.sellerId == sellerId}).first
        self.selectedItem = item
        self.selectedSeller = seller
    }
}
