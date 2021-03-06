///**
/**

WristCheck

Created by: Wayne Thornton on 2/3/21
Portions Copyright © 2021 to Present ViraTrace LLC. All Rights Reserved.

This file contains Original Code and/or Modifications of Original code as defined in and that are subject to the ViraTrace Public Source License Version 1.0 (the ‘License’). You may not use this file except in compliance with the License. Please obtain of copy of the Licenses at https://github.com/ViraTrace/License and read it before using this file.

The Original Code and all software distributed under the License are distributed on an ‘AS IS’ basis, WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND VIRATRACE HEREBY DISCLAIMS ALL SUCH WARRANTIES, INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT. Please see the License for the specific language governing rights and limitations under the License.

*/

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAnalytics

class Functions {
    
    public struct Global {
        
        // We use a validation token that is created when a user completes initial app setup to determine which options a user should be shown during launch. This function creates the token and saves it to the local file system on the user's device.
        func saveTokenOnDisk() {
            
            let Timestamp = Variables.Global.Timestamp
            let validation = "Sometimes it's better to leave something alone, to pause, and that's very true of this file, created by the WristCheck© app on " + "\(Timestamp)"
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("WristCheck_Validation.tkn")
            do {
                try validation.write(to: path, atomically: true, encoding: .utf32)
                
            } catch {
                
                print(error.localizedDescription)
                
            }
            
        }
        
        
        // This function checks for the validation token created by saveTokenToDisk() and can be coded to perform different options depending on whether the token exists.
        func tokenCheck() {
            
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            
            let url = NSURL(fileURLWithPath: path)
            if let pathComponent = url.appendingPathComponent("WristCheck_Validation.tkn") {
                
                let filePath = pathComponent.path
                
                let fileManager = FileManager.default
                
                if fileManager.fileExists(atPath: filePath) {
                    
                    print("TOKEN VALIDATED")
                    // Code here
                    
                } else {
                    
                    print("TOKEN FAILURE")
                    // Code here
                }
            }
        }
        
        func saveTimerOnDisk() {
            
            let Timestamp = Variables.Global.Timestamp
            let validation = "\(Timestamp)"
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("WristCheck_Timer.wck")
            do {
                try validation.write(to: path, atomically: true, encoding: .utf32)
                
            } catch {
                
                print(error.localizedDescription)
                
            }
            
        }
        
        
        // Check for dark mode. Display alert if enabled. Alert is displayed on main thread.
        func checkMode() {
            
            DispatchQueue.main.async {
                
            if #available(iOS 13.0, *) {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    print("Dark mode is enabled. :-(")
                    
                    // Dark-mode check
                    let alert = UIAlertController(title: "Uh-oh! How embarassing!", message:"We all like dark mode, but for the moment WristCheck© doesn't support it. The app will still run, but things won't quite look as intended. We are looking at adding support for dark mode in a future release, but for the moment please consider switching to light mode for the best experience.", preferredStyle: UIAlertController.Style.alert)
                    
                    // Add button.
                    alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: {action in
                        
                        // Open Settings app
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                    }))
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                           
                    // Show the alert.
                    //self.present(alert, animated: true, completion: nil)
                }
                else {
                    print("Light mode is enabled. :-)")
                }
            }
            }
        }
        
    }
    
    func determineLoginOptions() {
        
        // Determine whether to show the sign-up or the login button on the main authentication page. If a user record matching the autogenerated random device identifier determined by function within AppDelegate exists in Firebase, then the sign-up button will be disabled. If no user record  is found, the sign-up option will be enabled and the login button will be disabled.
        let user = Variables.Global.DeviceIdentifier
        let db = Variables.Global.Database
        let docRef = db.collection("Users").document(user)
        
        // Show an indeterminate loading indicator during this function's network calls to indicate to user that something is happening in the background. This doesn't need to be a seperate class or function since we are using storyboards, but ideally we will refactor code once MVP is complete.
        //self.loadingIndicator.alpha = 1
        
        // Get the data with field matching user for debug console. This may also be used in other code for retrieving JSON data
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                
                // Console output
                print("User: \(dataDescription)")
                
                // App output
                //self.loadingIndicator.alpha = 0
                //self.loginButton.alpha = 1
                
            } else {
                // Console output
                print("User does not exist")
                
                // The indeterminate loading indicator should disappear before the alert message coded below is displayed to the user. This is mainly for visual purposes, but it probably has a neglible impact on app performance as well.
                //self.loadingIndicator.alpha = 0
                
                // Following check is disabled in dark mode. TO-DO: Enable checking
                DispatchQueue.main.async {
                    
                    // Notify user of account requirements.
                    let alert = UIAlertController(title: "Anonymous User Account Required", message:"An anonymous user account is required to use WristCheck©. Please create your account now.", preferredStyle: UIAlertController.Style.alert)
                    
                    // Add button.
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                           
                    // Show the alert.
                    //self.present(alert, animated: true, completion: nil)
                }
                
                // App output
                //self.signupButton.alpha = 1
            }
            
        }
    }
    
    func exitApp() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              exit(0)
             }
        }
    }
    
}
