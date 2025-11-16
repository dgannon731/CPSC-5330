//
//  ViewController.swift
//  Assignment 4
//
//  Created by user287375 on 11/16/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveMoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodSlider.minimumValue = 0
        moodSlider.maximumValue = 100
        moodSlider.value = 50
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
    
    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let moodValue = Int(moodSlider.value)
        let moodInfo = moodInfo(for: moodValue)
        
        let selectedDate = datePicker.date
        let dateText = dateFormatter.string(from: selectedDate)
        
        saveMoodLabel.text = "\(dateText): \(moodInfo.description) \(moodInfo.emoji) (\(moodValue))"
    }
    
    private func moodInfo(for value: Int) -> (description: String, emoji: String) {
        switch value {
        case 0...20:
            return ("Very Sad", "😭")
        case 21...40:
            return ("Sad", "😢")
        case 41...60:
            return ("Neutral", "😐")
        case 61...80:
            return ("Happy", "😀")
        case 81...100:
            return ("Very Happy", "🥳")
        default:
            return ("Neutral", "😐")
        }
    }
}
