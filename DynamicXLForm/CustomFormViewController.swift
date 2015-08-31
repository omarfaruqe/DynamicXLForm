//
//  CustomFormViewController.swift
//  SlidePopover
//
//  Created by Omar Faruqe on 2015-08-11.
//  Copyright (c) 2015 Omar Faruqe. All rights reserved.
//

import UIKit
import XLForm

class CustomFormViewController: XLFormViewController, UIPopoverPresentationControllerDelegate, writeValueBackDelegate {
    

    //var counter = -1
    
    var storedValueCounter: [Int] {
        get{
            return defaults.objectForKey(FormItem.DefaultsKey) as? [Int] ?? []
        }
    }
    private struct FormItem{
        static let DefaultsKey = "AnotherViewController.StoredValue"
    }
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func anymethod(){
        
        var getName:String = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String!
        println(getName)
        //println(item)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //self.addFormItem()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.addFormItem()
    }

    func addFormItem() {
        //println("\(itemType)")
        
        //totalFormItem.append(itemType)
        
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Custom Form") as XLFormDescriptor
        
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        
        println("Form elements \(storedValueCounter)")
        
        for x in storedValueCounter {
                switch x {
                case 0:
                    row = XLFormRowDescriptor(tag: "texttag", rowType: XLFormRowDescriptorTypeText, title: "Text")
                    row.value = "Hi There"
                case 1:
                    row = XLFormRowDescriptor(tag: "nametag", rowType: XLFormRowDescriptorTypeName, title: "Name")
                    row.value = "Omar Faruqe"
                case 2:
                    row = XLFormRowDescriptor(tag: "emailtag", rowType: XLFormRowDescriptorTypeEmail, title: "Email")
                    row.value = "omar@ideaplaces.com"
                case 3:
                    row = XLFormRowDescriptor(tag: "passwordtag", rowType: XLFormRowDescriptorTypePassword, title: "Password")
                    row.value = "Password filed"
                case 4:
                    row = XLFormRowDescriptor(tag: "numbertag", rowType: XLFormRowDescriptorTypeNumber, title: "Number")
                    //row.value = "Numerical values"
                case 5:
                    row = XLFormRowDescriptor(tag: "phonetag", rowType: XLFormRowDescriptorTypeNumber, title: "Phone")
                    row.value = "(514) 452 - 2507"
                case 6:
                    row = XLFormRowDescriptor(tag: "twittertag", rowType: XLFormRowDescriptorTypeTwitter, title: "Twitter")
                    //row.value = "#Hashtag"
                case 7:
                    row = XLFormRowDescriptor(tag: "integertag", rowType: XLFormRowDescriptorTypeInteger, title: "Integer")
                    //row.value = 2147483647
                case 8:
                    row = XLFormRowDescriptor(tag: "decimaltag", rowType: XLFormRowDescriptorTypeDecimal, title: "Decimal")
                    //row.value = 2147483647
                case 9:
                    row = XLFormRowDescriptor(tag: "textViewtag", rowType: XLFormRowDescriptorTypeTextView, title: "TextView")
                    row.value = "Multiline Text\nAnother line"
                case 10:
                    row = XLFormRowDescriptor(tag: "datetag", rowType: XLFormRowDescriptorTypeDateInline, title:"Date")
                    row.value = NSDate()
                case 11:
                    row = XLFormRowDescriptor(tag: "timetag", rowType: XLFormRowDescriptorTypeTimeInline, title: "Time")
                    row.value = NSDate()
                    //row.disabled = true
                case 12:
                    //DateTime
                    row = XLFormRowDescriptor(tag: "datetimetag", rowType: XLFormRowDescriptorTypeDateTimeInline, title: "Date Time")
                    row.value = NSDate()
                default:
                    row = XLFormRowDescriptor(tag: "texttag", rowType: XLFormRowDescriptorTypeText, title: "Text")
                    row.value = "Hi There"
            }
            section.addFormRow(row)
            self.form = form;
            tableView?.reloadData()
            println("added items \(x)")
        }
    }
    override func viewWillDisappear(animated: Bool) {
        for key in defaults.dictionaryRepresentation().keys {
            defaults.removeObjectForKey(key.description)
        }
    }
    
    func sendArrayToPreviousVC(item:Int) {
        println("from function \(item)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondViewController = (segue.destinationViewController as!  PresentedTableViewController)
        secondViewController.delegate = self
    }
    func writeValueBack(value: String) {
        // this is my value from my second View Controller
        println(value)
        
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Custom Form") as XLFormDescriptor
        
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: "texttag", rowType: XLFormRowDescriptorTypeText, title: "Text")
        //row.value = "Hi There"
        section.addFormRow(row)
        self.form = form;
        tableView?.reloadData()
        
                
    }
    
}


