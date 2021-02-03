///**
/**

WristCheck

Created by: Wayne Thornton on 2/3/21
Portions Copyright © 2021 to Present ViraTrace LLC. All Rights Reserved.

This file contains Original Code and/or Modifications of Original code as defined in and that are subject to the ViraTrace Public Source License Version 1.0 (the ‘License’). You may not use this file except in compliance with the License. Please obtain of copy of the Licenses at https://github.com/ViraTrace/License and read it before using this file.

The Original Code and all software distributed under the License are distributed on an ‘AS IS’ basis, WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND VIRATRACE HEREBY DISCLAIMS ALL SUCH WARRANTIES, INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT. Please see the License for the specific language governing rights and limitations under the License.

*/

import UIKit

class Style {

    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
                let bottomLine = CALayer()
                
                bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
                
                bottomLine.backgroundColor = UIColor.init(red: 15/255, green: 78/255, blue: 101/255, alpha: 1).cgColor
                
                // Remove border on text field
                textfield.borderStyle = .none
                
                // Add the line to the text field
                textfield.layer.addSublayer(bottomLine)
        
            }
        
            static func styleCriticalTextField(_ textfield:UITextField) {
            
            // Create the bottom line
                    let bottomLine = CALayer()
                    
                    bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
                    
                    bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
                    
                    // Remove border on text field
                    textfield.borderStyle = .none
                    
                    // Add the line to the text field
                    textfield.layer.addSublayer(bottomLine)
                
            }
            
            static func styleFilledButton(_ button:UIButton) {
                
                // Filled rounded corner style
                button.backgroundColor = UIColor.init(red: 15/255, green: 78/255, blue: 101/255, alpha: 1)
                button.layer.cornerRadius = 25.0
                button.tintColor = UIColor.white
            }
    
            static func styleCriticalFilledButton(_ button:UIButton) {
        
                // Filled rounded corner style
                button.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
                button.layer.cornerRadius = 25.0
                button.tintColor = UIColor.white
            }
    
            static func styleCriticalHollowButton(_ button:UIButton) {
        
                // Hollow rounded corner style
                button.layer.borderWidth = 2
                button.layer.borderColor = CGColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
                button.layer.cornerRadius = 25.0
                button.tintColor = UIColor.black
            }
            
            static func styleHollowButton(_ button:UIButton) {
                
                // Hollow rounded corner style
                button.layer.borderWidth = 2
                button.layer.borderColor = CGColor.init(red: 15/255, green: 78/255, blue: 101/255, alpha: 1)
                button.layer.cornerRadius = 25.0
                button.tintColor = UIColor.black
            }
            
            static func isPasswordValid(_ password : String) -> Bool {
                
                let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
                return passwordTest.evaluate(with: password)
            }

}
