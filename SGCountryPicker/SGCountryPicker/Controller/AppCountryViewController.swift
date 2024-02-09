//
//  AppCountryViewController.swift
//  Storygeny
//
//  Created by Shashi Gupta on 21/11/23.
//

import UIKit

class AppCountryViewController: UIViewController {

    // MARK: - IBOUTLET
    @IBOutlet weak var viewTopNav: ViewTopNav!
    @IBOutlet weak var tvCountries: UITableView!
    @IBOutlet weak var tfSearch: UITextField!
    
    // MARK: - VARIABLE
    private var appCountryViewModel : AppCountryViewModel = AppCountryViewModel()
    private var apiCallTimer: DispatchSourceTimer?
    private var selectedCountry:( (_ selectedCountry:AppCountryModel) -> Void)?
    
    // MARK: - INTERNAL FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavBar()
        
        self.configureTableView()
        
        self.configureTextField()
        
        self.bindAppCountryViewModelDataInUI()
        
    }
    
    // MARK: - EXTERNAL FUNCTIONS
    private func bindAppCountryViewModelDataInUI(){
        
        self.appCountryViewModel.bindAppCountryModelToController = { [weak self] in
            
            guard let strongSelf = self else{
                return
            }
            DispatchQueue.main.async {
                strongSelf.tvCountries.reloadData()
                strongSelf.showHideEmptyData()
            }
        }
        
        self.appCountryViewModel.bindErrorMessageToController = { [weak self] in
            
            guard let strongSelf = self else{
                return
            }
            
            DispatchQueue.main.async {
                
                strongSelf.presentAlertWithTitle(title: "Error", message: strongSelf.appCountryViewModel.errorMessage, options: "Ok") { value in
                    
                }
            }
        }
        
    }
    
    private func showHideEmptyData(){
        
        if self.appCountryViewModel.countries.isEmpty{
            
            let emptyView = ViewEmpty()
            emptyView.frame = self.tvCountries.frame
            emptyView.configure(controller: self, message: "Sorry, no matching countries", image: "no_search_result")
            self.tvCountries.backgroundView = emptyView
        }
        else{
            self.tvCountries.backgroundView = nil
        }
        
    }
    
    func getSelectedCountry(callback: @escaping ((_ selectedCountry:AppCountryModel) -> Void)){
        self.selectedCountry = callback
    }
    
    // MARK: - ACTION FUNCTIONS
    
}

// MARK: - UITABLEVIEW DELEGATE AND DATASOURCE FUNCTIONS
extension AppCountryViewController{
    
    func configureNavBar(){
        self.viewTopNav.configure(controller: self)
    }
}

extension AppCountryViewController : UITableViewDelegate,UITableViewDataSource{
    
    func configureTableView(){
       
        self.tvCountries.delegate = self
        self.tvCountries.dataSource = self
        
        self.tvCountries.register(UINib.init(nibName: AppCountryCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: AppCountryCell.reusableIdentifier)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appCountryViewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: AppCountryCell.reusableIdentifier, for: indexPath) as? AppCountryCell{
            
            cell.selectionStyle = .none
            
            let country = self.appCountryViewModel.countries[indexPath.row]
            cell.setData(country: country)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedCountry?(self.appCountryViewModel.countries[indexPath.row])
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
       
    }
    
  
}


extension AppCountryViewController : UITextFieldDelegate{
    
    func configureTextField(){
        self.tfSearch.delegate = self
        self.tfSearch.clearButtonMode = .whileEditing
        self.tfSearch.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                                  for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        // Cancel the previous timer if it exists
        apiCallTimer?.cancel()
        
        // Create a new timer with a delay of, for example, 0.5 seconds
        apiCallTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        apiCallTimer?.schedule(deadline: .now() + 0.5) // Adjust the delay as needed
        
        apiCallTimer?.setEventHandler { [weak self] in
            // Perform the API call here
            self?.performAPICall()
            
            // Invalidate the timer to release it
            self?.apiCallTimer?.cancel()
        }
        
        // Start the timer
        apiCallTimer?.resume()
        
        
    }
    
    func performAPICall() {
        // Your API call logic here
        DispatchQueue.main.async {
            let searchText = self.tfSearch.text ?? ""
            self.appCountryViewModel.searchCountry(key: searchText)
        }
    }
    
}
