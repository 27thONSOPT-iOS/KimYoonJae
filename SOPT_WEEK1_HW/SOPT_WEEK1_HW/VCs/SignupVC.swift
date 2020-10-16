//
//  SignupVC.swift
//  SOPT_WEEK1_HW
//
//  Created by Yunjae Kim on 2020/10/16.
//

import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var autoLoginDelegate : PartNameDeleagte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func signupButtonAction(_ sender: Any) {
        autoLoginDelegate?.setPartName(part: partTextField.text!, name: nameTextField.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
