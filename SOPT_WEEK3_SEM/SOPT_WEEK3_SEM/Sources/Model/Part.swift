//
//  Part.swift
//  SOPT_WEEK3_SEM
//
//  Created by Yunjae Kim on 2020/10/31.
//

import Foundation
import UIKit

struct Part{
    var imageName : String
    var partName : String
    
    func makeImage() -> UIImage? {
        
        return UIImage(named: imageName)
        
    }
    
}
