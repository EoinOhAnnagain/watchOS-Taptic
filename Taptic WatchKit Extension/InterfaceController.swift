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
    private var currentHapticMode = 8;
    private let haptics: [WKHapticType] = [.success,.failure,.directionDown,.directionUp,.notification,.retry,.start,.stop]
    private var hapticChoice: WKHapticType = .failure
    //private var temp = 0
    @IBOutlet weak var tapped: WKTapGestureRecognizer!
    
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
        //Testing for haptics
        //temp += 1
        //hapticChoice = haptics[temp]
        //print("Next is: \(temp)")
        if currentHapticMode == 8 {
            hapticChoice = haptics[Int.random(in: 0..<haptics.count)]
        }
    }
    
    override func willActivate() {
        if emojiMode {
            changeEmoji()
        }
    }
    
    @IBAction func tapAction(_ sender: Any) {
        print("User Tapped")
        if currentHapticMode == 8 {
            currentHapticMode = 0
        } else {
            currentHapticMode += 1
        }
        if currentHapticMode != 8 {
            hapticChoice = haptics[currentHapticMode]
            WKInterfaceDevice.current().play(hapticChoice)
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
