//
//  login.swift
//  BBB
//
//  Created by Jaskirat Mangat on 2020-10-16.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import HideKeyboardWhenTappedAround

class Login: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var email1: UITextField!
    
    @IBOutlet weak var pasword1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email1.delegate = self
        pasword1.delegate = self
        hideKeyboardWhenTappedAround()
        pasword1.isSecureTextEntry = true
        
    }

  
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email1 {
            textField.resignFirstResponder()
            pasword1.becomeFirstResponder()
        }
    
        return true
    }
    
    
    

    @IBAction func signInButtonPressed(_ sender: Any) {
        
        
        if isValidEmail(email: email1.text) == false{
            let alert1 = UIAlertController(title: "email not correct", message: "", preferredStyle: .alert)

            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                 
                 
            }
            
            alert1.addAction(action)
            present(alert1, animated: true, completion: nil)
            
            
        }
        else if isValidPassword(testStr: pasword1.text) == false {
            
            let alert2 = UIAlertController(title: "Password must be at least 8 digits with one capital letter and a number", message: "", preferredStyle: .alert)

                       let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                            
                            
                       }
                       
                       alert2.addAction(action)
                       present(alert2, animated: true, completion: nil)
            
        }
        
        else if isValidPassword(testStr: pasword1.text) == true  {
            if let email = email1.text, let password = pasword1.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let _ = user {
                    
                    self.dismiss(animated: true, completion: nil)
                }
                
            if let e = error{
                        print(e)
                let alert2 = UIAlertController(title: "Password not corect", message: "", preferredStyle: .alert)

                           let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                                
                                
                           }
                           
                           alert2.addAction(action)
                self.present(alert2, animated: true, completion: nil)
                
                    }
                    else{
                        

                        self.performSegue(withIdentifier: "afterSignIn", sender: self)
                    }
         
                
            }
            
            }
            
            
            
            
        }
        
        else{
            
            let alert2 = UIAlertController(title: "Password not corect", message: "", preferredStyle: .alert)

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
    
    
   
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "afterSignIn"{
//        _ = segue.destination as! HomeScreen
//
//
//
//    }

}
