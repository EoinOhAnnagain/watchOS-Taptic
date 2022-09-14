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
    let emojiArray = ["😇","🥴","🤮","🤢","🤠","😵‍💫","🥳","🥸","🤪","🗿","😁","😎","😶","🥰","😍","😜","😝","😛","😋","🤩","🫠","🫡","🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🐮","🦁","🐷","🐸","🐵","🐧","🐙","🦈"]
    var value = Int()
    var emojiMode = true
    var colourMode = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        crownSequencer.focus()
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        changeEmoji()
        WKInterfaceDevice.current().play(.directionUp)
        
    }
    
    override func willActivate() {
        if emojiMode {
            changeEmoji()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    private func changeEmoji() {
        value = Int.random(in: 0..<emojiArray.count)
        emojiLabel.setText("\(emojiArray[value])")
    }
    
}
