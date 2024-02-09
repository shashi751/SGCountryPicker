//
//  AppCountryHelper.swift
//  Storygeny
//
//  Created by Shashi Gupta on 21/11/23.
//

import Foundation
import UIKit

//MARK: - GLOBAL VARIABLES
let SB_Country = UIStoryboard(name: "SB_Country", bundle: nil)

//MARK: - HELPER CLASS
class AppCountryHelper: NSObject {
    
    //MARK: - VARIABLES
    private var controller=UIViewController()
    
    //MARK: - INITILIERS
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    //MARK: - FUNCTIONS
    func push(callback: @escaping((_ selectedCountry:AppCountryModel) -> Void)){
        
        if let vc = SB_Country.instantiateViewController(withIdentifier:"AppCountryViewController") as? AppCountryViewController{
            vc.getSelectedCountry { selectedCountry in
                callback(selectedCountry)
            }
            self.controller.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
