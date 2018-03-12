//
//  SignInViewController.swift
//  SmartTagID
//
//  Created by Alex Johnson on 04/03/2018.
//  Copyright © 2018 Alex Johnson. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignedInSegue", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = 5
        signInButton.layer.cornerRadius = 5
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
