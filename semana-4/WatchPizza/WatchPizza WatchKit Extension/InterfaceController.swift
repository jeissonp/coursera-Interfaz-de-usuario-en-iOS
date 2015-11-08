//
//  InterfaceController.swift
//  WatchPizza WatchKit Extension
//
//  Created by Jeisson on 11/8/15.
//  Copyright © 2015 WiseWare SAS. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var sizePicker: WKInterfacePicker!
    let sizes = ["chica", "mediana", "grande"]
    var index:Int = 0
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var pickerItems: [WKPickerItem] = []
        
        for size in sizes {
            let item = WKPickerItem()
            item.title = size
            pickerItems.append(item)
        }
        
        self.sizePicker.setItems(pickerItems)
        
        // Configure interface objects here.
    }

    @IBAction func nextStep() {
        //print(sizePicker.)
        self.pushControllerWithName("tipoMasa", context: "Pizza: " + sizes[index] + ", ")
    }
    
    @IBAction func select(value: Int) {
        index = value
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
