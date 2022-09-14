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
    private let emojiArray = ["😇","🥴","🤮","🤢","🤠","😵‍💫","🥳","🥸","🤪","🗿","😁","😎","😶","🥰","😍","😜","😝","😛","😋","🤩","🫠","🫡","🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🐮","🦁","🐷","🐸","🐵","🐧","🐙","🦈"]
    private var value = Int()
    private var emojiMode = true
    private var colourMode = false
    private let haptics: [WKHapticType] = [.click,.success,.failure]
    private var hapticChoice: WKHapticType = .success
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        crownSequencer.focus()
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        changeEmoji()
        WKInterfaceDevice.current().play(hapticChoice)
    }
    
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        hapticChoice = haptics[Int.random(in: 0..<haptics.count)]
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
