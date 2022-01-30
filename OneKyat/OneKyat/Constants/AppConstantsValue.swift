//
//  AppConstantsValue.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation

struct IconName{
    public static let phone = "phonenumber"
    public static let password = "password"
    public static let logout = "logout"
    public static let check = "check"
    public static let uncheck = "uncheck"
}

struct WebsiteURL{
    public static let onekyat = "https://www.onekyat.com"
}

struct ScreenTitle{
    public static let home = "Home"
    public static let termsAndConditions = "Terms and Conditions"
}

struct TextValue{
    public static let terms = "Terms & Conditions"
    public static let kyat = "MMK"
    public static let prefixSign = "@"
    public static let errLoginCredentialsWrong = "Credentials Value is not correct"
    public static let notLogin = "0"
    public static let loggedIn = "1"
    public static let samepleTime = "2 weeks ago"
    
    
}

struct CredentialsKey{
    public static let phone = "09420000001"
    public static let password = "password_123$#"
}

struct Keys{
    public static let isLogged = "isLogged"
}

struct ScreenIdentifier{
    public static let WebViewIdentifier = "WebViewIdentifier"
    public static let MainTabBarViewIdentifier = "MainTabBarController"
    public static let SliderViewIdentifier = "sliderCell"
    public static let AdvertismentListViewIdentifier = "AdsTableViewCell"
    public static let AdvertisementDetailsViewIdentifier = "AdsItemDetailsIdentifier"
    public static let AdvertisementCollectionViewIdentifier = "adsCollectionView"
    public static let ItemImageViewIdentifier = "ItemsDetailsImageIdentifier"
    public static let ProfileImageViewIdentifier = "ItemsSellerProfileIdentifier"
    public static let ItemDescriptionViewIdentifier = "ItemsDescriptionIdentifier"
}

struct StoryboardName{
    public static let WebView = "webview"
    public static let MainTabBarView = "MainTabBar"
    public static let AdsDetailsView = "AdsItemDetails"
}

struct TableViewCellXib{
    public static let SliderView = "SliderTableViewCell"
    public static let AdvertisementListView = "AdvertisementTableViewCell"
    public static let AdvertisementCollectionListView = "AdsItemCollectionViewCell"
    public static let ItemsImageView = "ItemsImageTableViewCell"
    public static let ProfileImageView = "ItemsSellerProfileTableViewCell"
    public static let ItemsDescriptionView = "ItemsDescriptionTableViewCell"
}

enum ValidationError : LocalizedError{
    case isValueEmptyOrInvalid
    case valueIncludeString
    case valuePasswordTooShort
    case valuePasswordTooLong
    case valuePhoneTooShort
    case valuePhoneTooLong
    case emailInvalid
    case valueInclueNumber
    
    var errorDescription: String?{
        switch self{
        case .isValueEmptyOrInvalid : return "Value is being empty or invalid"
        case .valueIncludeString : return "Phone number can contain only numbers"
        case .valueInclueNumber : return "Password should not include only number.Should also include characters and special characters"
        case .valuePasswordTooShort: return "Password is too short"
        case .valuePasswordTooLong: return "Password is too long"
        case .valuePhoneTooLong : return "Phone number is too long"
        case .valuePhoneTooShort : return "Phone number is too short"
        case .emailInvalid: return "Email is invalid"
        }
    }
}
