//
//  PresentedTableViewController.swift
//  MZFormSheetPresentationController Swift Example

import UIKit
import XLForm

class PresentedTableViewController: XLFormViewController {
    
    // delegate for FirstViewController
    var delegate: writeValueBackDelegate?
    
    
    private struct FormItem{
        static let DefaultsKey = "AnotherViewController.StoredValue"
    }
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    
    var storedValueCounter: [Int] {
        get{
            return defaults.objectForKey(FormItem.DefaultsKey) as? [Int] ?? []
        }
        set{
            defaults.setObject(newValue, forKey: FormItem.DefaultsKey)
            //println("value set to \(newValue)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: Selector("close"))
    }
    
    func close() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! IdentifierViewController
        destination.identifierLabel.text = "AnyText"

    }
    
//    @IBAction func closePopover(sender: UIBarButtonItem) {
//        
//        var tmpController :UIViewController! = self.presentingViewController;
//        
//        self.dismissViewControllerAnimated(false, completion: {()->Void in
//            println("done");
//            tmpController.dismissViewControllerAnimated(false, completion: nil);
//        });
//        
////        for key in defaults.dictionaryRepresentation().keys {
////            defaults.removeObjectForKey(key.description)
////        }
//        
//    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        self.initializeForm()
//    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeForm()
    }
    
    
    
    // MARK: Helpers
    
    func initializeForm() {
        
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "Form Template") as XLFormDescriptor
        
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        
        row = XLFormRowDescriptor(tag: "texttag", rowType: XLFormRowDescriptorTypeText, title: "Text")
        row.cellConfig["textField.userInteractionEnabled"] = false
        row.cellConfig["textField.placeholder"] = "Text Filed"
        //row.value = "Hi There"
        
        //row.cellConfigAtConfigure.setObject(0.7, forKey:XLFormTextFieldLengthPercentage)
        section.addFormRow(row)
        
        
        // Name
        row = XLFormRowDescriptor(tag: "name", rowType: XLFormRowDescriptorTypeText, title:"Name")
        // font
        //row.cellConfig["textField.font"] = UIFont.systemFontOfSize(25)
        // alignment
        //row.cellConfig["textField.textAlignment"] =  NSTextAlignment.Right.rawValue
        // change the background color
        //row.cellConfigAtConfigure["backgroundColor"] = UIColor.greenColor()
        // font
        //row.cellConfig["textLabel.font"] = UIFont.systemFontOfSize(30)
        // background color
        //row.cellConfig["textField.backgroundColor"] = UIColor.grayColor()
        row.cellConfig["textField.placeholder"] = "Name Filed"
        row.cellConfig["textField.userInteractionEnabled"] = false
        section.addFormRow(row)

 
        row = XLFormRowDescriptor(tag: "urltag", rowType: XLFormRowDescriptorTypeURL, title: "Url")
        //row.value = "http://ideaplaces.com"
        row.cellConfig["textField.placeholder"] = "http://ideaplaces.com"
        row.cellConfig["textField.userInteractionEnabled"] = false
        section.addFormRow(row)
        
  
        row = XLFormRowDescriptor(tag: "emailtag", rowType: XLFormRowDescriptorTypeEmail, title: "Email")
        //row.value = "omar@ideaplaces.com"
        row.cellConfig["textField.placeholder"] = "http://ideaplaces.com"
        row.cellConfig["textField.userInteractionEnabled"] = false
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "passwordtag", rowType: XLFormRowDescriptorTypePassword, title: "Password")
        row.value = "Password filed"
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "numbertag", rowType: XLFormRowDescriptorTypeNumber, title: "Number")
        //row.value = "Numerical values"
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "phonetag", rowType: XLFormRowDescriptorTypeNumber, title: "Phone")
        row.value = "(514) 452 - 2507"
        //row.cellConfigAtConfigure.setObject(0.7, forKey:XLFormTextFieldLengthPercentage)
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "twittertag", rowType: XLFormRowDescriptorTypeTwitter, title: "Twitter")
        //row.value = "#Hashtag"
        section.addFormRow(row)
        
        
//        row = XLFormRowDescriptor(tag: "accounttag", rowType: XLFormRowDescriptorTypeAccount, title: "Account")
//        row.value = "Account Number"
//        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "integertag", rowType: XLFormRowDescriptorTypeInteger, title: "Integer")
        //row.value = 2147483647
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "decimaltag", rowType: XLFormRowDescriptorTypeDecimal, title: "Decimal")
        //row.value = 2147483647
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "textViewtag", rowType: XLFormRowDescriptorTypeTextView, title: "TextView")
        row.value = "Multiline Text\nAnother line"
        section.addFormRow(row)
        
        // Date
        row = XLFormRowDescriptor(tag: "datetag", rowType: XLFormRowDescriptorTypeDateInline, title:"Date")
        row.value = NSDate()
        section.addFormRow(row)
        
        // Time
        row = XLFormRowDescriptor(tag: "timetag", rowType: XLFormRowDescriptorTypeTimeInline, title: "Time")
        row.value = NSDate()
        //row.disabled = true
        section.addFormRow(row)
        
        //DateTime
        row = XLFormRowDescriptor(tag: "datetimetag", rowType: XLFormRowDescriptorTypeDateTimeInline, title: "Date Time")
        row.value = NSDate()
        section.addFormRow(row)
        
        self.form = form;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = tableView.cellForRowAtIndexPath(indexPath)!.textLabel!.text! as String
        
        //println(item)
        
        delegate?.writeValueBack(item)
        
        
        
//       // rowindex = indexPath.item
////    
//       println("Item: \(item)")
//       println("Indexpath \(indexPath.item)")
        
//       storedValueCounter.append(indexPath.item)
//        
//        var myCustomViewController: ViewController = ViewController(nibName: nil, bundle: nil)
//        myCustomViewController.addFormItem()

        var row = self.form.formRowAtIndex(indexPath);
        if (row!.tag == "texttag") {
           // DDLogVerbose("Clicked row");
            var vc = IdentifierViewController() //home: self.home);
            self.navigationController?.pushViewController(vc, animated: true);
        }
        else {
            super.tableView(tableView, didSelectRowAtIndexPath: indexPath);
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
    }

//    override func viewWillAppear(animated: Bool) {
//                for key in defaults.dictionaryRepresentation().keys {
//                    defaults.removeObjectForKey(key.description)
//                }
//    }
    
}



//protocol MyProtocol
//{
//    func sendArrayToPreviousVC(item:Int)
//}

