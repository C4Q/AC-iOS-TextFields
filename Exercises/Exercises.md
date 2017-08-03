# AC3.2 Delegation through Textfields: Exercise Solutions
---

### Solution for `textfield(_:hasMinimum:)`

```swift
func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
	// check for non-nil value
	guard let validText = textField.text else { return false }

	return validText.characters.count >= minimum
}
```

### Solution for `shouldReturn` validation

```swift
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("\n + \(textField.debugId) SHOULD RETURN")

		// 1. Check for which textField is passed
		if textField == self.nameTextField {
			// 2. Check if it has the minimum required length
        	//  - 4 for nameTextField
			let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 4)

			// 3. If not long enough, display error message in errorLabel
			if !textIsLongEnough {
				self.errorLabel.isHidden = false
				self.errorLabel.text = "You must have at least 4 letters in your name"
			} else // 4. If long enough, clear error message in errorLabel
			{
				self.errorLabel.isHidden = true
			}

			return textIsLongEnough
		}

		// 1. Check for which textField is passed
		if textField == self.passwordTextField {
			// 2. Check if it has the minimum required length
			//  - 6 for passwordTextField
			let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 6)

			// 3. If not long enough, display error message in errorLabel
			if !textIsLongEnough {
				self.errorLabel.isHidden = false
				self.errorLabel.text = "You must have at least 6 letters in your password"
			}
			else // 4. If long enough, clear error message in errorLabel
			{
				self.errorLabel.isHidden = true
			}

			return textIsLongEnough
		}

		return true
	}
```

### Solution for `textFieldsAreValid`

```swift
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
```