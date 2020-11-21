//
//  LogInVC.swift
//  SOPT_SEM_WEEK6
//
//  Created by Yunjae Kim on 2020/11/21.
//

import UIKit

class LogInVC: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    @IBAction func LogInButtonAction(_ sender: Any) {
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text else{
            return
        }
        
        
        AuthService.shared.signIn(email: email, password: password) { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data) :
                if let signInData = data as? SignInData{
                    self.simpleAlert(title: "로그인 성공", message: "\(signInData.userName)님 로그인 성공!")
                    UserDefaults.standard.set(signInData.userName, forKey: "userName")
                    
                    
                }
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "로그인 실패", message: message)
                }
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            
                
                
            
            }
            
            
            
        }
        
        
    }
    
    
    @IBAction func goToSignUp(_ sender: Any) {
        guard let vcName = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(identifier: "SignUpVC") as? SignUpVC else{
            return
        }
        vcName.modalPresentationStyle = .fullScreen
        self.present(vcName, animated: true, completion: nil)
        
    }
    
    
    
}
