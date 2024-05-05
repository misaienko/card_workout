//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Admin on 03/01/2024.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var cardImageView: UIImageView!
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer!
    // Force unwrapping is fine in this case, because its contained in this controller
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    //overriding the main parent func, to make child inherit all functionality specify 'super.view'
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
        //In case array is empty, do not crush, use "AS" as the default
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
}
