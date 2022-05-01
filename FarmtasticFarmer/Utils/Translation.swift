//
//  Translation.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 30.4.2022.
//

import Foundation
import SwiftUI

//a helper to translate all the Strings in the app to reduce re-declaring variable language in every screen
struct Translation {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    init() {}
    
    init(translatedLanguage: Language) {
        self.language = translatedLanguage
    }
    
    func translateLanguage(lang: String) -> String {
        switch lang {
        case "english":
            return "english".localized(language: language)
        case "finnish":
            return "finnish".localized(language: language)
        case "vietnamese":
            return "vietnamese".localized(language: language)
        default:
            return "english".localized(language: language)
        }
    }
    
    func translateLanguage(month: String) -> String {
        switch month {
        case "january":
            return "january".localized(language: language)
        case "february":
            return "february".localized(language: language)
        case "march":
            return "march".localized(language: language)
        case "april":
            return "april".localized(language: language)
        case "may":
            return "may".localized(language: language)
        case "june":
            return "june".localized(language: language)
        case "july":
            return "july".localized(language: language)
        case "august":
            return "august".localized(language: language)
        case "september":
            return "september".localized(language: language)
        case "october":
            return "october".localized(language: language)
        case "november":
            return "november".localized(language: language)
        case "december":
            return "december".localized(language: language)
        default:
            return ""
        }
    }
    
    
    var Login: String {
        return "login".localized(language: language)
    }
    
    var Apply: String {
        return "apply".localized(language: language)
    }
    
    var Search: String {
        return "search".localized(language: language)
    }
    
    var Loading: String {
        return "loading".localized(language: language)
    }
    
    var Results: String {
        return "results".localized(language: language)
    }
    
    var Update : String {
        return "update".localized(language: language)
    }
    
    var Delete : String {
        return "delete".localized(language: language)
    }
    
    var Save: String {
        return "save".localized(language: language)
    }
    
    var Add : String {
        return "add".localized(language: language)
    }
    
    var Clear : String {
        return "clear".localized(language: language)
    }
    
    var Dismiss: String {
        return "dismiss".localized(language: language)
    }
    
    var Meat: String {
        return "meat".localized(language: language)
    }
    
    var Fruit: String {
        return "fruit".localized(language: language)
    }
    
    var Vegetables: String {
        return "vegetables".localized(language: language)
    }
    
    var EggDairy: String {
        return "eggDairy".localized(language: language)
    }
    
    var Statistics: String {
        return "statistics".localized(language: language)
    }
    
    var StatisticsMonthly: String {
        return "statistics.monthly".localized(language: language)
    }
    
    var StatisticsYearly: String {
        return "statistics.yearly".localized(language: language)
    }
    
    var RevenueOverview: String {
        return "statistics.revenueOverview".localized(language: language)
    }
    
    var TotalOrders: String {
        return "statistics.totalOrders".localized(language: language)
    }
    
    var SelectYear: String {
        return "statistics.selectYear".localized(language: language)
    }
    
    var SelectMonth: String {
        return "statistics.selectMonth".localized(language: language)
    }
    
    var NoData: String {
        return "statistics.noData".localized(language: language)
    }
    
    var Product: String {
        return "product".localized(language: language)
    }
    
    var AllCategories: String {
        return "product.allCategories".localized(language: language)
    }
    
    var AddProduct: String {
        return "product.addProduct".localized(language: language)
    }
    
    var ProductDetails: String {
        return "product.details".localized(language: language)
    }
    
    var SearchResults: String {
        return "product.searchResults".localized(language: language)
    }
    
    var AvailableQuantity: String {
        return "product.availableQuantity".localized(language: language)
    }
    
    var Price: String {
        return "product.price".localized(language: language)
    }
    
    var Category: String {
        return "product.category".localized(language: language)
    }
    
    var HarvestDate: String {
        return "product.harvestDate".localized(language: language)
    }
    
    var ProductImage: String {
        return "product.productImage".localized(language: language)
    }
    
    var ProductLibrary: String {
        return "product.productLibrary".localized(language: language)
    }
    
    var ProductCamera: String {
        return "product.camera".localized(language: language)
    }
    
    var ProductInfo: String {
        return "product.productInfo".localized(language: language)
    }
    
    var ProductChooseCategory: String {
        return "product.chooseCategory".localized(language: language)
    }
    
    var ProductName: String {
        return "product.productName".localized(language: language)
    }
    
    var ProductEnterText: String {
        return "product.enterText".localized(language: language)
    }
    
    var ProductPrice: String {
        return "product.enterText".localized(language: language)
    }
    
    var ProductUnit: String {
        return "product.unit".localized(language: language)
    }
    
    var PricePerUnit: String {
        return "product.pricePerUnit".localized(language: language)
    }
    
    var ProductQuantity: String {
        return "product.quantity".localized(language: language)
    }
    
    var Profile: String {
        return "profile".localized(language: language)
    }
    
    var ProfileUsername: String {
        return "profile.username".localized(language: language)
    }
    
    var ProfilePassword: String {
        return "profile.password".localized(language: language)
    }
    
    var ProfileAddress: String {
        return "profile.address".localized(language: language)
    }
    
    var ProfilePhone: String {
        return "profile.phone".localized(language: language)
    }
    
    var LogoutButton: String {
        return "profile.logOutButton".localized(language: language)
    }
    
    var OrderList: String {
        return "profile.orderList".localized(language: language)
    }
    
    var PickupList: String {
        return "profile.pickupList".localized(language: language)
    }
    
    var ChangeLanguage: String {
        return "profile.changeLanguage".localized(language: language)
    }
    
    var ProfileUpdate: String {
        return "profile.update".localized(language: language)
    }
    
    var ProfileChangePassword: String {
        return "profile.changePassword".localized(language: language)
    }
    
    var ProfileOldPassword: String {
        return "profile.oldPassword".localized(language: language)
    }
    
    var ProfileNewPassword: String {
        return "profile.newPassword".localized(language: language)
    }
    
    var ProfileConfirmPassword: String {
        return "profile.confirmPassword".localized(language: language)
    }
    
    var ProfileNewName: String {
        return "profile.newName".localized(language: language)
    }
    
    var ProfileNewAddress: String {
        return "profile.newAddress".localized(language: language)
    }
    
    var ProfileNewPhone: String {
        return "profile.newPhone".localized(language: language)
    }
    
    var ProfilePickupPoint: String {
        return "profile.pickupPoint".localized(language: language)
    }
    
    var OrderDeliveryDate: String {
        return "order.deliveryDate".localized(language: language)
    }
    
    var ShowDirection: String {
        return "order.showDirection".localized(language: language)
    }
    
    var Order: String {
        return "order".localized(language: language)
    }
    
    var OrderPickupDate: String {
        return "order.pickupDate".localized(language: language)
    }
    
    var OrderPickupLocation: String {
        return "order.pickupLocation".localized(language: language)
    }
    
    var OrderDate: String {
        return "order.date".localized(language: language)
    }
    
    var OrderAddress: String {
        return "order.address".localized(language: language)
    }
    
    var SelectPickupDate: String {
        return "order.selectPickupDate".localized(language: language)
    }
    
    var OrderDirection: String {
        return "order.direction".localized(language: language)
    }
    
    var OrderNoData: String {
        return "order.noData".localized(language: language)
    }
}

