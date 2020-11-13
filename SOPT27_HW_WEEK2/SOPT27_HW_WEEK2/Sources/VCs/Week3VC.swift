//
//  Week3VC.swift
//  SOPT27_HW_WEEK2
//
//  Created by Yunjae Kim on 2020/11/05.
//

import UIKit

class Week3VC: UIViewController {
    
    @IBOutlet weak var soptBackground: UIImageView!
    @IBOutlet weak var soptLogoImage: UIImageView!
    @IBOutlet weak var profileEditButton: UIButton!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    @IBOutlet weak var soptBackgroundTop: NSLayoutConstraint!
    
    var showHeader = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setItems()
        
        // Do any additional setup after loading the view.
    }
    
    
    func setItems(){
        
        soptLogoImage.image = UIImage(named: "soptLogo.png")
        soptBackground.image = UIImage(named: "banner")
        profileEditButton.layer.cornerRadius = 5
        
        profileCollectionView.dataSource = self
        profileCollectionView.delegate = self
        
        
        
    }
    
    
    
}


extension Week3VC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:                                                            ProfileCVC.identifier, for: indexPath) as? ProfileCVC else {
            return UICollectionViewCell()
        }
        
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableView", for: indexPath)
          
            
            return headerView
            
        default:
            assert(false)
        }
        
        
        
    }
    
    
    
    
}



extension Week3VC : UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 197)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 28, left: 24, bottom: 0, right: 24)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 420)
    }
    
    
    
    
    
    
    
}






extension Week3VC : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        soptBackgroundTop.constant = 0
//        soptLogoImage.alpha = 0
//        profileEditButton.alpha = 0
//
            
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.soptBackgroundTop.constant = 88
            self.soptLogoImage.alpha = 1
            self.profileEditButton.alpha = 1
        })
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        soptBackgroundTop.constant = 0
        soptLogoImage.alpha = 0
        profileEditButton.alpha = 0
    }
    
    
}
