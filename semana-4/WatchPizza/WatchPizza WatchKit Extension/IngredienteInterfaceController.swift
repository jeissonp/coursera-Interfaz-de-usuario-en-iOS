//
//  IngredienteInterfaceController.swift
//  WatchPizza
//
//  Created by Jeisson on 11/8/15.
//  Copyright © 2015 WiseWare SAS. All rights reserved.
//

import WatchKit
import Foundation


class IngredienteInterfaceController: WKInterfaceController {
    let mix = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa", "champiñon"]
    
    var summary: String = ""
    
    @IBOutlet var table: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        summary = context as! String
        
        table.setNumberOfRows(mix.count, withRowType: "item")

        var i = 0
        
        for value in mix {
            let row = table.rowControllerAtIndex(i) as? Item
            row!.titleMix.setText(value)
            i++
        }
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = table.rowControllerAtIndex(rowIndex) as! Item
        if row.isSelect {
            row.titleMix.setTextColor(UIColor.whiteColor())
            row.isSelect = false
        }
        else {
            row.titleMix.setTextColor(UIColor.greenColor())
            row.isSelect = true
        }
    }

    @IBAction func nextStep() {
        let count = mix.count
        var items:[String] = []
        for index in 0..<count {
            let row = table.rowControllerAtIndex(index) as! Item
            if (row.isSelect) {
                items.append(mix[index])
            }
        }
        
        if (items.count > 0 && items.count <= 5) {
            pushControllerWithName("confirmacion", context: summary + " Ingredientes: (" + items.joinWithSeparator(",") + ")")
        }
        else {
            let ok = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                
            })
            self.presentAlertControllerWithTitle("Advertencia", message: "Debe seleccionar de 1 a 5 ingredientes", preferredStyle: WKAlertControllerStyle.Alert, actions: [ok])
        }
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
