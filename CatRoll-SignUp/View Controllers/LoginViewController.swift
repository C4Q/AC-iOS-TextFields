//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
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
		_ = self.textFieldsAreValid()
	}
	
    // MARK: - Validations
    func textFieldsAreValid() -> Bool {
        
        // 1. some set up
		let textFields: [UITextField] = [self.nameTextField, self.passwordTextField]
		let minimumLengthRequireMents: [UITextField : Int] = [
			self.nameTextField : 4,
			self.passwordTextField : 6
		]
		
        // 2. iterrate over the text fields
		for field in textFields {
			let minimumLengthForField = minimumLengthRequireMents[field]!
			let minimumLengthMet = textField(field, hasMinimumCharacters: minimumLengthForField)
			
			// 3. if the textfield doesn't have the minimum required characters...
			if !minimumLengthMet {
				// 4. make sure that the label isn't hidden
				self.errorLabel.isHidden = false
				
				// 5. display an error to rhe user
				// 6. indicate that the fields are not valid
				self.errorLabel.text = "You must have at least \(minimumLengthForField) letters in \(field.debugId)"
				
				// 8. indicate that the fields are invalid
				return false
			}
			else {
				// 7. hide the error label if all gets validated
				self.errorLabel.isHidden = true
			}
		}

        return true
    }
    
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        // fill in code
		guard let validText = textField.text else { return false }
		
		return validText.characters.count >= minimum
    }
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        // fill in code
        return true
    }
    
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // (add delegate functions below here)
	
	// the .debugId property is defined in an extension, it's not actually part of UITextField
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		print("\n + \(textField.debugId) SHOULD BEGIN")

		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("\n + \(textField.debugId) DID BEGIN")
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		print("\n + \(textField.debugId) SHOULD END")
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("\n + \(textField.debugId) DID END")
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("\n + \(textField.debugId) SHOULD RETURN")
		return self.textFieldsAreValid()
	}
}
