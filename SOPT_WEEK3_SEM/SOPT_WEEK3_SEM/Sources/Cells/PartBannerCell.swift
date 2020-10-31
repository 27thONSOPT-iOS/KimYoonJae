//
//  PartBannerCell.swift
//  SOPT_WEEK3_SEM
//
//  Created by Yunjae Kim on 2020/10/31.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    static let identifier = "PartBannerCell"
    @IBOutlet weak var partImageView: UIImageView!
    
    
    func setImage(imageName : String){
        partImageView.image = UIImage(named: imageName)
        
    }
    
    
    
    
    
}
