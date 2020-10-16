//
//  LoginVC.swift
//  SOPT_WEEK1_HW
//
//  Created by Yunjae Kim on 2020/10/15.
//

import UIKit

class LoginVC: UIViewController {
  
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var delegate : PartNameDeleagte?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login"
        
        // Do any additional setup after loading the view.
    }
    func setTextFields(part : String, name : String){
        self.partTextField.text = part
        self.nameTextField.text = name
        
    }

    @IBAction func loginButtonAction(_ sender: Any) {

        delegate?.setPartName(part: self.partTextField.text!, name: self.nameTextField.text!)

        self.dismiss(animated: true, completion: nil)
        
        
     
        
    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignupVC") as? SignupVC else {return}
        
        nextVC.navigationItem.title = "Sign Up"
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.autoLoginDelegate = self
  
    }
    
    
}

extension LoginVC : PartNameDeleagte {
    func setPartName(part: String, name: String) {
        UIView.animate(withDuration: 2.0, animations: {
            self.setTextFields(part: part, name: name)
            
            
        },completion: {_ in
            self.loginButtonAction(self)
        })
        
//        loginButtonAction(self)
        
        
    }
    
    
    
}
