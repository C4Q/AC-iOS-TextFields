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
		
		guard
			let nameString: String = self.nameTextField.text,
			let passwordString: String = self.passwordTextField.text
			else {
				return false
		}
		
		guard
			!nameString.isEmpty,
			!passwordString.isEmpty
			else {
				self.updateErrorLabel(with: "Must not leave any fields blank")
				return false
		}
		
		guard self.twoNamesArePresent(in: nameString) else {
			self.updateErrorLabel(with: "Name Field Must Contain At Least 2 Names (First, Family)")
			return false
		}
		
		guard self.passwordContainsAtLeastOneCapitalizedLetter(passwordString) else {
			self.updateErrorLabel(with: "Password Must Contain At Least One Capitalized Letter")
			return false
		}
		
		guard self.passwordContainsAtLeastOneNumber(passwordString) else {
			self.updateErrorLabel(with: "Password Must Contain At Least One Number")
			return false
		}
		
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
		let invalidCharRange = string.rangeOfCharacter(from: characterSet.inverted)
        return invalidCharRange == nil
    }
    
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // (add delegate functions below here)
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		if textField == self.nameTextField && string != "" {
			let validChar = self.string(string, containsOnly: CharacterSet.letters.union(CharacterSet.whitespaces))
			
			if !validChar {
				updateErrorLabel(with: "Your Name Can Only Contain Letters")
				return false
			}
			else {
				updateErrorLabel(with: nil)
			}
		}
		
		return true
	}
	
	func updateErrorLabel(with message: String?) {
		if message == nil {
			self.errorLabel.isHidden = true
		}
		
		if self.errorLabel.isHidden {
			self.errorLabel.isHidden = false
		}
		
		self.errorLabel.text = message
		self.errorLabel.textColor = UIColor.red
		self.errorLabel.backgroundColor = UIColor.red.withAlphaComponent(0.25)
	}
	
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
	
	
	// MARK: - Exercise Functions
	func twoNamesArePresent(in string: String) -> Bool {
		let validNameCharacters: CharacterSet = CharacterSet.letters.union(CharacterSet.punctuationCharacters)
		
		let components: [String] = string.trimmingCharacters(in: CharacterSet.whitespaces)
			.components(separatedBy: CharacterSet.whitespaces)
		
		guard components.count >= 2 else {
			return false
		}
		
		for component in components {
			guard
				component.characters.count > 1,
				self.string(component, containsOnly: validNameCharacters)
				else {
					return false
			}
		}
		
		return true
	}
	
	func passwordContainsAtLeastOneNumber(_ string: String) -> Bool {
		if let _ = string.rangeOfCharacter(from: CharacterSet.decimalDigits) {
			return true
		}
		
		return false
	}
	
	func passwordContainsAtLeastOneCapitalizedLetter(_ string: String) -> Bool {
		if let _ = string.rangeOfCharacter(from: CharacterSet.uppercaseLetters) {
			return true
		}
		
		return false
	}
}
