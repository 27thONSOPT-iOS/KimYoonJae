//
//  SignUpVC.swift
//  SOPT_SEM_WEEK6
//
//  Created by Yunjae Kim on 2020/11/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let userName = nickNameTextField.text else{
            return
        }
        
        AuthService.shared.signUp(email: email, password: password, userName: userName) {  networkResult -> Void in
            switch networkResult {
            case .success(let data) :
                if let signupData = data as? SignUpData{
                    self.simpleAlert(title: "회원가입 성공", message: "\(signupData.userName)님 회원가입 성공!")
                    UserDefaults.standard.set(signupData.userName, forKey: "userName")
                    
                    
                }
            case .requestErr(let msg) :
                if let message = msg as? String {
                    self.simpleAlert(title: "회원가입 실패", message: message)
                }
                
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverERr")
            case .networkFail :
                print("networkFail")
            default :
                print("머지?")
            
            }
            
            
        }
        
        
        
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    


}
