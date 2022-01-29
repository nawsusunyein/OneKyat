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
    
    var bindItemListAdsViewModelToVC : (() -> ()) = {}
    
    func setItemListModel(){
        var itemList = [ItemModel]()
        let item1 = ItemModel(itemId: 1, itemName: "iPhone 13", itemPrice: 23000000.0)
        let item2 = ItemModel(itemId: 2, itemName: "Power Charger", itemPrice: 2300.35)
        let item3 = ItemModel(itemId: 3, itemName: "Lotion", itemPrice: 3400.0)
        itemList.append(item1)
        itemList.append(item2)
        itemList.append(item3)
        
        self.itemListModel = itemList
    }
}
