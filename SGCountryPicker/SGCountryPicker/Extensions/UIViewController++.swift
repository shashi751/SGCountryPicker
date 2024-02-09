//
//  UIViewController++.swift
// Storygeny
//
//  Created by Shashi Gupta on 27/01/22.
//

import Foundation
import UIKit


extension UIViewController{
    
    func presentControllerOverContext(presenting:UIViewController){
        
        presenting.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        presenting.definesPresentationContext = true
        presenting.providesPresentationContextTransitionStyle = true
        presenting.modalPresentationStyle = .overCurrentContext
        self.present(presenting, animated: false, completion: nil)
    }
    
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentActionSheetWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, option) in options.enumerated() {
            
            if option.lowercased() == "Cancel".lowercased(){
                alertController.addAction(UIAlertAction.init(title: option, style: .cancel, handler: { (action) in
                    completion(index)
                }))
            }
            else  if option.lowercased() == "delete".lowercased(){
                alertController.addAction(UIAlertAction.init(title: option, style: .destructive, handler: { (action) in
                    completion(index)
                }))
            }
            else
            {
                alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                    completion(index)
                }))
            }
        }
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentAlert(title: String = String(), message: String = String()){
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func pushUserAgreementScreen(){
        
        
    }
    
    func pushResetPasswordScreen(){
        
        
    }
    
    func topViewController() -> UIViewController? {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
            
        } else {
            
            return nil
            
        }
        
    }
}


