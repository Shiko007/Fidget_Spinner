//
//  ColorPicker.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 21.03.21.
//
//Original author: marchinarm https://gist.github.com/marchinram/3675efc96bf1cc2c02a5

import UIKit

extension UIImage {
    subscript (x: Int, y: Int) -> UIColor? {
        guard x >= 0 && x < Int(size.width) && y >= 0 && y < Int(size.height),
            let cgImage = cgImage,
            let provider = cgImage.dataProvider,
            let providerData = provider.data,
            let data = CFDataGetBytePtr(providerData) else {
            return nil
        }

        let numberOfComponents = 4
        let pixelData = ((Int(size.width) * y) + x) * numberOfComponents

        let r = CGFloat(data[pixelData]) / 255.0
        let g = CGFloat(data[pixelData + 1]) / 255.0
        let b = CGFloat(data[pixelData + 2]) / 255.0
        let a = CGFloat(data[pixelData + 3]) / 255.0

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
