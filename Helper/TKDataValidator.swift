//
//  TKDataValidator.swift
//  TKFormTextFieldDemo
//
//  Created by Thongchai Kolyutsakul on 1/1/17.
//  Copyright © 2017 Viki. All rights reserved.
//

import Foundation

// Stores functions that validates input text.
// Each function takes a text.
// Returns an error string if that text is invalid, or nil if valid.
class TKDataValidator {
    class func email(text: String?) -> String? {
        guard let text = text, !text.isEmpty else {
            return "Required email"
        }
        guard text.tk_isValidEmail() else {
            return "Email is invalid"
        }
        return nil
    }
    
    class func password(text: String?) -> String? {
        guard let text = text, !text.isEmpty  else {
            return "Required password"
        }
        guard  text.count >= 8 else {
            return "Password is invalid"
        }
        guard text.tk_isValidPassword() else {
            return "Password is invalid"
        }
        
        
        return nil
    }
    class func name(text: String?) -> String? {
        guard let text = text, !text.isEmpty  else {
            return "Required name"
        }
        return nil
        
    }
    class func mobileNumber(text: String?) -> String? {
        guard let text = text, !text.isEmpty  else {
            return "Required mobile number"
        }
        
        if !(text.count == 10 ){
            return "Mobile number is invalid"
        }
        
        return nil
    }
    
}

private extension String {
    func tk_isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    func tk_isValidPassword() -> Bool
    {
//        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%^*#?&]{8,45}$"
        let passWordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")

        return passWordTest.evaluate(with: self)
    }
}
