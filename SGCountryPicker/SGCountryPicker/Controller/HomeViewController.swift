//
//  ViewController.swift
//  SGCountryPicker
//
//  Created by Yusata Infotech Private Limited on 09/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var countryPicker: CountryCodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryPicker.configure(controller: self) { selectedcountry in
            
        }
    }


}

