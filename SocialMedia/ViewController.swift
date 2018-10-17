//
//  ViewController.swift
//  SocialMedia
//
//  Created by Niks on 13/10/18.
//  Copyright © 2018 Niks. All rights reserved.
//

import UIKit
import GoogleSignIn
import FacebookLogin

class ViewController: UIViewController,GIDSignInUIDelegate, GIDSignInDelegate{
    
    @IBOutlet weak var btnGoogleSingin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnGoogleSingin.layer.cornerRadius=10
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        if isKeyPresentInUserDefaults(key: "Gemail"){
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let VC = story.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
        
        
        
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    
    
    
    
    @IBAction func GoogleSiningClick(_ sender: Any) {
        
        
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
    @IBAction func FacebookSinoingClick(_ sender: Any) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn(readPermissions: [ReadPermission.publicProfile, ReadPermission.email], viewController: self) { loginResult in
            print(loginResult)
            let connection = GraphRequestConnection()
            connection.add(MyProfileRequest()) { response, result in
                switch result {
                case .success(let response):
                    print("Custom Graph Request Succeeded: \(response)")
                case .failed(let error):
                    print("Custom Graph Request Failed: \(error)")
                }
            }
            connection.start()

        }
//        loginManager.logIn([ReadPermission.publicProfile] , viewController: self) { loginResult in
//            switch loginResult {
//            case .Failed(let error):
//                print(error)
//            case .Cancelled:
//                print("User cancelled login.")
//            case .Success(let grantedPermissions, let declinedPermissions, let accessToken):
//                print("Logged in!")
//            }
//        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            
            UserDefaults.standard.set(email, forKey: "Gemail")
            UserDefaults.standard.set(fullName, forKey: "Gfullname")
            if isKeyPresentInUserDefaults(key: "Gemail"){
                let story = UIStoryboard.init(name: "Main", bundle: nil)
                let VC = story.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
                self.navigationController?.pushViewController(VC, animated: true)
            }
        }
    }
    
    
}


import FacebookCore

struct MyProfileRequest: GraphRequestProtocol {
    struct Response: GraphResponseProtocol {
        init(rawResponse: Any?) {
            // Decode JSON from rawResponse into other properties here.
        }
    }
    
    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "id, name"]
    var accessToken = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
}


