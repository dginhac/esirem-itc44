//
//  ViewController.swift
//  eggTimer
//
//  Created by d0m on 30/11/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    let recipesText: [String] = [
        "Bienvenue sur eggTimer!\n\nDe nos jours, faire cuire des oeufs se décline en de multiples manières : oeufs brouillés, durs, mollets, au four…\n\nLes recettes à base de cet aliment extraordinaire sont innombrables et eggTimer vous apporte les réponses à beaucoup de questions que l’on peut se poser lorsque l’on cuisine des oeufs : leur temps de cuisson, les techniques de préparation, …\n\n Bonne visite !",
        "1. Placer les oeufs dans une casserole \n2. Ajouter un filet de vinaigre blanc \n3. Faire chauffer jusqu’au frémissement de l’eau, puis déclencher votre chronomètre en réduisant un peu le feu \n4. Compter un temps de cuisson de 10 minutes \n5. En fin de cuisson, placer les oeufs durs dans l’eau froide \n",
        "1. Remplir une casserole d’eau et la monter à ébullition \n2. Verser un filet de vinaigre, afin de limiter la fuite du blanc si les œufs se craquellent \n3. Plonger les œufs dans l’eau bouillante, puis déclencher votre chronomètre en réduisant le feu, pour 3 minutes \n4. En fin de cuisson, retirer délicatement les œufs coque puis les placer dans des coquetiers individuels, pointe en haut \n5. Avec un petit couteau pointu, couper le « chapeau » de chaque œuf, puis servir immédiatement, agrémenté de fleur de sel",
        "1. Placer les oeufs dans une casserole puis les couvrir d’eau froide \n2. Verser un filet de vinaigre, afin de limiter la fuite du blanc si les oeufs se craquellent \n3. Faire chauffer jusqu’à ce que l’eau frémisse, puis déclencher votre chronomètre en réduisant la cuisson \n4. Compter un temps de cuisson de 5 minutes  \n5. En fin de cuisson, placer délicatement les oeufs mollets dans un saladier d’eau froide \n"]
    
    let recipes = ["Faites votre choix", "Oeuf dur", "Oeuf à la coque", "Oeuf mollet"]
    
    let startTimes = [0, 600, 180, 300]
    
    var timer = Timer()
    var startTime = 0
    
    var player: AVAudioPlayer?
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var recipeText: UITextView!
    @IBOutlet weak var recipePicker: UIPickerView!
    
    var isRunning = false
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recipes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return recipes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        recipeText.text = recipesText[row]
        startTime = startTimes[row]
        let minutes = startTimes[row]/60
        let seconds = startTimes[row]%60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        startButton.isEnabled = true
        
    }
    
    @objc func updateTimer() {
        if (startTime > 0) {
            startTime -= 1
            let minutes = startTime/60
            let seconds = startTime%60
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        }
        else {
            startButton.setImage(UIImage(named: "play"), for: .normal)
            startButton.isEnabled = false
            isRunning = false
            if player != nil {
                player!.play()
            }
            timer.invalidate()
        }
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        if !isRunning {
            startButton.setImage(UIImage(named: "pause"), for: .normal)
            resetButton.isHidden = false
            resetButton.isEnabled = true
            recipePicker.isUserInteractionEnabled = false
            isRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            timer.fire()
            
        }
        else {
            startButton.setImage(UIImage(named: "play"), for: .normal)
            
            isRunning = false
            timer.invalidate()
        }
        
    }
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        if player != nil {
            player!.stop()
        }
        startTime = startTimes[0]
        let minutes = startTime/60
        let seconds = startTime%60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        
        recipeText.text = recipesText[0]
        
        isRunning = false
        recipePicker.selectRow(0, inComponent: 0, animated:true)
        startButton.setImage(UIImage(named: "play"), for: .normal)
        startButton.isEnabled = false
        resetButton.isEnabled = false
        resetButton.isHidden = true
        
        recipePicker.isUserInteractionEnabled = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeText.text = recipesText[0]
        recipePicker.dataSource = self
        recipePicker.delegate = self
        
        startButton.isEnabled = false
        resetButton.isEnabled = false
        resetButton.isHidden = true
        
        let path = Bundle.main.path(forResource: "alarm", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Can't load file :(")
        }
        
    }
    
    


}

