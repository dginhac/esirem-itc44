//
//  ViewController.swift
//  Facebook
//
//  Created by d0m on 06/12/2019.
//  Copyright © 2019 d0m. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // All the members variables
    // IBOutlet : Use CTRL + Drag and Drop from StoryBoard and add Outlet or Outlet Collection
    @IBOutlet weak var coverIV: UIImageView!  // The cover Image View
    @IBOutlet weak var profileIV: UIImageView! // The profile Image View
    
    @IBOutlet weak var storyButton: UIButton! // The main button
    @IBOutlet var OtherButtons: [UIButton]! // The two other buttons
                                            // Do not forget to add a tag to each button
    
    
    
    // 1 - IBAction is the first possibility to interact with the UI
    //
    // IBAction: Use CTRL + Drag and Drop from StoryBoard and add Action
    // Parameters of the action can be 0, 1 (sender) or 2 (sender and event)
    // Use the adequate numbers of parameters according your needs.
    
    
    // Single IBAction for the main button of the app
    // For Button, the event is often Touch Up Inside
    @IBAction func storyPressed(_ sender: Any) {
        // The IBAction changes the background color of the main button.
        // You have access to the button with the IBOutlet storyButton
        
        if storyButton.backgroundColor == UIColor.link {
            storyButton.backgroundColor = UIColor.gray
        }
        else {
            storyButton.backgroundColor = UIColor.link
        }
    }
    
    // Multiple IBAction for the two other buttons
    // Ctrl + Drag and Drop for creating the IBAction for the first button
    // Ctrl + Drag and Drop on the IBAction for connecting the second button to the IBAction
    // The sender is very important because the parameter tag give us information about the button which has been clicked.
    @IBAction func otherButtonsPressed(_ sender: UIButton) {
        // the tags of the two buttons are 0 and 1
        // We use these tags to update the alpha (0: hidden, 1:visible) of the cover image
        coverIV.alpha = CGFloat(sender.tag)
    }
    
    // 2 - Gestures are the second possibility to interact with the UI
    // See https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures for details
    //
    // IBAction are only available for a limited sets of objects including Buttons, ...
    // For other objects, we can use Gestures
    // See viewDidLoad() functions below for details on creating gesture
    // Basically, a gesture must be created with the UITapGestureRecognizer function
    // A specific function defined as a selector must be associated with the gesture

    // First example of gesture : the tap gesture
    // For each gesture, we need to write an @objc function
    // that will be executed when the gesture is detected.
    
    @objc func tapGesture() {
        // Use the animate function
        // the second parameter (animations) use a closure (i.e. a function)
        UIView.animate(withDuration: 2, animations: { // Begin of closure
            if self.profileIV.layer.cornerRadius == 0 {
                self.profileIV.layer.cornerRadius = 75
            } else {
                self.profileIV.layer.cornerRadius = 0
            }
        }) // End of closure
    }
    
    // Second example of gesture : the swipe gesture
    // Similarly to the previous example, you also have to write an @objc function
    // Instead of using a closure, you can also use a function as a parameter of animations
    @objc func swipeGesture() { // for swipe gesture
        UIView.animate(withDuration: 1, animations: swipeAnimation)
    }
    // but you have to explicitely write the function
    func swipeAnimation() {
        if self.profileIV.alpha == 0 {
            self.profileIV.alpha = 1
        }
        else {
            self.profileIV.alpha = 0
        }
    }
    
    // 3 - Touches are the third possibility to interact with the UI
    // see https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_touches_in_your_view for details
    // You have to explicitely write 3 functions named
    // touchesBegan, touchesMoved and touchesEnded
    // All the 3 functions have two parameters: a set of touches and an event
    // For each of these functions, we have to look at the first element of the set of touches.
    
    
    // Used for storing the initial location of profile Image View
    // Defined as an optional (init value = nil)
    var center: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if first exist
        if let first = touches.first {
            // if the touch is in the profileIV
            if first.view == profileIV {
                // we store the initial position of profileIV
                center = profileIV.center
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if first exist
        if let first = touches.first {
            // if the touch is in the profileIV
            if first.view == profileIV {
                // We put profileIV at the location of the touch on the view
                profileIV.center = first.preciseLocation(in: self.view)
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if first exist
        if let first = touches.first {
            // if the touch is in the profileIV
            if first.view == profileIV {
                if center != nil {
                    // we put profileIV at its initial position
                    profileIV.center = center!
                }
            }
        }
    }
    
    
    // The viewDidLoad function is very important
    // It is called after the allocation of the view and just before the display.
    // So we can customize the view or add any programmatic object.
    override func viewDidLoad() {
        // We call the viewDidLoad function of the mother class (UIViewController in this case)
        super.viewDidLoad()
        
        // We customize the storybuttons and the two other buttons
        storyButton.layer.cornerRadius = 15
        for button in OtherButtons {
            if button.tag == 0 {
                button.layer.cornerRadius = 5
            }
            else {
                button.layer.cornerRadius=10
            }
        }
        // The profileIV image is rouded
        profileIV.layer.cornerRadius = 75
        // We add a white border color
        profileIV.layer.borderColor = UIColor.white.cgColor
        profileIV.layer.borderWidth = 5
        
        // We authorize interaction with coverIV
        coverIV.isUserInteractionEnabled = true
        
        // We add the gestures: tap and swipe
        // Step 1: Creation of UITapGestureRecognizer and UISwipeGestureRecognizer associated with 2 specific functions (tapGesture and swipeGesture)
        // Step 2: Add the gesture recognizer to the coverIV view
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        coverIV.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        coverIV.addGestureRecognizer(swipe)
    }
}

