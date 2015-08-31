//
//  IdentifierViewController.swift
//  DynamicXLForm
//
//  Created by Omar Faruqe on 2015-08-31.
//  Copyright (c) 2015 Omar Faruqe. All rights reserved.
//

import UIKit

class IdentifierViewController: UIViewController {

    var delegate: writeIdentifierBackDelegate?
    
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var identifierTextField: UITextField!
       
    
    @IBAction func testIdentifier(sender: UIButton) {
        
        println(identifierTextField.text)
        delegate?.writeIdentifierNameBack(identifierTextField.text)
    }
    
    var passingValue:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        identifierLabel.text = passingValue
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
