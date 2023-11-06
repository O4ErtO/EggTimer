//
//  ViewController.swift
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let progressBar = UIProgressView()
    var timer: Timer?
    var time: TimeInterval = 300 // 5 minutes in seconds
    var elapsedTime: TimeInterval = 0
    var isActive = false
    let LabelTime  = UILabel()
    
    
    let fontForText = UIFont(name: "Helvetica", size: 40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            CreateALabel(text: "How do you like your eggs")
            creatImages(images: ["soft_egg", "medium_egg", "hard_egg"])
            createButtons(titles: ["soft", "medium", "hard"])

        
            progressBarFucn(time: Int(time))

        
        
        
        
    }
    
    func CreateALabel(text: String) {
        let label = UILabel(text: text, font: fontForText , textColor: .white, textAligment: .center, numberOfLines: 1)
        
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.width.equalTo(400)
            $0.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    
    func creatImages(images: [String]) {
        let container = UIView()
        view.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        for (index, image) in images.enumerated() {
            var imagec = UIImageView(image: UIImage(named: image))
            imagec.contentMode = .scaleAspectFit
            container.addSubview(imagec)
            
            imagec.snp.makeConstraints { make in
                make.height.width.equalTo(130)
                make.centerY.equalToSuperview()
                if index == 0 {
                    make.leading.equalToSuperview().offset(20)
                } else {
                    make.leading.equalTo(container.subviews[index - 1].snp.trailing).offset(10)
                }
            }
        }
    }
    
    func createButtons(titles: [String]) {
        let container = UIView()
        view.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        for (index, title)  in titles.enumerated() {
            var button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            
            switch title {
            case "soft":
                button.addTarget(self, action: #selector(button1(_:)), for: .touchUpInside)
            case "medium":
                button.addTarget(self, action: #selector(button2(_:)), for: .touchUpInside)
            case "hard":
                button.addTarget(self, action: #selector(button3(_:)), for: .touchUpInside)
            default:
                print("Non-button")
            }
            
            container.addSubview(button)
            
            
            button.snp.makeConstraints { make in
                make.height.width.equalTo(130)
                make.centerY.equalToSuperview()
                
                if index == 0 {
                    make.leading.equalToSuperview().offset(20)
                } else {
                    make.leading.equalTo(container.subviews[index - 1].snp.trailing).offset(10)
                }
            }
        }
    }
    @objc func button1(_ sender: UIButton) {
        time = 300
        isActive = true
        // Обновить "time" на новое значение
        updateProgress()
          elapsedTime = 0
          progressBar.progress = 0.0
          
          // Если таймер уже запущен, остановить его и запустить заново.
          timer?.invalidate()
          startTimer()
    }
    
    @objc func button2(_ sender: UIButton) {
        time = 560
        isActive = true
        // Обновить "time" на новое значение
        updateProgress()
          elapsedTime = 0
          progressBar.progress = 0.0
          
          // Если таймер уже запущен, остановить его и запустить заново.
          timer?.invalidate()
          startTimer()
    }
    
    @objc func button3(_ sender: UIButton) {
        time = 720
        isActive = true
        // Обновить "time" на новое значение
        updateProgress()
          elapsedTime = 0
          progressBar.progress = 0.0
          
          // Если таймер уже запущен, остановить его и запустить заново.
          timer?.invalidate()
          startTimer()
    }
    
    func progressBarFucn(time: Int) {
        view.addSubview(progressBar)
        
        progressBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.width.equalToSuperview().inset(20)
        }
        
        // Set progress bar properties
        progressBar.progressTintColor = .blue
        progressBar.progress = 0
        
    }
    
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    @objc func updateProgress() {
       
        LabelTime.text = "0"
        LabelTime.textColor = .white
        LabelTime.font = UIFont(name: "Helvetica", size: 90)
        LabelTime.textAlignment = .center
        view.addSubview(LabelTime)
        
        LabelTime.snp.makeConstraints { make in
            make.height.width.equalTo(300)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX).offset(+10)
            make.bottom.equalToSuperview().offset(-150)
           
        }
        
        if elapsedTime >= time {
            // Timer finished
            timer?.invalidate()
            timer = nil
            progressBar.progress = 1.0
        } else {
            elapsedTime += 1.0
            let remainingTime = self.time - self.elapsedTime
            LabelTime.text = self.createCurrentTime(Int(remainingTime))
            let progress = Float(elapsedTime / time)
            progressBar.progress = progress
        }
    }
    
    func createCurrentTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}



