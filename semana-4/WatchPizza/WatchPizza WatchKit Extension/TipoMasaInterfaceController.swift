//
//  TipoMasaInterfaceController.swift
//  WatchPizza
//
//  Created by Jeisson on 11/8/15.
//  Copyright © 2015 WiseWare SAS. All rights reserved.
//

import WatchKit
import Foundation


class TipoMasaInterfaceController: WKInterfaceController {
    let volume = ["delgada", "crujiente", "gruesa"]
    var summary: String = ""
    var index:Int = 0
    
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        summary = context as! String
        
        print(summary)
        var pickerItems: [WKPickerItem] = []
        
        for vol in volume {
            let item = WKPickerItem()
            item.title = vol
            pickerItems.append(item)
        }
        
        self.picker.setItems(pickerItems)
        // Configure interface objects here.
    }
    
    
    @IBAction func select(value: Int) {
        index = value
    }
    
    @IBAction func nextStep() {
        self.pushControllerWithName("tipoQueso", context: summary + volume[index] + ", ")
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
