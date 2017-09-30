//
//  LoginViewController.swift
//  MDB Socials
//
//  Created by Sam Rai on 9/26/17.
//  Copyright © 2017 Samanvi Rai. All rights reserved.
//

//go through swift style guides and edit

import UIKit
import Firebase

class LoginViewController: UIViewController {
    var enterUsername: UITextField!
    var enterPassword: UITextField!
    var dontHaveAnAcctLabel: UILabel!
    var signUpButton: UIButton!
    var logInPageLogo: UIImageView!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDataEntries()
        setUpButtons()
        setUpVisuals()
        
        //Check if a user is already signed in
        if FirebaseApp.auth()?.currentUser != nil {
            performSegue(withIdentifier: "toFeed", sender: self)
        }
    }
    func setUpVisuals() {
        logInPageLogo = UIImageView(frame: CGRect(x: view.frame.width * (50/375), y: view.frame.height * (124/667), width: 284, height: 179))
        logInPageLogo.contentMode = .scaleAspectFill
        logInPageLogo.image = #imageLiteral(resourceName: "mdbSocialsMainLogo")
        view.addSubview(logInPageLogo)
        
        dontHaveAnAcctLabel = UILabel(frame: CGRect(x: view.frame.width * (79/375), y: view.frame.height * (500/667), width: 150, height: 19))
        dontHaveAnAcctLabel.textColor = UIColor.lightGray
        dontHaveAnAcctLabel.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 15)
        dontHaveAnAcctLabel.text = "Don't have an account?"
        dontHaveAnAcctLabel.textAlignment = .left
        view.addSubview(dontHaveAnAcctLabel)
    }
    func setUpDataEntries() {
        enterUsername = UITextField(frame: CGRect(x: view.frame.width * 0.232, y: (413/667) * view.frame.height, width: 209, height: 34))
        enterUsername.backgroundColor = UIColor.lightGray
        enterUsername.attributedPlaceholder = NSAttributedString(string:"Username", attributes:[NSForegroundColorAttributeName: UIColor.white])
        enterUsername.adjustsFontSizeToFitWidth = true
        enterUsername.textAlignment = .center
        enterUsername.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "AppleSDGothicNeo-Medium"))
        enterUsername.minimumFontSize = 14.0
        enterUsername.layer.cornerRadius = 17
        enterUsername.textColor = UIColor.white
        self.view.addSubview(enterUsername)

        enterPassword = UITextField(frame: CGRect(x: view.frame.width * (87/375), y: (453/667) * view.frame.height, width: 209, height: 34))
        enterPassword.adjustsFontSizeToFitWidth = true
        enterPassword.backgroundColor = UIColor.lightGray
        enterPassword.layer.cornerRadius = 17
        enterPassword.textAlignment = .center
        enterPassword.attributedPlaceholder = NSAttributedString(string:"Password", attributes:[NSForegroundColorAttributeName: UIColor.white])
        enterPassword.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "AppleSDGothicNeo-Medium"))
        enterPassword.layer.masksToBounds = true
        enterPassword.textColor = UIColor.white
        enterPassword.isSecureTextEntry = true
        self.view.addSubview(enterPassword)
    }
    func setUpButtons() {
        signUpButton = UIButton(frame: CGRect(x: view.frame.width * (232/375) + 1, y: view.frame.height * (500/667), width: 49, height: 19))
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor.init(red: 37/255, green: 153/255, blue: 225/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font =  UIFont.init(name: "AppleSDGothicNeo-Medium", size: 15)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        loginButton = UIButton(frame: CGRect(x: view.frame.width * (154/375), y: view.frame.height * (544/667), width: 68, height: 31))
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font =  UIFont.init(name: "AppleSDGothicNeo-Regular", size: 25)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        view.addSubview(loginButton)
        
    }

    func signUpButtonClicked() {
        performSegue(withIdentifier: "toSignup", sender: self)
    }
    func loginButtonClicked() {
        let username = enterUsername.text!
        enterUsername.text = ""
        let password = enterPassword.text!
        enterPassword.text = ""
        FIRAuth.auth()?.signIn(withUsername: username, password: password, completion: { (user: FirebaseApp?, error) in
            if error == nil {
                self.performSegue(withIdentifier: "toFeed", sender: self)
            }
        })
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
