//
//  Music.swift
//  SOPT_WEEK3_SEM
//
//  Created by Yunjae Kim on 2020/10/31.
//

import Foundation
import UIKit


struct Music {
    
    var title : String
    var singer : String
    var albumImageName : String
    
    func makeAlbumImage() -> UIImage? {
        return UIImage(named: albumImageName)
    }
    
    
}
