//
//  TipoQuesoInterfaceController.swift
//  WatchPizza
//
//  Created by Jeisson on 11/8/15.
//  Copyright © 2015 WiseWare SAS. All rights reserved.
//

import WatchKit
import Foundation


class TipoQuesoInterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    let cheese = ["mozarela", "cheddar", "parmesano", "sin queso"]
    var summary:String = ""
    var index = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        summary = context as! String
        var pickerItems: [WKPickerItem] = []
        
        for ch in cheese {
            let item = WKPickerItem()
            item.title = ch
            pickerItems.append(item)
        }
        
        self.picker.setItems(pickerItems)
        // Configure interface objects here.
    }

    @IBAction func select(value: Int) {
        index = value
    }
    
    
    @IBAction func nextStep() {
        self.pushControllerWithName("ingredientes", context: summary + cheese[index] + ", ")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
