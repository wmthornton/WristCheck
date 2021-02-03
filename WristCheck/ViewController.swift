///**
/**

WristCheck

Created by: Wayne Thornton on 2/3/21

This file contains Original Code and/or Modifications of Original code as defined in United States copyright law. The subject code is hereby dedicated to the Public Domain and subject to the provisions of the Unlicense including with this file.

*/

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var deviceIdentifierLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deviceIdentifierLabel.text = Variables.Global.DeviceEmail
                
    }
    
}

