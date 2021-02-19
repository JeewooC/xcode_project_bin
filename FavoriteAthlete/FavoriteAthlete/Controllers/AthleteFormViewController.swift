//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Jeewoo Chung on 9/10/19.
//

import UIKit

class AthleteFormViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var disciplineTextField: UITextField!
    @IBOutlet var nationalityTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    var athlete: Athlete?

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let age = Int(ageTextField.text!),
            let discipline = disciplineTextField.text,
            let nationality = nationalityTextField.text,
            let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, discipline: discipline, team: team, nationality: nationality)
        
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        if let ath: Athlete = athlete {
            nameTextField.text = ath.name
            ageTextField.text = String(ath.age)
            disciplineTextField.text = ath.discipline
            nationalityTextField.text = ath.nationality
            teamTextField.text = ath.team
        }
    }
    

}
