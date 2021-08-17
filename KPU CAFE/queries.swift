//
//  queries.swift
//  KPU CAFE
//
//  Created by Jaskirat Mangat on 2021-03-29.
//

import UIKit
import Firebase
import FirebaseDatabase
class query: UIViewController {
    var ref: DatabaseReference!
    let user = Auth.auth().currentUser
    var uid : String = ""
 
    @IBOutlet weak var email: UILabel!
    var Reg : String = ""
    var Reg2 : String = ""
    var Reg3 : String = ""
    @IBOutlet weak var quey: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
            uid = user.uid
           
        
        }
        
        
        let time = Timer.self
        let time1 = Timer.self
        let time2 = Timer.self
        
        
        time1.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] time1 in
            
            ref.child("EMAIL").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
                let value = snapshot.value as? String
                
                if let ReggG = value{
                    Reg = value!
                    email.text = Reg
                }
                
                else{
                    
                }
                }
            )
            
           
            
            
          
            
        }
        
        
        
        time2.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] time1 in
            
            ref.child("QUERY").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
                let value = snapshot.value as? String
                
                if let ReggH = value{
                    Reg2 = value!
                    quey.text = Reg2
                }
                
                else{
                    
                }
                }
            )
            
           
            
            
         
            
        }
        
        
    }

    
    
    
}
