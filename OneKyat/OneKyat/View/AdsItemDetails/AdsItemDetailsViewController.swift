//
//  AdsItemDetailsViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class AdsItemDetailsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var adsViewModel : AdsViewModel = AdsViewModel()
    public var itemInfo : ItemModel?
    public var sellerInfo : SellerModel?
    
    public var idValue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTextFieldEvents()
        self.registerCell()
        self.setTextFieldAttributes()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    
    func registerTextFieldEvents(){
        self.textField.addTarget(self, action: #selector(textFieldEditChanged(_:)), for: .editingDidBegin)
    }
    
    
    @objc func textFieldEditChanged(_ textField : UITextField){
        print("here entered entered ")
    }
    
    
    @IBAction func callPhone(_ sender: Any) {
        CommonOperations.shared.callPhoneNumber(phoneNumer: self.sellerInfo?.sellerPhoneNumber ?? "")
    }
    
    //Register table view cells to show image and user profile and description
     func registerCell(){
        let cellItemsImage = UINib(nibName: TableViewCellXib.ItemsImageView, bundle: nil)
        self.tableView.register(cellItemsImage, forCellReuseIdentifier: ScreenIdentifier.ItemImageViewIdentifier)
        
        let cellSellerProfile = UINib(nibName: TableViewCellXib.ProfileImageView, bundle: nil)
        self.tableView.register(cellSellerProfile, forCellReuseIdentifier: ScreenIdentifier.ProfileImageViewIdentifier)
        
        
        let cellItemDescription = UINib(nibName: TableViewCellXib.ItemsDescriptionView, bundle: nil)
        self.tableView.register(cellItemDescription, forCellReuseIdentifier: ScreenIdentifier.ItemDescriptionViewIdentifier)
    }
    
    //Set textfield attributes
    func setTextFieldAttributes(){
        TextFieldDecoration.shared.showDoneButtonOnKeyboard(textField: self.textField)
        TextFieldDecoration.shared.showButtonOnRightSideOfTextfield(textField: self.textField)
        TextFieldDecoration.shared.setTextFieldCorner(textField: self.textField, corner : 20.0)
    }
    
    
    //Get Selected Item Info
    func getSelectedItemInfo(){
       
        self.adsViewModel.bindSelectedItemAdsViewModelToVC = {
            self.itemInfo = self.adsViewModel.selectedItem
            
            self.adsViewModel.bindSelectedSellerAdsViewModelToVC = {
                self.sellerInfo = self.adsViewModel.selectedSeller
                self.tableView.reloadData()
            }
            
        }
        
    }
        
}

extension AdsItemDetailsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cellItemsImage = tableView.dequeueReusableCell(withIdentifier: ScreenIdentifier.ItemImageViewIdentifier, for: indexPath) as! ItemsImageTableViewCell
            cellItemsImage.bindItemInfoToUI(item: self.itemInfo)
            return cellItemsImage
        }else if(indexPath.row == 1){
            let cellSellerProfile = tableView.dequeueReusableCell(withIdentifier: ScreenIdentifier.ProfileImageViewIdentifier,for: indexPath) as! ItemsSellerProfileTableViewCell
            cellSellerProfile.bindProfileInformation(sellerInfo: self.sellerInfo, itemUploadTime : TextValue.samepleTime)
            return cellSellerProfile
        }else{
            let cellItemDescription = tableView.dequeueReusableCell(withIdentifier: ScreenIdentifier.ItemDescriptionViewIdentifier, for: indexPath) as! ItemsDescriptionTableViewCell
            cellItemDescription.bindItemDescriptionToUI(itemDescription : self.itemInfo?.itemDescription ?? "")
            return cellItemDescription
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 250
        }else if(indexPath.row == 1){
            return 120
        }
        return UITableView.automaticDimension
    }
}
