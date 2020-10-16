//
//  MainVC.swift
//  SOPT_WEEK1_HW
//
//  Created by Yunjae Kim on 2020/10/15.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var partNameLabel: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picture1.image = UIImage(named: "picture9")
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonAction(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC else {return}
        
        guard let navC = UINavigationController(rootViewController: loginVC) as? UINavigationController else {return}
        
        navC.modalPresentationStyle = .fullScreen
        self.present(navC, animated: true, completion: nil)
        
        loginVC.delegate = self
        
        
    }
    
    


}

extension MainVC : PartNameDeleagte {
    
    func setPartName(part: String, name: String) {
        self.partNameLabel.text = part
        self.welcomeLabel.text = "\(name)님 환영합니다~~!!"
    }
}
