import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trainingTime: UILabel!
    @IBOutlet weak var intervalTime: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    let defaultTrainingTime = 20
    let defaultIntervalTime = 10
    
    var trainingTotalTime = 20
    var intervalTotalTime = 10
    var count = 0
    var tTimer = Timer()
    var iTimer = Timer()
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        tTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTrainingTimer), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
        startButton.alpha = 0
        startButton.setTitle("Restart", for: .normal)
        
        resetButton.isEnabled = false
        resetButton.alpha = 0
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        
        tTimer.invalidate()
        iTimer.invalidate()
        
        startButton.isEnabled = true
        startButton.alpha = 1
        
        resetButton.isEnabled = true
        resetButton.alpha = 1
        
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        tTimer.invalidate()
        iTimer.invalidate()
        
        trainingTotalTime = defaultTrainingTime
        intervalTotalTime = defaultIntervalTime
        trainingTime.text = "\(trainingTotalTime) s"
        intervalTime.text = "\(intervalTotalTime) s"
        
        count = 0
        countLabel.text = String(count)
        
        startButton.setTitle("Start", for: .normal)

        
    }
    
    @objc func updateTrainingTimer() {
        
        if trainingTotalTime > 0{
            trainingTotalTime -= 1
            trainingTime.text = "\(trainingTotalTime) s"
            print(trainingTotalTime)
        } else {
            tTimer.invalidate()
            trainingTotalTime = defaultTrainingTime
            trainingTime.text = "\(trainingTotalTime) s"
        }
        
        if trainingTotalTime == 0{
            iTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateIntervalTimer), userInfo: nil, repeats: true)
        }
        
        countup(trainingTotalTime)
    
        if count == 8 {
            displayAlert()
            
            tTimer.invalidate()
            iTimer.invalidate()
            
            trainingTotalTime = defaultTrainingTime
            intervalTotalTime = defaultIntervalTime
            trainingTime.text = "\(trainingTotalTime) s"
            intervalTime.text = "\(intervalTotalTime) s"
            
            count = 0
            countLabel.text = String(count)
            
            startButton.setTitle("Start", for: .normal)
            startButton.isEnabled = true
            startButton.alpha = 1
            
            resetButton.isEnabled = true
            resetButton.alpha = 1

        }
    }
    
    @objc func updateIntervalTimer() {
        
        if intervalTotalTime > 0{
            intervalTotalTime -= 1
            intervalTime.text = "\(intervalTotalTime) s"
            print(intervalTotalTime)
        } else {
            iTimer.invalidate()
            intervalTotalTime = defaultIntervalTime
            intervalTime.text = "\(intervalTotalTime) s"
        }
        
        if intervalTotalTime == 0{
            tTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTrainingTimer), userInfo: nil, repeats: true)
        }

    }
    
    func countup(_ trainingTotalTime: Int) {
        if trainingTotalTime == 0 {
            count += 1
            countLabel.text = "\(count)"
        }
    }
    
    func displayAlert() {
        let alert = UIAlertController(title: "Finish!", message: nil, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

