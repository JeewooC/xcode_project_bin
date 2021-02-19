import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }

    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let formViewController = segue.destination as! AthleteFormViewController
        if segue.identifier == PropertyKeys.editAthleteSegue {
            if let indexPath = tableView.indexPathForSelectedRow {
                formViewController.athlete = athletes[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindToAthleteForm(segue: UIStoryboardSegue) {
        let source = segue.source as! AthleteFormViewController
        guard let name = source.nameTextField.text,
            let age = Int(source.ageTextField.text!),
            let discipline = source.disciplineTextField.text,
            let nationality = source.nationalityTextField.text,
            let team = source.teamTextField.text else {return}
        
        let athlete = Athlete(name: name, age: age, discipline: discipline, team: team, nationality: nationality)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(athlete)
        }
    }

}
