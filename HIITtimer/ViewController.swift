import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trainingTime: UILabel!
    @IBOutlet weak var intervalTime: UILabel!
    var trainingTotalTime = 20
    var intervalTotalTime = 10
    var tTimer = Timer()
    var iTimer = Timer()
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        tTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTrainingTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        
        tTimer.invalidate()
        iTimer.invalidate()
        trainingTotalTime = 20
        intervalTotalTime = 10
    
    }
    
    @objc func updateTrainingTimer() {
        
        if trainingTotalTime > 0{
            trainingTotalTime -= 1
            trainingTime.text = "\(trainingTotalTime) s"
        } else {
            tTimer.invalidate()
            trainingTotalTime = 20
            trainingTime.text = "\(trainingTotalTime) s"
        }
        
        if trainingTotalTime == 0{
            iTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateIntervalTimer), userInfo: nil, repeats: true)
        }
    
    }
    
    @objc func updateIntervalTimer() {
        
        if intervalTotalTime > 0{
            intervalTotalTime -= 1
            intervalTime.text = "\(intervalTotalTime) s"
        } else {
            iTimer.invalidate()
            intervalTotalTime = 10
            intervalTime.text = "\(intervalTotalTime) s"
        }
        
        if intervalTotalTime == 0{
            tTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTrainingTimer), userInfo: nil, repeats: true)
        }
        
    }
    
}

