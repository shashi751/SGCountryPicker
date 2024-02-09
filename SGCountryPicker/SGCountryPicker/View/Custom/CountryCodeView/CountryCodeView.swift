//
//  CountryCodeView.swift
//  Storygeny
//
//  Created by Shashi Gupta on 04/09/23.
//

import UIKit

class CountryCodeView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnCountryPicker: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblCountryCode: UILabel!
    
    //MARK: - Variables
    var controller:UIViewController?
    var selectedCountry = AppCountryModel(name: "United States", flag: "🇺🇸", code: "US", phoneCode: "1")
    private var selectedCountryCallBack : ((_ selectedcountry : AppCountryModel) -> Void)?
    
    //MARK: - Internal Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: - Private functions
    private func commonInit(){
        Bundle.main.loadNibNamed("CountryCodeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    
    func configure(controller:UIViewController, background:UIColor = .white, callback:@escaping ((_ selectedcountry : AppCountryModel) -> Void)){
        
        self.selectedCountryCallBack = callback
        self.selectedCountryCallBack?(self.selectedCountry)
        self.viewContainer.backgroundColor = background
        self.controller = controller
        self.updateUI()
      
    }
    
    func updateUI(){
        
        self.lblCountryCode.text = "\(self.selectedCountry.flag) +\(self.selectedCountry.phoneCode)  "
    }
    
    @IBAction func countryPicker(_ sender: UIButton) {
        
        guard let con = self.controller else{
            return
        }
        
        AppCountryHelper(controller: con).push { [weak self] selectedCountry in
            
            guard let strongSelf = self else{
                return
            }
            strongSelf.selectedCountry = selectedCountry
            strongSelf.selectedCountryCallBack?(selectedCountry)
            DispatchQueue.main.async {
                strongSelf.updateUI()
                
            }
        }
        /*if let nav = con.navigationController{
            countryPickerView.showCountriesList(from: nav)
        }*/
        
    }
 
}
