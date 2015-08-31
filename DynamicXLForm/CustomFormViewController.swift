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
    
    var formItem = [String]()
   // var someInts = [Int]()

//    //var counter = -1
//    
//    var storedValueCounter: [Int] {
//        get{
//            return defaults.objectForKey(FormItem.DefaultsKey) as? [Int] ?? []
//        }
//    }
//    private struct FormItem{
//        static let DefaultsKey = "AnotherViewController.StoredValue"
//    }
//    private let defaults = NSUserDefaults.standardUserDefaults()
//    
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
//    func anymethod(){
//        
//        var getName:String = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String!
//        println(getName)
//        //println(item)
//        
//    }

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
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Custom Form") as XLFormDescriptor
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
    }
    
//    func sendArrayToPreviousVC(item:Int) {
//        println("from function \(item)")
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondViewController = (segue.destinationViewController.visibleViewController as!  PresentedTableViewController)
        secondViewController.delegate = self
    }
    
    func writeValueBack(value: String) {
        // this is my value from my second View Controller
    
        formItem.append(value)
        
//        formItem.insert(value, atIndex: 0)
 //       formItem.insert(value, atIndex: 0)

        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Custom Form") as XLFormDescriptor
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        
//        form = XLFormDescriptor(title: "Custom Form") as XLFormDescriptor
//        if form == nil {
//            form = XLFormDescriptor(title: "Custom Form") as XLFormDescriptor
//        }
        
        
        println(formItem)
        
        for i in formItem {
            switch i {
            case "Text":
                row = XLFormRowDescriptor(tag: "texttag", rowType: XLFormRowDescriptorTypeText, title: "Text")
                row.value = "Hi There"
            case "Name":
                row = XLFormRowDescriptor(tag: "nametag", rowType: XLFormRowDescriptorTypeName, title: "Name")
                row.value = "Omar Faruqe"
            case "Email":
                row = XLFormRowDescriptor(tag: "emailtag", rowType: XLFormRowDescriptorTypeEmail, title: "Email")
                row.value = "omar@ideaplaces.com"
            case "Password":
                row = XLFormRowDescriptor(tag: "passwordtag", rowType: XLFormRowDescriptorTypePassword, title: "Password")
                row.value = "Password filed"
            case "Number":
                row = XLFormRowDescriptor(tag: "numbertag", rowType: XLFormRowDescriptorTypeNumber, title: "Number")
                //row.value = "Numerical values"
            case "Phone":
                row = XLFormRowDescriptor(tag: "phonetag", rowType: XLFormRowDescriptorTypeNumber, title: "Phone")
                row.value = "(514) 452 - 2507"
            case "Twitter":
                row = XLFormRowDescriptor(tag: "twittertag", rowType: XLFormRowDescriptorTypeTwitter, title: "Twitter")
                //row.value = "#Hashtag"
            case "Integer":
                row = XLFormRowDescriptor(tag: "integertag", rowType: XLFormRowDescriptorTypeInteger, title: "Integer")
                //row.value = 2147483647
            case "Decimal":
                row = XLFormRowDescriptor(tag: "decimaltag", rowType: XLFormRowDescriptorTypeDecimal, title: "Decimal")
                //row.value = 2147483647
            case "TextView":
                row = XLFormRowDescriptor(tag: "textViewtag", rowType: XLFormRowDescriptorTypeTextView, title: "TextView")
                row.value = "Multiline Text\nAnother line"
            case "Date":
                row = XLFormRowDescriptor(tag: "datetag", rowType: XLFormRowDescriptorTypeDateInline, title:"Date")
                row.value = NSDate()
            case "Time":
                row = XLFormRowDescriptor(tag: "timetag", rowType: XLFormRowDescriptorTypeTimeInline, title: "Time")
                row.value = NSDate()
                //row.disabled = true
            case "DateTime":
                //DateTime
                row = XLFormRowDescriptor(tag: "datetimetag", rowType: XLFormRowDescriptorTypeDateTimeInline, title: "Date Time")
                row.value = NSDate()
            default:
                row = XLFormRowDescriptor(tag: "texttag", rowType: XLFormRowDescriptorTypeText, title: "Text")
                row.value = "Hi There"
            }
            section.addFormRow(row)
            self.form = form;
            //tableView?.reloadData()
        }
    }
    
}


