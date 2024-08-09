//
//  Extension.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import Foundation

extension String{
    func isPalindrome() -> Bool {
        let cleanString = self.replacingOccurrences(of: " ", with: "").lowercased()
        return cleanString == String(cleanString.reversed())
    }
}


import UIKit

extension UIImageView {
    
    func loadImage(from url: URL, placeholder: UIImage? = nil) {
        self.image = placeholder

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                    self.setNeedsLayout()
                }
            } else {
                print("Error loading image from URL: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
