//
//  InterfaceController.swift
//  Taptic WatchKit Extension
//
//  Created by Eoin ร'hAnnagรกin on 12/09/2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, WKCrownDelegate {
    
    @IBOutlet weak var group: WKInterfaceGroup!
    @IBOutlet weak var emojiLabel: WKInterfaceLabel!
    let emojiArray = ["๐","๐ฅด","๐คฎ","๐คข","๐ค ","๐ตโ๐ซ","๐ฅณ","๐ฅธ","๐คช","๐ฟ","๐","๐","๐ถ","๐ฅฐ","๐","๐","๐","๐","๐","๐คฉ","๐ซ ","๐ซก","๐ถ","๐ฑ","๐ญ","๐น","๐ฐ","๐ฆ","๐ป","๐ผ","๐ปโโ๏ธ","๐จ","๐ฏ","๐ฎ","๐ฆ","๐ท","๐ธ","๐ต","๐ง","๐","๐ฆ"]
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
