//
//  ProfileViewController.swift
//  theGram
//
//  Created by student on 4/21/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

import Parse

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logOutDidTapped(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "logInVC") as UIViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        
        
    }
    
    
}

