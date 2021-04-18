//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

class FourthViewController: UIViewController {
    var yourAlien: String
    var strength : String
    var weakness : String
    var funfact  : String
    var alienName : String
    
    init(alienChooser: String){
        yourAlien = alienChooser
        strength = alienChooser
        weakness = alienChooser
        funfact = alienChooser
        alienName = alienChooser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        let view = UIView()
        self.view = view
        print("oieeee \(weakness) ")
        
        let cfURL = Bundle.main.url(forResource: "PressStart2P-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        // PressStart2P-Regular
        
        view.layer.contents = UIImage(named:"BG.png")?.cgImage
        
        let image = UIImage(named:"PurpleBar.png")
        let purpleBarView = UIImageView(image:image)
        purpleBarView.frame = CGRect(x: -38, y: -10, width: 450, height: 400)
        
        view.addSubview(purpleBarView)
        
        let imageAlien = UIImage(named: yourAlien)
        let imageAlienView = UIImageView(image:imageAlien)
        imageAlienView.frame = CGRect(x: 124, y: 130, width: 130, height: 130)
        print (yourAlien)
        
        view.addSubview(imageAlienView)
        
        
        let labelYouMet = UILabel()
        labelYouMet.frame = CGRect(x: 90, y: 104, width: 200, height: 24)
        labelYouMet.text = "You met"
        labelYouMet.textColor = .white
        labelYouMet.font = UIFont(name: "PressStart2P-Regular", size: 12)
        labelYouMet.textAlignment = .center
        
        view.addSubview(labelYouMet)
        
        let labelName = UILabel()
        labelName.frame = CGRect(x: 87, y: 256, width: 200, height: 24)
        labelName.text = "\(alienName)"
        labelName.textColor = .white
        labelName.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelName.textAlignment = .center
        
        view.addSubview(labelName)
        
        let labelStrength = UILabel()
        labelStrength.frame = CGRect(x: 8, y: 350, width: 390, height: 40)
        labelStrength.text = "Strength: \(strength)"
        labelStrength.numberOfLines = 2
        labelStrength.textColor = .white
        labelStrength.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelStrength.textAlignment = .left
        
        view.addSubview(labelStrength)
        
        let labelWeakness = UILabel()
        labelWeakness.frame = CGRect(x: 10, y: 415, width: 390, height: 40)
        labelWeakness.text = "Weakness: \(weakness)"
        labelWeakness.numberOfLines = 2
        labelWeakness.textColor = .white
        labelWeakness.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelWeakness.textAlignment = .left
        
        view.addSubview(labelWeakness)
        
        let labelFunFact = UILabel()
        labelFunFact.frame = CGRect(x: 10, y: 480, width: 355, height: 60)
        labelFunFact.text = "Fun fact: \(funfact)"
        labelFunFact.numberOfLines = 3
        labelFunFact.textColor = .white
        labelFunFact.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelFunFact.textAlignment = .left
        
        view.addSubview(labelFunFact)
        
        let againButton = UIButton()
        againButton.frame = CGRect(x: 90, y: 560, width: 200, height: 120)
        againButton.setImage(UIImage(named: "GreenButton.png"), for:.normal)
        againButton.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(againButton)
        self.view = view
        
        let labelAgain = UILabel()
        labelAgain.frame = CGRect(x: 152, y: 593, width: 400, height: 20)
        labelAgain.text = "Again!"
        labelAgain.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelAgain.textColor = UIColor(rgb: 0x5D8E3F)
        
        
        view.addSubview(labelAgain)
        
    }
    
    @objc func tapButton() {
        print("return home")
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

class ThirdViewController: UIViewController {
    
    var customizePlanet: [String] = ["","","","",""]
    var purpleButton = UIButton()
    var blueButton = UIButton()
    var redButton = UIButton()
    var pinkButton = UIButton()
    var greenButton = UIButton()
    var finishButton = UIButton()
    
    var planetType = UIImageView()
    var ringType = UIImageView()
    var moonType = UIImageView()
    var alienType = ""
    var alienNameType = ""
    var alienStrengthType = ""
    var alienWeaknessType = ""
    var alienFunFactType = ""
    
    var wholePlanet: [Bool] = [false,false,false]
    
    override func viewDidLoad() {
        let view = UIView()
        self.view = view
        
        
        let cfURL = Bundle.main.url(forResource: "PressStart2P-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        // PressStart2P-Regular
        
        view.layer.contents = UIImage(named:"BG.png")?.cgImage
        
        planetType.frame = CGRect(x: 70, y: 190, width: 280, height: 280)
        ringType.frame = CGRect(x: 25, y: 138, width: 375, height: 375)
        moonType.frame = CGRect(x: 280, y: 230, width: 40, height: 40)
        
        view.addSubview(planetType)
        view.addSubview(ringType)
        view.addSubview(moonType)
        
        let image = UIImage(named:"Bar1.png")
        let sideBarView = UIImageView(image:image)
        sideBarView.frame = CGRect(x: -45, y: 56, width: 450, height: 500)
        
        view.addSubview(sideBarView)
        
        let image2 = UIImage(named:"bottomBar.png")
        let bottomBarView = UIImageView(image:image2)
        bottomBarView.frame = CGRect(x: -48, y: 290, width: 450, height: 400)
        
        view.addSubview(bottomBarView)
        
        let defaultPlanetButton = UIButton()
        defaultPlanetButton.frame = CGRect(x: -13, y: 135, width: 100, height: 100)
        defaultPlanetButton.setImage(UIImage(named: "DefaultPlanet.png"), for:.normal)
        defaultPlanetButton.addTarget(self, action:#selector(tapPlanetButton), for: .touchUpInside)
        
        view.addSubview(defaultPlanetButton)
        self.view = view
        
        let defaultRingButton = UIButton()
        defaultRingButton.frame = CGRect(x: -3, y: 275, width: 80, height: 80)
        defaultRingButton.setImage(UIImage(named: "DefaultRing.png"), for:.normal)
        defaultRingButton.addTarget(self, action:#selector(tapRingButton), for: .touchUpInside)
        
        view.addSubview(defaultRingButton)
        self.view = view
        
        let defaultMoonButton = UIButton()
        defaultMoonButton.frame = CGRect(x: -13, y: 390, width: 100, height: 100)
        defaultMoonButton.setImage(UIImage(named: "DefaultMoon.png"), for:.normal)
        defaultMoonButton.addTarget(self, action:#selector(tapMoonButton), for: .touchUpInside)
        
        view.addSubview(defaultMoonButton)
        self.view = view
        
        finishButton = UIButton()
        finishButton.frame = CGRect(x: 260, y: 32, width: 115, height: 115)
        finishButton.setImage(UIImage(named: "FinishButton.png"), for:.normal)
        finishButton.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        finishButton.isEnabled = false
        
        view.addSubview(finishButton)
        self.view = view
        
        
        greenButton.frame = CGRect(x: 0, y: 570, width: 100, height: 100)
        greenButton.setImage(UIImage(named: customizePlanet[0]), for:.normal)
        greenButton.addTarget(nil, action: #selector(tapGreenStuff), for: .touchUpInside)
        
        view.addSubview(greenButton)
        self.view = view
        
        
        pinkButton.frame = CGRect(x: 70, y: 570, width: 100, height: 100)
        pinkButton.setImage(UIImage(named: customizePlanet[1]), for:.normal)
        pinkButton.addTarget(nil, action: #selector(tapPinkStuff), for: .touchUpInside)
        
        view.addSubview(pinkButton)
        self.view = view
        
        
        redButton.frame = CGRect(x: 140, y: 570, width: 100, height: 100)
        redButton.setImage(UIImage(named: customizePlanet[2]), for:.normal)
        redButton.addTarget(nil, action: #selector(tapRedStuff), for: .touchUpInside)
        
        view.addSubview(redButton)
        self.view = view
        
        
        blueButton.frame = CGRect(x: 210, y: 570, width: 100, height: 100)
        blueButton.setImage(UIImage(named: customizePlanet[3]), for:.normal)
        blueButton.addTarget(nil, action: #selector(tapBlueStuff), for: .touchUpInside)
        
        view.addSubview(blueButton)
        self.view = view
        
        
        purpleButton.frame = CGRect(x: 280, y: 570, width: 100, height: 100)
        purpleButton.setImage(UIImage(named: customizePlanet[4]), for:.normal)
        purpleButton.addTarget(nil, action: #selector(tapPurpleStuff), for: .touchUpInside)
        
        view.addSubview(purpleButton)
        self.view = view
        
    }
    
    func updateButtons () {
        purpleButton.setImage(UIImage(named: customizePlanet[4]), for: .normal)
        print(customizePlanet)
        blueButton.setImage(UIImage(named: customizePlanet[3]), for: .normal)
        print(customizePlanet)
        redButton.setImage(UIImage(named: customizePlanet[2]), for: .normal)
        print(customizePlanet)
        pinkButton.setImage(UIImage(named: customizePlanet[1]), for: .normal)
        print(customizePlanet)
        greenButton.setImage(UIImage(named: customizePlanet[0]), for: .normal)
        print(customizePlanet)
    }
    
    @objc func tapPlanetButton() {
        print("Touched the planet button")
        customizePlanet [0] = "GreenPlanet.png"
        customizePlanet [1] = "PinkPlanet.png"
        customizePlanet [2] = "RedPlanet.png"
        customizePlanet [3] = "BluePlanet.png"
        customizePlanet [4] = "PurplePlanet.png"
        updateButtons()
        
    }
    
    @objc func tapRingButton() {
        print("Touched the ring button")
        customizePlanet [0] = "GreenRing.png"
        customizePlanet [1] = "PinkRing.png"
        customizePlanet [2] = "RedRing.png"
        customizePlanet [3] = "BlueRing.png"
        customizePlanet [4] = "PurpleRing.png"
        updateButtons()
        
    }
    
    @objc func tapMoonButton() {
        print("Touched the moon button")
        customizePlanet [0] = "GreenMoonButton (1).png"
        customizePlanet [1] = "PinkMoonButton (1).png"
        customizePlanet [2] = "RedMoonButton (1).png"
        customizePlanet [3] = "BlueMoonButton (1).png"
        customizePlanet [4] = "PurpleMoonButton (1).png"
        updateButtons()
    }
    
    @objc   func tapButton() {
        print("Touched the finish button")
        print(alienType)
        let fourthViewController = FourthViewController(alienChooser: alienType)
        fourthViewController.alienName = alienNameType
        fourthViewController.weakness = alienWeaknessType
        fourthViewController.funfact = alienFunFactType
        fourthViewController.strength = alienStrengthType
        fourthViewController.modalPresentationStyle = .fullScreen
        self.present(fourthViewController, animated: true)
    }
    
    @objc func tapGreenStuff() {
        if customizePlanet[0] == "GreenPlanet.png"{
            print("Touched green planet")
            planetType.image = greenButton.image(for: .normal)
            alienType = "Jose.png"
            alienNameType = "José"
            alienStrengthType = "Great artist!"
            alienWeaknessType = "Dust allergy *atchoo*."
            alienFunFactType = "Has a turtle and eats cereal with water."
            if wholePlanet[0] == false{
                wholePlanet[0] = true
            }
            
            }
        
        else if customizePlanet[0] == "GreenRing.png" {
            ringType.image = greenButton.image(for: .normal)
            print("Touched green ring")
            
            if wholePlanet[1] == false{
                wholePlanet[1] = true
            }
        }
        
        else {
            moonType.image = greenButton.image(for: .normal)
            print("Touched green moon")
            
            if wholePlanet[2] == false{
                wholePlanet[2] = true
            }
        }
        if wholePlanet[0] && wholePlanet[1] && wholePlanet[2] {
            finishButton.isEnabled = true
        }
        
    }
    
    @objc func tapPinkStuff() {
        
        if customizePlanet[1] == "PinkPlanet.png"{
            print("Touched pink planet")
            planetType.image = pinkButton.image(for: .normal)
            alienType = "Karla.png"
            alienNameType = "Karla"
            alienStrengthType = "Sooo funny!"
            alienWeaknessType = "Anger issues."
            alienFunFactType = "Loves self-help books and to watch TV at 4AM."
            if wholePlanet[0] == false{
                wholePlanet[0] = true
            }
            
        }
        else if customizePlanet[1] == "PinkRing.png" {
            ringType.image = pinkButton.image(for: .normal)
            print("Touched pink ring")
            if wholePlanet[1] == false{
                wholePlanet[1] = true
            }
        }
        
        else {
            moonType.image = pinkButton.image(for: .normal)
            print("Touched pink moon")
            if wholePlanet[2] == false{
                wholePlanet[2] = true
            }
        }
        if wholePlanet[0] && wholePlanet[1] && wholePlanet[2] {
            finishButton.isEnabled = true
        }
        
    }
    
    @objc func tapRedStuff() {
        if customizePlanet[2] == "RedPlanet.png"{
            print("Touched red planet")
            planetType.image = redButton.image(for: .normal)
            alienType = "Oswald.png"
            alienNameType = "Oswald"
            alienStrengthType = "Likes soap operas."
            alienWeaknessType = "Writes bad fanfics. (Really bad ones)."
            alienFunFactType = "Really enjoys listening to abandoned radio stations."
            if wholePlanet[0] == false{
                wholePlanet[0] = true
            }
            
        }
        else if customizePlanet[2] == "RedRing.png" {
            ringType.image = redButton.image(for: .normal)
            print("Touched red ring")
            if wholePlanet[1] == false{
                wholePlanet[1] = true
            }
        }
        
        else {
            moonType.image = redButton.image(for: .normal)
            print("Touched red moon")
            if wholePlanet[2] == false{
                wholePlanet[2] = true
            }
            if wholePlanet[0] && wholePlanet[1] && wholePlanet[2] {
                finishButton.isEnabled = true
            }
        }
        
    }
    
    @objc func tapBlueStuff() {
        if customizePlanet[3] == "BluePlanet.png"{
            print("Touched blue planet")
            planetType.image = blueButton.image(for: .normal)
            alienType = "Pedra.png"
            alienNameType = "Pedra"
            alienStrengthType = "Mysterious."
            alienWeaknessType = "Mysterious. (Way too much)."
            alienFunFactType = "Has a a stone as a pet named Pedro."
            if wholePlanet[0] == false{
                wholePlanet[0] = true
            }
            
        }
        else if customizePlanet[3] == "BlueRing.png" {
            ringType.image = blueButton.image(for: .normal)
            print("Touched blue ring")
            
            if wholePlanet[1] == false{
                wholePlanet[1] = true
            }
        }
        
        else {
            moonType.image = blueButton.image(for: .normal)
            print("Touched blue moon")
            
            if wholePlanet[2] == false{
                wholePlanet[2] = true
            }
            if wholePlanet[0] && wholePlanet[1] && wholePlanet[2] {
                finishButton.isEnabled = true
            }
        }
        
    }
    
    @objc func tapPurpleStuff() {
        if customizePlanet[4] == "PurplePlanet.png"{
            print("Touched purple planet")
            planetType.image = purpleButton.image(for: .normal)
            alienType = "Olivia.png"
            alienNameType = "Olivia"
            alienStrengthType = "Has a lot of Christmas socks."
            alienWeaknessType = "Way too quiet... (what is she thinking?)."
            alienFunFactType = "Listens to death metal when no one's watching."
            if wholePlanet[0] == false{
                wholePlanet[0] = true
            }
            
        }
        else if customizePlanet[4] == "PurpleRing.png" {
            ringType.image = purpleButton.image(for: .normal)
            print("Touched purple ring")
            
            if wholePlanet[1] == false{
                wholePlanet[1] = true
            }
        }
        
        else {
            moonType.image = purpleButton.image(for: .normal)
            print("Touched purple moon")
            
            if wholePlanet[2] == false{
                wholePlanet[2] = true
            }
            if wholePlanet[0] && wholePlanet[1] && wholePlanet[2] {
                finishButton.isEnabled = true
            }
        }
        
    }
    
}
class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        let view = UIView()
        self.view = view
        
        let cfURL = Bundle.main.url(forResource: "PressStart2P-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        // PressStart2P-Regular
        
        view.layer.contents = UIImage(named:"BG.png")?.cgImage
        
        let image = UIImage(named:"PurpleBar.png")
        let purpleBarView = UIImageView(image:image)
        purpleBarView.frame = CGRect(x: -38, y: 80, width: 450, height: 400)
        
        view.addSubview(purpleBarView)
        
        let labelHello = UILabel()
        labelHello.frame = CGRect(x: 60, y: 190, width: 260, height: 72)
        labelHello.numberOfLines = 2
        labelHello.textAlignment = .center
        labelHello.text = "Hello, dear earth friend!"
        labelHello.textColor = .white
        labelHello.font = UIFont(name: "PressStart2P-Regular", size: 14)
        
        view.addSubview(labelHello)
        
        let labelMessage = UILabel()
        labelMessage.frame = CGRect(x: 43, y: 246, width: 280, height: 80)
        labelMessage.numberOfLines = 4
        labelMessage.textAlignment = .center
        labelMessage.text = "Are you ready to meet new friends from outerspace? Just make a planet as you wish!"
        labelMessage.textColor = .white
        labelMessage.font = UIFont(name: "PressStart2P-Regular", size: 10)
        
        view.addSubview(labelMessage)
        
        let labelMinutes = UILabel()
        labelMinutes.frame = CGRect(x: 58, y: 310, width: 260, height: 72)
        labelMinutes.numberOfLines = 1
        labelMinutes.textAlignment = .center
        labelMinutes.text = "Have fun!"
        labelMinutes.textColor = .white
        labelMinutes.font = UIFont(name: "PressStart2P-Regular", size: 14)
        
        view.addSubview(labelMinutes)
        
        let gotItButton = UIButton()
        gotItButton.frame = CGRect(x: 90, y: 500, width: 200, height: 120)
        gotItButton.setImage(UIImage(named: "GreenButton.png"), for:.normal)
        gotItButton.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(gotItButton)
        self.view = view
        
        let labelGotIt = UILabel()
        labelGotIt.frame = CGRect(x: 144, y: 534, width: 400, height: 20)
        labelGotIt.text = "Got it!"
        labelGotIt.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelGotIt.textColor = UIColor(rgb: 0x5D8E3F)
        
        
        view.addSubview(labelGotIt)
        
    }
    
    @objc func tapButton() {
        print("Touched the got it button")
        let thirdViewController = ThirdViewController()
        thirdViewController.modalPresentationStyle = .fullScreen
        self.present(thirdViewController, animated: true)
    }
    
}
class MyViewController : UIViewController {
    override func viewDidLoad() {
        let view = UIView()
        let cfURL = Bundle.main.url(forResource: "PressStart2P-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        // PressStart2P-Regular
        
        view.layer.contents = UIImage(named:"BG.png")?.cgImage
        
        let image = UIImage(named:"PurpleBar.png")
        let purpleBarView = UIImageView(image:image)
        purpleBarView.frame = CGRect(x: -38, y: 80, width: 450, height: 400)
        
        view.addSubview(purpleBarView)
        
        let imageKarla = UIImage(named:"Karla.png")
        let karlaView = UIImageView(image:imageKarla)
        karlaView.frame = CGRect(x: 55, y: 400, width: 60, height: 60)
        
        view.addSubview(karlaView)
        
        let imageOlivia = UIImage(named:"Olivia.png")
        let oliviaView = UIImageView(image:imageOlivia)
        oliviaView.frame = CGRect(x: 107, y: 403, width: 60, height: 60)
        
        view.addSubview(oliviaView)
        
        let imageOswald = UIImage(named:"Oswald.png")
        let oswaldView = UIImageView(image:imageOswald)
        oswaldView.frame = CGRect(x: 160, y: 398, width: 60, height: 60)
        
        view.addSubview(oswaldView)
        
        let imageJose = UIImage(named:"Jose.png")
        let joseView = UIImageView(image:imageJose)
        joseView.frame = CGRect(x: 210, y: 404, width: 60, height: 60)
        
        view.addSubview(joseView)
        
        let imagePedra = UIImage(named:"Pedra.png")
        let pedraView = UIImageView(image:imagePedra)
        pedraView.frame = CGRect(x: 260, y: 400, width: 60, height: 60)
        
        view.addSubview(pedraView)
        
        let labelTitle = UILabel()
        labelTitle.frame = CGRect(x: 97, y: 205, width: 200, height: 24)
        labelTitle.text = "U.F.O.S."
        labelTitle.textColor = .white
        labelTitle.font = UIFont(name: "PressStart2P-Regular", size: 24)
        labelTitle.textAlignment = .center
        
        
        view.addSubview(labelTitle)
        
        let labelSubtitle = UILabel()
        labelSubtitle.frame = CGRect(x: 59, y: 235, width: 400, height: 20)
        labelSubtitle.text = "Ultra-Fun-Outerspace-Stuff"
        labelSubtitle.textColor = .white
        labelSubtitle.font = UIFont(name: "PressStart2P-Regular", size: 10)
        
        
        view.addSubview(labelSubtitle)
        
        let labelDescription = UILabel()
        labelDescription.frame = CGRect(x: 60, y: 290, width: 260, height: 72)
        labelDescription.numberOfLines = 2
        labelDescription.textAlignment = .center
        labelDescription.text = "Make a planet and discover new outerspace friends!"
        labelDescription.textColor = .white
        labelDescription.font = UIFont(name: "PressStart2P-Regular", size: 10)
        
        
        view.addSubview(labelDescription)
        
        let purpleImage = UIImageView()
        UIImage(contentsOfFile: "PurpleBar.png")
        purpleImage.frame = CGRect(x: 10, y: 50, width: 400, height: 400)
        
        view.addSubview(purpleImage)
        
        let playButton = UIButton()
        playButton.frame = CGRect(x: 90, y: 500, width: 200, height: 120)
        playButton.setImage(UIImage(named: "GreenButton.png"), for:.normal)
        playButton.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(playButton)
        self.view = view
        
        let labelPlay = UILabel()
        labelPlay.frame = CGRect(x: 162, y: 532, width: 400, height: 20)
        labelPlay.text = "Play"
        labelPlay.font = UIFont(name: "PressStart2P-Regular", size: 14)
        labelPlay.textColor = UIColor(rgb: 0x5D8E3F)
        
        
        view.addSubview(labelPlay)
        
        
    }
    @objc func tapButton() {
        print("Touched the play button")
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
/*

## Credits
 I did the design by myself and all the visual assets are made by me but the custom font I used in this project is not authored by me. So, I leave available here the place where I downloaded the font and also a big thanks to CodeMan38 who created it and made it available for free: https://fonts.google.com/specimen/Press+Start+2P?query=CodeMan38
 This font was chosen mainly due to the nostalgic aesthetic of the game.
 
 /**/*/
