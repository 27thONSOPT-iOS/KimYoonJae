//
//  ViewController.swift
//  SOPT27_HW_WEEK2
//
//  Created by Yunjae Kim on 2020/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var soptLogoImage: UIImageView!
    @IBOutlet weak var soptBackground: UIImageView!
    @IBOutlet weak var profileEditButton: UIButton!
    
    @IBOutlet weak var yellowLine: UIImageView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var ppScrollView: UIScrollView!
    
    @IBOutlet var yellowBars: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setItems()
        ppScrollView.delegate = self
        
        
    }
    
    func setItems(){
        soptLogoImage.image = UIImage(named: "soptLogo.png")
        soptBackground.image = UIImage(named: "banner")
        profileEditButton.layer.cornerRadius = 5
        
        yellowLine.image = UIImage(named: "4")
        
        
        image1.image = UIImage(named: "juhyeok")
        image2.image = UIImage(named: "nayeon")
        image3.image = UIImage(named: "peace")
        image4.image = UIImage(named: "heesoo")
        image5.image = UIImage(named: "saeeun")
        image6.image = UIImage(named: "wool")
        image7.image = UIImage(named: "hansol")
        image8.image = UIImage(named: "minju")
        image9.image = UIImage(named: "younghun")
        image10.image = UIImage(named: "minguru")
        image11.image = UIImage(named: "yeonjeong")
        image12.image = UIImage(named: "junyeop")
        
        topButton.layer.cornerRadius = 25
        
        for yb in yellowBars {
            yb.image = UIImage(named: "yellowbar")
            
            
        }
        
        topButton.alpha = 0
        
    }
    
    
    
    @IBAction func topButtonAction(_ sender: Any) {
        
        ppScrollView.setContentOffset(CGPoint(x: 0, y: -ppScrollView.contentInset.top), animated: true)
        
        
    }
    
        
    
    

}

extension ViewController : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let curPos = scrollView.contentOffset
        
        if curPos.y > -scrollView.contentInset.top + 420 {
            topButton.alpha = 1
            
        }
        else{
            topButton.alpha = 0
        }
            
    }
    
    
    
}
