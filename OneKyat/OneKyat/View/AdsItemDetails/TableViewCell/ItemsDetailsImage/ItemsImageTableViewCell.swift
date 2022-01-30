//
//  ItemsImageTableViewCell.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class ItemsImageTableViewCell: UITableViewCell {

    @IBOutlet weak var itemsImageView : UIImageView!
    @IBOutlet weak var itemName : UILabel!
    @IBOutlet weak var itemPrice : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindItemInfoToUI(item : ItemModel?){
        self.itemsImageView.image = UIImage(named : item?.itemImage ?? "")
        self.itemName.text = item?.itemName
        self.itemPrice.text = "\(String(item?.itemPrice ?? 0.0)) MMK"
    }
}
