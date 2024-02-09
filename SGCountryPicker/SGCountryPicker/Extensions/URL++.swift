//
//  URL++.swift
//  Storygeny
//
//  Created by Shashi Gupta on 11/10/23.
//

import Foundation
import UIKit

extension URL{
    
    func getVideoSizeInMB() -> Double {
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: self.path)
            if let fileSize = attributes[.size] as? Int64 {
                // Convert bytes to megabytes
                let fileSizeInMB = Double(fileSize) / (1024 * 1024)
                return fileSizeInMB
            }
        } catch {
            print("Error getting video size: \(error)")
        }
        return 0
    }

}
