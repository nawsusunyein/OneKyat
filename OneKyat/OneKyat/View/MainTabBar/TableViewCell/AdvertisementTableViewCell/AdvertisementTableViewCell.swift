//
//  AdvertisementTableViewCell.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: CustomDelegate?
    var itemList : [ItemModel] = [ItemModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(itemList : [ItemModel]){
        self.itemList = itemList
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.setLayout()
        self.registerCollectionViewCell()
    }
    
    
    //Register collection view cell nib
    func registerCollectionViewCell(){
        let nibName = UINib(nibName:"AdsItemCollectionViewCell", bundle: nil)
        self.collectionView.register(nibName, forCellWithReuseIdentifier: "adsCollectionView")
    }
   
    
    //Set flow layout for collection view cell width and height
    func setLayout() {
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            let width = (UIScreen.main.bounds.size.width / 2)
            flowLayout.itemSize = CGSize(width: width, height: 205)
            
            flowLayout.minimumLineSpacing = 0
            flowLayout.minimumInteritemSpacing = 0
            
            self.collectionView.setCollectionViewLayout(flowLayout, animated: true)
        }
}

extension AdvertisementTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adsCollectionView", for: indexPath) as! AdsItemCollectionViewCell
        cell.bindDataToUI(item: self.itemList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("index : \(indexPath.row)")
        let selectedItem = self.itemList[indexPath.row]
        delegate?.didSelectItem(selectedItem: selectedItem)
        
    }
    
}

extension AdvertisementTableViewCell : CustomDelegate{
    func didSelectItem(selectedItem: ItemModel) {
        delegate?.didSelectItem(selectedItem: selectedItem)
    }
}

protocol CustomDelegate: class {
    func didSelectItem(selectedItem : ItemModel)
}
