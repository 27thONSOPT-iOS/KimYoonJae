# 로그인 + 회원가입 화면 구현


<img src="../readmeImages/1st/mainView.png"  width="300" height = "500"/> <img src="../readmeImages/1st/loginView.png"  width="300" height = "500"/> <img src="../readmeImages/1st/signupView.png"  width="300" height = "500"/> 


# 도전과제

## 1. 로그인 시 텍스트 바꾸기

<img src="../readmeImages/1st/loginGif.gif"  width="400" height = "700"/>

### Delegate Pattern 이용

```swift 

protocol PartNameDeleagte {
    func setPartName(part : String, name : String)
    
    
}
```


PartNameDelegate protocol을 채택
```swift 

extension MainVC : PartNameDeleagte {
    
    func setPartName(part: String, name: String) {
        self.partNameLabel.text = part
        self.welcomeLabel.text = "\(name)님 환영합니다~~!!"
    }
}

```

아래의 코드로 실행
```swift 

@IBAction func loginButtonAction(_ sender: Any) {

    delegate?.setPartName(part: self.partTextField.text!, name: self.nameTextField.text!)

    self.dismiss(animated: true, completion: nil)
    
    
 
    
}
```


## 2. 회원가입 시 자동 로그인(로그인 뷰 거침)

<img src="../readmeImages/1st/signupGif.gif"  width="400" height = "700"/>


### 자동로그인 구현 방법

아래의 코드로 delgate 사용 (앞선 delegate와 같음)
```swift 

@IBAction func signupButtonAction(_ sender: Any) {
    autoLoginDelegate?.setPartName(part: partTextField.text!, name: nameTextField.text!)
    
    self.navigationController?.popViewController(animated: true)
}

```

LoginVC에서 자동 로그인 효과를 주기 위해 아래와 같은 에니메이션을 추가.
(애니메이션으로 딜레이를 줘서 LoginVC를 거치고 가게 만듬)
```swift 

extension LoginVC : PartNameDeleagte {
    func setPartName(part: String, name: String) {
        UIView.animate(withDuration: 2.0, animations: {
            self.setTextFields(part: part, name: name)
            
            
        },completion: {_ in
            self.loginButtonAction(self)
        })
    
        
    }
    
    
    
}

```

