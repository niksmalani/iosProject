//
//  SecondVC.swift
//  SocialMedia
//
//  Created by Niks on 13/10/18.
//  Copyright © 2018 Niks. All rights reserved.
//

import UIKit
import GoogleSignIn

class SecondVC: UIViewController {

    @IBOutlet weak var emailtxt: UILabel!
    @IBOutlet weak var fullnametxt: UILabel!
    @IBOutlet weak var singoutbtn: UIButton!
    
    
    var email:String = String()
    var fullname:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singoutbtn.layer.cornerRadius=10
        print("hello")

        email = UserDefaults.standard.string(forKey:"Gemail")!
        fullname = UserDefaults.standard.string(forKey: "Gfullname")!
        
        emailtxt.text=email
        fullnametxt.text=fullname
     
    
    }
    
    @IBAction func GoogleSingOutClick(_ sender: Any) {
        
          GIDSignIn.sharedInstance().signOut()
          UserDefaults.standard.removeObject(forKey: "Gemail")
          UserDefaults.standard.removeObject(forKey: "Gfullname")
          navigationController?.popViewController(animated:true)
        
    }
    
  

}
