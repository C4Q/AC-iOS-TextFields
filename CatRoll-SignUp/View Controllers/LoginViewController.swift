//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var errorLabel: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Actions
	@IBAction func didTapLogin(_ sender: UIButton) {
		print("Tapped Login")
	}
	
    // MARK: - Validations
    func textFieldsAreValid() -> Bool {
        
        // 1. some set up

        // 2. iterrate over the text fields

        // 3. if the textfield doesn't have the minimum required characters...

        // 4. make sure that the label isn't hidden
        
        // 5. display an error to rhe user

        // 6. indicate that the fields are not valid
        
        
        // 7. hide the error label if all gets validated
        
        // 8. indicate that the fields are valid
        return true
    }
    
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        // fill in code
        return false
    }
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        // fill in code
        return true
    }
    
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // (add delegate functions below here)
}
