//
//  Functions.swift
//  Detection Both
//
//  Created by Денис Андреев on 22.11.2019.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import Foundation

extension Float {
        static func random() -> Float{
            return Float(Float(arc4random()) / 0xFFFFFFFF)
        }
        
        static func random(_ min:Float,max:Float) -> Float{
            return Float.random() * (max-min)+min
        }
    }

