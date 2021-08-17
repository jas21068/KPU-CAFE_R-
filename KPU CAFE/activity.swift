//
//  activity.swift
//  BBB
//
//  Created by Jaskirat Mangat on 2020-11-04.
import Foundation
import UIKit
import HideKeyboardWhenTappedAround
import Firebase
import FirebaseDatabase
import FirebaseCore
import CoreData

class activity: UIViewController, UITextFieldDelegate, UITableViewDelegate  {
   
    
   
    
    
    @IBOutlet weak var statuss: UIImageView!
    var ref: DatabaseReference!
    @IBOutlet weak var tableview: UITableView!
    var names: [String] = []
    var det: [String] = []
    var people: [NSManagedObject] = []
    let user = Auth.auth().currentUser
    var uid : String = ""
    var Reg : Int=0
//    let date = Date()
//    let format = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
            uid = user.uid
           
        
        }
        
        tableview.dataSource = self
        tableview.delegate = self
//
//        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let formattedDate = format.string(from: date)
       
                tableview.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        ref = Database.database().reference()
        
       
        
        let lime = Timer.self
        let lime1 = Timer.self
        let lime2 = Timer.self
        let lime3 = Timer.self

        
        
        lime2.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] lime2 in
            ref.child("ACTIVITY").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
                let value = snapshot.value as? Int
               
                if let Regg = value{
                    Reg = value!
                }
                
                else{
                    
                }
            }
            )
            let date = Date()
            let format = DateFormatter()
            
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formattedDate = format.string(from: date)
            
            if self.Reg == 0{
                
                
                lime3.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] lime3 in
                    
                    if self.Reg == 1{
                        self.names.insert  ("NEW ORDER AT----->"+formattedDate, at:0)
                           
                           self.tableview.reloadData()
                      
                }
                    
                    lime3.invalidate()
            }
              
            }
            
            
        }
        
        
        

        lime.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] lime in
            ref.child("ACTIVITY").child(uid).observeSingleEvent(of: .value, with: { [self] (snapshot) in
                let value = snapshot.value as? Int
                if let Regg = value{
                    Reg = value!
                }
                
                else{
                    
                }
            }
            )
            let date = Date()
            let format = DateFormatter()
            
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formattedDate = format.string(from: date)
            
            if self.Reg == 1{
    


                lime1.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] lime1 in
                    
                    if self.Reg == 0{
                        self.names.insert("NEW ORDER at----->"+formattedDate, at:0)
                           self.tableview.reloadData()
                      
                }
                    
                    lime1.invalidate()
            }
//                lime.invalidate()
            }
       
        }
        
        
        
       

        

    
    
    
    
    }
    
    
    
    
    
  
    
}

    

    
    


// MARK: - UITableViewDataSource
extension activity: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    
    return names.count
   
  }
   
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath)
                 -> UITableViewCell {

    let cell =
      tableView.dequeueReusableCell(withIdentifier: "cell",
                                    for: indexPath)
    
    
    
    cell.textLabel?.text = names[indexPath.row]
    cell.detailTextLabel?.text = names[indexPath.row]
    return cell
  }
    
}

