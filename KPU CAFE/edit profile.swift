//
//  edit profile.swift
//  BBB
//
//  Created by Jaskirat Mangat on 2020-10-17.
//

import Foundation
import UIKit
import HideKeyboardWhenTappedAround


class edit: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var low: UIView!
    @IBOutlet weak var mid: UIView!
    @IBOutlet weak var top: UIView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        email.delegate = self
        password
            .delegate = self
        confirmPassword
            .delegate = self
        PhoneNumber.delegate = self
       hideKeyboardWhenTappedAround()
        
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           if textField == password{
               top.bindToKeyboard()
               low.bindToKeyboard()
            mid.bindToKeyboard()
           }
           else{
            
        }

       }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name {
            textField.resignFirstResponder()
            email.becomeFirstResponder()
        } else if textField == email{
            textField.resignFirstResponder()
            password.becomeFirstResponder()
        }
    else if textField == password
    {
        textField.resignFirstResponder()
       confirmPassword.becomeFirstResponder()
    }
        
    else if textField == confirmPassword
    {
        textField.resignFirstResponder()
       PhoneNumber.becomeFirstResponder()
    }
    
        return true
    }
    
    
    
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        
        
        if name.text == "",email.text == "",password.text == "",PhoneNumber.text == "",confirmPassword.text == ""{
            
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
        
        else if isValidPassword(testStr: password.text) == false {
            
            let alert2 = UIAlertController(title: "Password must be at least 8 digits with one capital letter and a number", message: "", preferredStyle: .alert)

                       let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                            
                            
                       }
                       
                       alert2.addAction(action)
                       present(alert2, animated: true, completion: nil)
            

            
        }
            
        
        
        
        
        
        else if validatePhone(value: PhoneNumber.text! ) == false{
            let alert = UIAlertController(title: "Please type in the correct phone number", message: "", preferredStyle: .alert)

            let action = UIAlertAction(title: "Ok", style: .default) { (action) in

                 
            }

            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
            
        else if password.text == ""{
                
                let alert2 = UIAlertController(title: "Please type in the password", message: "", preferredStyle: .alert)

                           let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                                
                                
                           }
                           
                           alert2.addAction(action)
                           present(alert2, animated: true, completion: nil)
                
                
                
            }
        else if password.text == confirmPassword.text {
                
//            let secondVC = storyboard?.instantiateViewController(withIdentifier: "profile") as! profile
//
//            show(secondVC, sender: self)
            self.performSegue(withIdentifier: "profile", sender: self)
                
            }
        
        
        
        
       
        
        
        else {
        
            
            
            let alert2 = UIAlertController(title: "Password do not match", message: "", preferredStyle: .alert)

                       let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                            
                            
                       }
                       
                       alert2.addAction(action)
                       present(alert2, animated: true, completion: nil)
            
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
               let PHONE_REGEX = "^\\d{10}$"
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
