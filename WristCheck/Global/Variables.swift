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

class Variables {

    struct Global {
        
        static var DeviceIdentifier = AppDelegate.shared.DeviceIdentifierToSring()
        static var DeviceEmail = "\(DeviceIdentifier)@wristcheck.app"
        static var Database = Firestore.firestore()
        static var Timestamp = NSTimeIntervalSince1970
        

    }

}
