//
//  billing.swift
//  KPU CAFE
//
//  Created by Jaskirat Mangat on 2021-03-28.

import UIKit
import Firebase
import FirebaseDatabase
class resultViewController: UIViewController {
    var ref: DatabaseReference!
    let user = Auth.auth().currentUser
    var uid : String = ""
    var pizz: Int = 0
    var coff: Int = 0
    var burger: Int = 0
    var total: Int = 0
    var po: Int = 0
    var Reg : Int=0
    var  pou: Int = 0

    var  sand: Int = 0
    
    var tax: Int = 0
    var totalFinal: Int = 0
    @IBOutlet weak var san: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var selectTime: UIStepper!
    @IBOutlet weak var finallyyy: UILabel!
    @IBOutlet weak var reciept: UILabel!
    @IBOutlet weak var totalf: UILabel!
    @IBOutlet weak var taxx: UILabel!
    @IBOutlet weak var pout: UILabel!
    @IBOutlet weak var ca: UILabel!
    @IBOutlet weak var pop: UILabel!
    @IBOutlet weak var co: UILabel!
    @IBOutlet weak var p: UILabel!
    @IBOutlet weak var bur: UILabel!
    var  cap: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        selectTime.wraps = true
        selectTime.autorepeat = true
        selectTime.maximumValue = 10
        ref = Database.database().reference()
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
            uid = user.uid
           
        
        }
        
        
        
        ref.child("BURGER").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                burger = (value!)
                bur.text = String(burger)
            }
            
            else{
                
            }
            }
        )
        ref.child("PIZZA").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                pizz = (value!)
                p.text = String(pizz
                )
            }
            
            else{
                
            }
            }
        )
        ref.child("COFFEE").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                coff = (value!)
                co.text = String(coff
                )
            }
            
            else{
                
            }
            }
        )
        ref.child("POP").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                po = (value!)
                pop.text = String(po)
            }
            
            else{
                
            }
            }
        )
        ref.child("POUTINE").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                pou = (value!)
                pout.text = String(pou)
            }
            
            else{
                
            }
            }
        )
        ref.child("SANDWICH").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                sand = (value!)
                san.text = String(sand)
            }
            
            else{
                
            }
            }
        )
        ref.child("CAP").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
            let value = snapshot.value as? Int
            
            if value != nil{
                cap = (value!)
                ca.text = String(cap)
            }
            
            else{
                
            }
            }
        )
        
//        total = pizz + coff + burger + po + pou + cap
//        tax = Int(0.07)*total
//        totalFinal = total + tax
//        print(totalFinal)
//        taxx.text = "$"+String(tax)
//        totalf.text = "$"+String(totalFinal)
        
    }
    
    
    @IBAction func timeChanged(_ sender: UIStepper) {
        
        Time.text = Int(sender.value).description
    }
    
    @IBAction func BILL(_ sender: UIButton) {
        
        
        self.ref.child("ACTIVITY").child(uid).setValue(1)
        var val1: Int = 0
        var val2: Int = 0
        var val3: Int = 0
        var val4: Int = 0
        var val5: Int = 0
        var val6: Int = 0
        var val7: Int = 0
        var val8: Int = 0
        var val9: Int = 0
        var val10: Int = 0
        
        val1 = Int(bur.text!) ?? 0
        val2 = Int(p.text!) ?? 0
        val3 = Int(pop.text!) ?? 0
        val4 = Int(co.text!) ?? 0
        val5 = Int(ca.text!) ?? 0
        val6 = Int(pout.text!) ?? 0
        val7 = Int(san.text!) ?? 0
val8 = val1 + val2 + val3 + val4
       val9 = val5 + val6 + val7
        val10 = val8 + val9
        print(val10)
        reciept.text = "Confirmation has been sent"
        email.text = "to the customer's e-mail address."
    }
    

}
