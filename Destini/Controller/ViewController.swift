//
//  ViewController.swift
//  Destini
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    let storyAnswerBank = StoryAnswerBank()
    var storyIndex: Int = 0
    var answer1: String = ""
    var answer2: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextView.text = storyAnswerBank.list[0].story
        setAnswerButtons(index : 0)
        
        restartButton.isHidden = true
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if ((sender.tag == 1 && storyIndex == 0) || (sender.tag == 1 && storyIndex == 1)) {
            storyTextView.text = storyAnswerBank.list[2].story
            setAnswerButtons(index: 2)
            
            storyIndex = 2
        } else if (sender.tag == 2 && storyIndex == 0) {
            storyTextView.text = storyAnswerBank.list[1].story
            setAnswerButtons(index: 1)
            
            storyIndex = 1
        } else if (sender.tag == 1 && storyIndex == 2) {
            storyTextView.text = storyAnswerBank.list[5].story
            toggleAnswerButtons(hidden: true)
            restartButton.isHidden = false
        } else if (sender.tag == 2 && storyIndex == 2) {
            storyTextView.text = storyAnswerBank.list[4].story
            toggleAnswerButtons(hidden: true)
            restartButton.isHidden = false

        } else if (sender.tag == 2 && storyIndex == 1) {
            storyTextView.text = storyAnswerBank.list[3].story
            toggleAnswerButtons(hidden: true)
            restartButton.isHidden = false
        }
        
    }
    
    func setAnswerButtons(index: Int) {
        answer1 = storyAnswerBank.list[index].answer1
        answer2 = storyAnswerBank.list[index].answer2
        
        topButton.setTitle(answer1, for: .normal)
        bottomButton.setTitle(answer2, for: .normal)
    }
    
    func toggleAnswerButtons(hidden: Bool) {
        if (hidden) {
            topButton.isHidden = true
            bottomButton.isHidden = true
        } else {
            topButton.isHidden = false
            bottomButton.isHidden = false
        }
       
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        storyIndex = 0
        storyTextView.text = storyAnswerBank.list[0].story
        setAnswerButtons(index: 0)
        restartButton.isHidden = true
        toggleAnswerButtons(hidden: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

