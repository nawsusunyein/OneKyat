//
//  ViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import UIKit

class ViewController: UIRootViewController, UITextViewDelegate{

    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtViewTermsAndConditions: UITextView!
    
    @IBOutlet weak var btnCheckAgreement: UIButton!
    
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    var isCheckTermsConditions : Bool = true
    var isSatisfyRequestValues : Bool = false
    
    private var loginViewModel : LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAttributesForTextFields()
        self.setAttributesForButton()
        self.txtViewTermsAndConditions.delegate = self
        self.setAttributesForTermsAndConditions()
        self.setAddTargetOnTextfields()
        
        self.updateAgreementCheck()
        self.updateLoginCredentialsValue()
        self.updateErrorMessageForCredentials()
        self.goToHomeScreen()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar()
    }
    
    
    //To set bottom line,icon at textfields  and done button on top of keyboard
    func setAttributesForTextFields(){
        
        //show bottom line on textfields
        TextFieldDecoration.shared.showBottonLineOnTextField(textField : self.txtPhoneNumber, width : self.view.frame.width)
        TextFieldDecoration.shared.showBottonLineOnTextField(textField : self.txtPassword, width : self.view.frame.width)
       
        //show icon at left side of textfield
        TextFieldDecoration.shared.showIconLeftOnTextField(textField: self.txtPhoneNumber, iconName: IconName.phone)
        TextFieldDecoration.shared.showIconLeftOnTextField(textField: self.txtPassword, iconName: IconName.password)
        
        //show done button on toolbar of keyboard
        TextFieldDecoration.shared.showDoneButtonOnKeyboard(textField: self.txtPhoneNumber)
        TextFieldDecoration.shared.showDoneButtonOnKeyboard(textField: self.txtPassword)
        
        //show number pad for phone number
        self.txtPhoneNumber.keyboardType = .asciiCapableNumberPad
        
    }
    
    
    //To set button color and corner
    func setAttributesForButton(){
        //set button disabled color
        self.btnLogin.backgroundColor = ButtonColor.LoginButton.disabledColor
        
        //set button corner
        ButtonDecoration.shared.setButtonCorner(button: self.btnLogin, cornerRadius : 5.0)
        self.btnLogin.isEnabled = false
    }
    
    
    //To set hyperlink on textview
    func setAttributesForTermsAndConditions(){
        let path = WebsiteURL.onekyat
        let text = txtViewTermsAndConditions.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(path: path, fullString : text, subString: TextValue.terms)
        txtViewTermsAndConditions.textAlignment = .center
        txtViewTermsAndConditions.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            self.goToWebView(url : URL)
            return false
        }

    
    //To add target on textfields to trigger textfields
    func setAddTargetOnTextfields(){
        self.txtPhoneNumber.addTarget(self, action: #selector(checkTextFields), for: .editingChanged)
        self.txtPassword.addTarget(self, action: #selector(checkTextFields), for: .editingChanged)
    }
    
    
    //Trigger textfields value and send values to ViewModel to check
    @objc func checkTextFields(){
        
        self.loginViewModel.checkLoginCredentialsIsEmptyOrNot(phoneNumber: self.txtPhoneNumber.text, password: self.txtPassword.text)
        self.enableOrNotLoginButton()
    }
    
    
    //Call whenever user taps checkbox for terms & conditions and send values to ViewModel
    @IBAction func checkAgreeTermsAndConditions(_ sender: Any) {
        self.loginViewModel.checkAgreementOrNot(isCheck : self.isCheckTermsConditions)
        self.enableOrNotLoginButton()
    }
    
    
    //Bind values from VM and update checkbox icon according to user tapping
    func updateAgreementCheck(){
        
        self.loginViewModel.bindCheckAgreementValueLoginViewModelToVC = {
           
            self.isCheckTermsConditions = self.loginViewModel.isCheckAgreement
            self.btnCheckAgreement.setImage(UIImage(named: self.isCheckTermsConditions ? IconName.check : IconName.uncheck), for: .normal)
        }
        
    }
    
    
    //Bind values from VM and update credentials values are filled or not
    func updateLoginCredentialsValue(){
        self.loginViewModel.bindCheckCredentialsValueLoginViewModelToVC = {
            self.isSatisfyRequestValues = self.loginViewModel.isSatisifyCredentials
        }
    }
    
    
    //Check checkbox and credentials value are filled or not to enable or not login button
    func enableOrNotLoginButton(){
        if(isCheckTermsConditions && isSatisfyRequestValues){
            self.btnLogin.isEnabled = true
            self.btnLogin.backgroundColor = ButtonColor.LoginButton.enabledColor
        }else{
            self.btnLogin.isEnabled = false
            self.btnLogin.backgroundColor = ButtonColor.LoginButton.disabledColor
        }
    }
    
   
    //Send credentials when user taps on login button
    @IBAction func loginAction(_ sender: Any) {
        self.loginViewModel.validateCredentialsValue(phoneNumber: self.txtPhoneNumber.text ?? "", password: self.txtPassword.text ?? "")
    }
    
    
    //Bind error message values from VM according to validation checking
    func updateErrorMessageForCredentials(){
        self.loginViewModel.bindErrorMessageLoginViewModelToVC = {
            self.lblErrorMessage.text = self.loginViewModel.errorMessage
        }
    }
    
    
    //Go to home screen after home screen login successfully
    func goToHomeScreen(){
        self.loginViewModel.bindLoginSuccessLoginViewModelToVC = {
            let storyboard = UIStoryboard(name : StoryboardName.MainTabBarView, bundle : nil)
            let vc = storyboard.instantiateViewController(withIdentifier: ScreenIdentifier.MainTabBarViewIdentifier) as! MainTabBarViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //Go to web view to show terms and conditions
    func goToWebView(url : URL){
        let storyboard = UIStoryboard(name: StoryboardName.WebView, bundle: nil)
        let webViewVC = storyboard.instantiateViewController(withIdentifier: ScreenIdentifier.WebViewIdentifier) as! WebViewController
        webViewVC.urlToLoad = url
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
}
