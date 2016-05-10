//
//  
//

import Foundation
import UIKit

class LoginVC : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleLabel : UILabel!
    
    @IBOutlet var facebookButton : UIButton!
    @IBOutlet var twitterButton : UIButton!

    @IBOutlet var bgImageView : UIImageView!
    
    @IBOutlet var noAccountButton : UIButton!
    @IBOutlet var signInButton : UIButton!
    
    @IBOutlet var forgotPassword : UIButton!
    
    @IBOutlet var passwordContainer : UIView!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var passwordTextField : UITextField!
    @IBOutlet var passwordUnderline : UIView!

    @IBOutlet var userContainer : UIView!
    @IBOutlet var userLabel : UILabel!
    @IBOutlet var userTextField : UITextField!
    @IBOutlet var userUnderline : UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView.image = UIImage(named: "EA_signin")
        bgImageView.contentMode = .ScaleAspectFill
       
        
        titleLabel.text = "Hi there."
        titleLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 20)
        titleLabel.textColor = UIColor.grayColor()

        let attributedText = NSMutableAttributedString(string: "Don't have an account? Sign up")
        attributedText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(23, 7))
        attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSMakeRange(0, attributedText.length))
        
        noAccountButton.setAttributedTitle(attributedText, forState: .Normal)
        noAccountButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        noAccountButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName, size:14)
        noAccountButton.addTarget(self, action: #selector(LoginVC.dismiss), forControlEvents: .TouchUpInside)
        
        signInButton.setTitle("Sign In", forState: .Normal)
        signInButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signInButton.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName, size: 22)
        signInButton.layer.borderWidth = 0
        signInButton.layer.borderColor = UIColor.grayColor().CGColor
        signInButton.layer.cornerRadius = 5
        signInButton.addTarget(self, action: #selector(LoginVC.dismiss), forControlEvents: .TouchUpInside)
        
        forgotPassword.setTitle("Forgot Password?", forState: .Normal)
        forgotPassword.setTitleColor(UIColor.grayColor(), forState: .Normal)
        forgotPassword.titleLabel?.font = UIFont(name: MegaTheme.semiBoldFontName, size: 15)
        forgotPassword.addTarget(self, action: #selector(LoginVC.dismiss), forControlEvents: .TouchUpInside)
        
        passwordContainer.backgroundColor = UIColor.clearColor()
        
        passwordLabel.text = "Password:"
        passwordLabel.font = UIFont(name: MegaTheme.fontName, size: 20)
        passwordLabel.textColor = UIColor.grayColor()
        
        passwordTextField.text = ""
        passwordTextField.font = UIFont(name: MegaTheme.fontName, size: 20)
        passwordTextField.textColor = UIColor.lightGrayColor()
        passwordTextField.secureTextEntry = true
        
        userContainer.backgroundColor = UIColor.clearColor()
        
        userLabel.text = "User ID:"
        userLabel.font = UIFont(name: MegaTheme.fontName, size: 20)
        userLabel.textColor = UIColor.grayColor()
        
        userTextField.text = ""
        userTextField.font = UIFont(name: MegaTheme.fontName, size: 20)
        userTextField.textColor = UIColor.lightGrayColor()
        
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
         titleLabel.hidden = newCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func dismiss(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


