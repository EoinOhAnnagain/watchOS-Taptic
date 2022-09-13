//
//  InterfaceController.swift
//  Taptic WatchKit Extension
//
//  Created by Eoin Ó'hAnnagáin on 12/09/2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, WKCrownDelegate {
    
    @IBOutlet weak var group: WKInterfaceGroup!
    @IBOutlet weak var emojiLabel: WKInterfaceLabel!
    var value = 0
    let emojiArray = ["😇","🥴","🤮","🤢","🤠","😵‍💫","🥳","🥸","🤪","🗿","😁","😎","😶","🥰","😍","😜","😝","😛","😋","🤩","🫠","🫡","🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🐮","🦁","🐷","🐸","🐵","🐧","🐙","🦈"]
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)
        crownSequencer.delegate = self
        crownSequencer.focus()
        print("\(emojiArray.count)")
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        value = Int.random(in: 0..<emojiArray.count)
        WKInterfaceDevice.current().play(.success)
        print(value)
        emojiLabel.setText("\(emojiArray[value])")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    
}
