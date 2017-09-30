//
//  SignupViewController.swift
//  MDB Socials
//
//  Created by Sam Rai on 9/26/17.
//  Copyright © 2017 Samanvi Rai. All rights reserved.
//

import UIKit
import Firebase
class SignupViewController: UIViewController {
    var mdbSocialsSignUpLogo: UIImageView!
    var cancelButton: UIButton!
    var namePromptImg: UIImageView!
    var usernamePromptImg: UIImageView!
    var passwordPromptImg: UIImageView!
    var emailPromptImg: UIImageView!
    var createAccountButton: UIButton!
    var nameEntered: UITextField!
    var usernameEntered: UITextField!
    var passwordEntered: UITextField!
    var emailEntered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVisuals()
        setUpButtons()
        setUpDataEntries()
    }
    func setUpButtons() {
        cancelButton = UIButton(frame: CGRect(x: view.frame.width * (6/375), y: view.frame.height * (23/667), width: 53, height: 23))
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.init(red: 37/255, green: 153/255, blue: 225/255, alpha: 1), for: .normal)
        cancelButton.titleLabel?.font =  UIFont.init(name: "AppleSDGothicNeo-Medium", size: 19)
        cancelButton.addTarget(self, action: #selector(cancelSignUp), for: .touchUpInside)
        view.addSubview(cancelButton)
        createAccountButton = UIButton(frame: CGRect(x: view.frame.width * (0.5) - 68, y: view.frame.height * (535/667), width: 136, height: 40))
        createAccountButton.setImage(UIImage(named:"signUpContinueButton")?.withRenderingMode(.alwaysOriginal), for: .normal)
        createAccountButton.imageView?.contentMode = UIViewContentMode.scaleToFill
        createAccountButton.addTarget(self, action: #selector(createNewAccount), for: .touchUpInside)
        view.addSubview(createAccountButton)
    }
    func setUpDataEntries() {
        nameEntered = UITextField(frame: CGRect(x: view.frame.width * (23/375), y: (206/667) * view.frame.height - 25, width: 294, height: 26))
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: nameEntered.frame.size.height - width, width:  nameEntered.frame.size.width, height: nameEntered.frame.size.height)
        border.borderWidth = width
        nameEntered.adjustsFontSizeToFitWidth = true
        nameEntered.textAlignment = .left
        nameEntered.attributedPlaceholder = NSAttributedString(string:"Full name", attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
        nameEntered.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "AppleSDGothicNeo-Medium"))
        nameEntered.textColor = UIColor.lightGray
        nameEntered.layer.addSublayer(border)
        nameEntered.layer.masksToBounds = true
        self.view.addSubview(nameEntered)
        usernameEntered = UITextField(frame: CGRect(x: view.frame.width * (23/375), y: (290/667) * view.frame.height - 25, width: 294, height: 26))
        let usernameBorder = CALayer()
        let usernameWidth = CGFloat(1.0)
        usernameBorder.borderColor = UIColor.lightGray.cgColor
        usernameBorder.frame = CGRect(x: 0, y: usernameEntered.frame.size.height - usernameWidth, width:  usernameEntered.frame.size.width, height: usernameEntered.frame.size.height)
        usernameBorder.borderWidth = usernameWidth
        usernameEntered.adjustsFontSizeToFitWidth = true
        usernameEntered.textAlignment = .left
        usernameEntered.attributedPlaceholder = NSAttributedString(string:"Username", attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
        usernameEntered.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "AppleSDGothicNeo-Medium"))
        usernameEntered.textColor = UIColor.lightGray
        usernameEntered.layer.addSublayer(usernameBorder)
        usernameEntered.layer.masksToBounds = true
        self.view.addSubview(usernameEntered)
        
        passwordEntered = UITextField(frame: CGRect(x: view.frame.width * (23/375), y: (374/667) * view.frame.height - 25, width: 294, height: 26))
        let passwordBorder = CALayer()
        let passwordWidth = CGFloat(1.0)
        passwordBorder.borderColor = UIColor.lightGray.cgColor
        passwordBorder.frame = CGRect(x: 0, y: passwordEntered.frame.size.height - passwordWidth, width:  passwordEntered.frame.size.width, height: passwordEntered.frame.size.height)
        passwordBorder.borderWidth = passwordWidth
        passwordEntered.adjustsFontSizeToFitWidth = true
        passwordEntered.textAlignment = .left
        passwordEntered.attributedPlaceholder = NSAttributedString(string:"Password", attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
        passwordEntered.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "AppleSDGothicNeo-Medium"))
        passwordEntered.textColor = UIColor.lightGray
        passwordEntered.layer.addSublayer(passwordBorder)
        passwordEntered.layer.masksToBounds = true
        self.view.addSubview(passwordEntered)
        
        emailEntered = UITextField(frame: CGRect(x: view.frame.width * (23/375), y: (460/667) * view.frame.height - 25, width: 294, height: 26))
        let emailBorder = CALayer()
        let emailWidth = CGFloat(1.0)
        emailBorder.borderColor = UIColor.lightGray.cgColor
        emailBorder.frame = CGRect(x: 0, y: emailEntered.frame.size.height - emailWidth, width:  emailEntered.frame.size.width, height: emailEntered.frame.size.height)
        emailBorder.borderWidth = emailWidth
        emailEntered.adjustsFontSizeToFitWidth = true
        emailEntered.textAlignment = .left
        emailEntered.attributedPlaceholder = NSAttributedString(string:"Email Address", attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
        emailEntered.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "AppleSDGothicNeo-Medium"))
        emailEntered.textColor = UIColor.lightGray
        emailEntered.layer.addSublayer(emailBorder)
        emailEntered.layer.masksToBounds = true
        self.view.addSubview(emailEntered)
    }
    func setUpVisuals() {
        mdbSocialsSignUpLogo = UIImageView(frame: CGRect(x: view.frame.width * (137/375), y: view.frame.height * (23/667), width: 102, height: 68))
        mdbSocialsSignUpLogo.contentMode = .scaleAspectFill
        mdbSocialsSignUpLogo.image = #imageLiteral(resourceName: "mdbSocialsMainLogo")
        view.addSubview(mdbSocialsSignUpLogo)
        namePromptImg = UIImageView(frame: CGRect(x: view.frame.width * (22/375), y: view.frame.height * (142/667), width: 221, height: 31))
        namePromptImg.contentMode = .scaleAspectFill
        namePromptImg.image = #imageLiteral(resourceName: "SignUpNamePrompt")
        view.addSubview(namePromptImg)
        usernamePromptImg = UIImageView(frame: CGRect(x: view.frame.width * (22/375), y: view.frame.height * (226/667), width: 224, height: 31))
        usernamePromptImg.contentMode = .scaleAspectFill
        usernamePromptImg.image = #imageLiteral(resourceName: "SignUpUsernamePrompt")
        view.addSubview(usernamePromptImg)
        passwordPromptImg = UIImageView(frame: CGRect(x: view.frame.width * (22/375), y: view.frame.height * (312/667), width: 212, height: 31))
        passwordPromptImg.contentMode = .scaleAspectFill
        passwordPromptImg.image = #imageLiteral(resourceName: "signUpPasswordPrompt")
        view.addSubview(passwordPromptImg)
        emailPromptImg = UIImageView(frame: CGRect(x: view.frame.width * (22/375), y: view.frame.height * (396/667), width: 190, height: 31))
        emailPromptImg.contentMode = .scaleAspectFill
        emailPromptImg.image = #imageLiteral(resourceName: "signUpEmailPrompt")
        view.addSubview(emailPromptImg)
        

    }
    func cancelSignUp() {
        self.dismiss(animated: true, completion: nil)
    }
    func createNewAccount() {
        
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
