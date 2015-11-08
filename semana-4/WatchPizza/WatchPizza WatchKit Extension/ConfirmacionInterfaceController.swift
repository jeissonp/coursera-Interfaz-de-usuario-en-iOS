//
//  ConfirmacionInterfaceController.swift
//  WatchPizza
//
//  Created by Jeisson on 11/8/15.
//  Copyright © 2015 WiseWare SAS. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionInterfaceController: WKInterfaceController {
    @IBOutlet var summary: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        summary.setText(context as! String)
        // Configure interface objects here.
    }

    @IBAction func confirmOrder() {
        let cancel = WKAlertAction(title: "Si", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            self.popToRootController()
        })
        
        let action = WKAlertAction(title: "No", style: WKAlertActionStyle.Default, handler: { () -> Void in
            
        })
        
        self.presentAlertControllerWithTitle("Confrmar", message: "Desea confirmar la orden", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])
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
