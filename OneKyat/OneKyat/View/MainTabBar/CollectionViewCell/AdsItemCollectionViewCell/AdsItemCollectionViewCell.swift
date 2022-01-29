//
//  AdsItemCollectionViewCell.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class AdsItemCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    
    @IBOutlet weak var itemCardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindDataToUI(item : ItemModel){
        self.itemImage.image = UIImage(named: item.itemImage)
        self.itemName.text = item.itemName
        self.itemPrice.text = String(item.itemPrice) + " MMK"
        UIViewDecoration.shared.cardView(corner: 5.0, shadowColor: UIColor.black, cardView: self.itemCardView, shadowWidth: 2.0, shadowHeight: 1.0,opacity: 0.8)
    }
}
