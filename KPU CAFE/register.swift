//
//  register.swift
//  BBB
//
//  Created by Jaskirat Mangat on 2020-10-16.
//

import Foundation
import UIKit
import HideKeyboardWhenTappedAround
import Firebase
import FirebaseAuth

class Register: UIViewController, UITextFieldDelegate {
    let user = Auth.auth().currentUser
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passwod: UITextField!
    @IBOutlet weak var phone: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        email.delegate = self
        passwod
            .delegate = self
        phone.delegate = self
        
        hideKeyboardWhenTappedAround()
    }
    
  
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name {
            textField.resignFirstResponder()
            email.becomeFirstResponder()
        } else if textField == email{
            textField.resignFirstResponder()
            passwod.becomeFirstResponder()
        }
    else if textField == passwod
    {
        textField.resignFirstResponder()
       phone.becomeFirstResponder()
    }
    
        return true
    }
    
    
    


    @IBAction func SubmitButtonPressed(_ sender: Any) {
        
        
        if name.text == "",email.text == "",passwod.text == "",phone.text == ""{
            
              let alert1 = UIAlertController(title: "Please Fill Mandatory fields", message: "", preferredStyle: .alert)

            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                 
                 
            }
            
            alert1.addAction(action)
            present(alert1, animated: true, completion: nil)
        }
        
        
        else if isValidEmail(email: email.text) == false{
            let alert1 = UIAlertController(title: "email not correct", message: "", preferredStyle: .alert)

            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                 
                 
            }
            
            alert1.addAction(action)
            present(alert1, animated: true, completion: nil)
            
            
        }
        
        else if isValidPassword(testStr: passwod.text) == false {
            
            let alert2 = UIAlertController(title: "Password must be at least 8 digits with one capital letter and a number", message: "", preferredStyle: .alert)

                       let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                            
                            
                       }
                       
                       alert2.addAction(action)
                       present(alert2, animated: true, completion: nil)
            

            
        }
            
        
        
        
        
        
        else if validatePhone(value: phone.text! ) == false{
            let alert = UIAlertController(title: "Please type in the correct phone number", message: "", preferredStyle: .alert)

            let action = UIAlertAction(title: "Ok", style: .default) { (action) in

                 
            }

            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
            
        else if passwod.text == ""{
                
                let alert2 = UIAlertController(title: "Please type in the password", message: "", preferredStyle: .alert)

                           let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                                
                                
                           }
                           
                           alert2.addAction(action)
                           present(alert2, animated: true, completion: nil)
                
                
                
            }
        
        
        
        
       
        
        
        else {
            
            
            if let email = email.text, let password = passwod.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error{
                    print(e)
                    
                }
                else{
                    

                    self.performSegue(withIdentifier: "registerToWelcome", sender: self)
                }
            
            }
            }

            
         
        }
    
        
        
        
        
    }
    
    
    
    
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
     
       // at least one uppercase,
          // at least one digit
          // at least one lowercase
          // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    
    
    
    
    func validatePhone(value: String) -> Bool {
               let PHONE_REGEX = "^\\d{9}$"
               let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
               let result = phoneTest.evaluate(with: value)
               return result
           }
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
}



extension UIView {
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func keyboardWillChange(_ notification: NSNotification){
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        let deltaY = endFrame.origin.y - beginningFrame.origin.y

        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
