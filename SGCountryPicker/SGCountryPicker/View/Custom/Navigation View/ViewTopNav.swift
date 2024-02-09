//
//  ViewTopNav.swift
// Storygeny
//
//  Created by Shashi Gupta on 17/08/22.
//

import UIKit

class ViewTopNav: UIView {

   
    //MARK: - IBOutlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    
    //MARK: - Variables
    var controller:UIViewController!
    
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
        Bundle.main.loadNibNamed("ViewTopNav", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    
    func configure(controller:UIViewController){
        self.controller = controller
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.controller.navigationController?.popViewController(animated: true)
    }
}
