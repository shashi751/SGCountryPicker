//
//  ViewEmpty.swift
//  Express buddy
//
//  Created by Shashi Gupta on 06/06/23.
//
import UIKit

class ViewEmpty: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewImage: UIImageView!
    
    //MARK: - Variables
    var controller:UIViewController?
    var message = String()
    
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
        Bundle.main.loadNibNamed("ViewEmpty", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    
    func configure(controller:UIViewController, message:String, title:String = String(), image:String = ""){
        
        self.controller = controller
        self.message = message
        
        self.lblMessage.text = self.message
        self.lblTitle.text = title
        self.imgViewImage.image = UIImage(named: image)
        
        if image == ""{
            self.imgViewImage.isHidden = true
        }
        
        
    }
    
    func updateUI(){
        
        
    }
 
}

