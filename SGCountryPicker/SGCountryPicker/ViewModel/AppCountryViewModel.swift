//
//  AppCountryViewModel.swift
//  Storygeny
//
//  Created by Shashi Gupta on 21/11/23.
//

import Foundation


class AppCountryViewModel : NSObject{
    
    //MARK: - VARIABLES
    private(set) var countries : [AppCountryModel] = [AppCountryModel](){
        didSet {
            self.bindAppCountryModelToController()
        }
    }
    
    private(set) var errorMessage : String = String() {
        didSet {
            self.bindErrorMessageToController()
        }
    }
    
    var bindErrorMessageToController : (() -> ()) = {}
    var bindAppCountryModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
        self.setCountries()
    }
    
    func setCountries(){
        self.countries = AppCountry().getCountries()
    }
    
    func searchCountry(key:String){
        
        let allCountries = AppCountry().getCountries()
        
        if key == ""{
            self.countries = allCountries
        }
        else{
            self.countries = allCountries.filter({$0.name.lowercased().contains(key.lowercased()) || $0.flag.lowercased().contains(key.lowercased()) || $0.phoneCode.lowercased().contains(key.lowercased())})
        }
    }
}

