//
//  AnimationVC.swift
//  SOPT27th_SEM4
//
//  Created by Yunjae Kim on 2020/11/07.
//

import UIKit

class AnimationVC: UIViewController {
    
    @IBOutlet weak var heartImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func animateButton(_ sender: Any) {
        
        UIView.animate(withDuration: 3.0, delay: 0.0, animations: {
            self.heartImageView.alpha = 0
            self.heartImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            
        }) { finished in
            UIView.animate(withDuration: 3.0, delay: 0.0, animations: {
                
                self.heartImageView.alpha = 1
                
            })
            
        }
        
        
    }
    
}
