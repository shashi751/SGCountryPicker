//
//  Extensions.swift
// Storygeny
//
//  Created by Shashi Gupta on 27/01/22.
//

import Foundation
import UIKit
import SafariServices


class SG_ViewControllerLight:  UIViewController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

class SG_ViewControllerDark:  UIViewController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
}

class BaseClass: UIViewController{
    
    
}


extension UINavigationController {
    public func hasViewController(ofKind kind: AnyClass) -> UIViewController? {
        return self.viewControllers.first(where: {$0.isKind(of: kind)})
    }
}


extension UIViewController{
    
    func openUrlInSafari(urlstring:String){
        
        if let url = URL(string:urlstring) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

extension Dictionary {
    func jsonString(options: JSONSerialization.WritingOptions = []) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Error converting dictionary to JSON: \(error)")
            return nil
        }
    }
}

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    /*DispatchQueue.background(delay: 3.0, background: {
     // do something in background
     }, completion: {
     // when background job finishes, wait 3 seconds and do something in main thread
     })
     
     DispatchQueue.background(background: {
     // do something in background
     }, completion:{
     // when background job finished, do something in main thread
     })
     
     DispatchQueue.background(delay: 3.0, completion:{
     // do something in main thread after 3 seconds
     })*/
}

public extension Sequence {
    func group<Key>(by keyPath: KeyPath<Element, Key>) -> [Key: [Element]] where Key: Hashable {
        return Dictionary(grouping: self, by: {
            $0[keyPath: keyPath]
        })
    }
}

extension UIImage {
    func compressImage(compressionQuality: CGFloat) -> UIImage? {
        if let imageData = self.jpegData(compressionQuality: compressionQuality) {
            return UIImage(data: imageData)
        }
        return nil
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
