//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Actions

	
    // MARK: - Validations
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        // fill in code
		return false
    }
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        // fill in code
		
		return false
    }
    
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // (add delegate functions below here)

}
