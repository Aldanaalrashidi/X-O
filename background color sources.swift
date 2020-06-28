//
//  background color sources.swift
//  X-O
//
//  Created by tahani alrashidi on 6/27/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import Foundation
import UIKit
import GameKit

struct BackgroundColorSource {
    let colors = [
        UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0),
        UIColor(red: 222/255.0, green: 171/255.0, blue: 66/255.0, alpha: 1.0),
        UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0),
        UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0),
        UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0),
        UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0),
        UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0),
        UIColor(red: 198/255.0, green: 225/255.0, blue: 214/255.0, alpha: 1.0),
        UIColor(red: 231/255.0, green: 225/255.0, blue: 214/255.0, alpha: 1.0),
        UIColor(red: 231/255.0, green: 202/255.0, blue: 214/255.0, alpha: 1.0),
        UIColor(red: 209/255.0, green: 201/255.0, blue: 247/255.0, alpha: 1.0),
        UIColor(red: 191/255.0, green: 244/255.0, blue: 251/255.0, alpha: 1.0),
        UIColor(red: 219/255.0, green: 166/255.0, blue: 255/255.0, alpha: 1.0),
        UIColor(red: 178/255.0, green: 175/255.0, blue: 182/255.0, alpha: 1.0),
        UIColor(red: 55/255.0, green: 192/255.0, blue: 159/255.0, alpha: 1.0),
        UIColor(red: 134/255.0, green: 130/255.0, blue: 93/255.0, alpha: 1.0),
        UIColor(red: 230/255.0, green: 129/255.0, blue: 93/255.0, alpha: 1.0),
        UIColor(red: 127/255.0, green: 123/255.0, blue: 132/255.0, alpha: 1.0),
        UIColor(red: 85/255.0, green: 201/255.0, blue: 98/255.0, alpha: 1.0),
        UIColor(red: 50/255.0, green: 70/255.0, blue: 218/255.0, alpha: 1.0),
        UIColor(red: 156/255.0, green: 125/255.0, blue: 100/255.0, alpha: 1.0),
        UIColor(red: 137/255.0, green: 180/255.0, blue: 149/255.0, alpha: 1.0),
        UIColor(red: 242/255.0, green: 137/255.0, blue: 149/255.0, alpha: 1.0),
        UIColor(red: 153/255.0, green: 194/255.0, blue: 33/255.0, alpha: 1.0),
        UIColor(red: 35/255.0, green: 79/255.0, blue: 83/255.0, alpha: 1.0),
    ]

    func randomColor() -> UIColor {
        let colorIndex =
            GKRandomSource.sharedRandom().nextInt(upperBound: colors.count)
        return colors[colorIndex]
    }

}
