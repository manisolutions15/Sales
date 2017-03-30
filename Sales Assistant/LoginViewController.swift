//
//  LoginViewController.swift
//  Sales Assistant
//

//  Copyright © 2017 RoomBoys. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBox: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBox.layer.borderColor = UIColor.lightGray.cgColor
        loginBox.layer.borderWidth = 1
        
        signInBtn.layer.shadowColor = UIColor.black.cgColor
        signInBtn.layer.shadowOpacity = 0.3
        signInBtn.layer.shadowOffset = CGSize.zero
        signInBtn.layer.shadowRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInAct(sender:UIButton)
    {
        if(username.text == "admin" && password.text == "password")
        {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let loginView: MainSplitViewController = storyboard.instantiateViewController(withIdentifier: "splitView") as! MainSplitViewController
            UIApplication.shared.keyWindow?.rootViewController = loginView
        }
        else
        {
            let alert = UIAlertController(title: "Message!", message: "Please enter valid username and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                // perhaps use action.title here
            })
            self.present(alert, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
