//
//  ItemsSellerProfileTableViewCell.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class ItemsSellerProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var lblSellerName: UILabel!
    
    @IBOutlet weak var lblSellerId: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblItemUploadTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindProfileInformation(sellerInfo : SellerModel?,itemUploadTime : String){
        ImageDecoration.shared.setImageCircleCorner(imageView: self.profileImageView)
        self.profileImageView.image = UIImage(named: sellerInfo?.sellerImage ?? "")
        self.lblSellerName.text = sellerInfo?.sellerName
        self.lblSellerId.text = "@ \(sellerInfo?.sellerId ?? "")"
        self.lblLocation.text = sellerInfo?.sellerLocation
        self.lblItemUploadTime.text = itemUploadTime
    }
    
    
}
