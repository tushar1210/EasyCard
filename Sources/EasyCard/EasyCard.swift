import Foundation
import UIKit


class EasyCard:UIView{
    
    //MARK:- Properties
    var shadowView = UIView()
    var logoImageView = UIImageView()
    var typeLabel = UILabel()
    var cardNumberLabel = UILabel()
    var dateLabel = UILabel()
    var nameLabel = UILabel()
    var cardModel = EasyCardModel()

    
    
    //MARK:- Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        addSublayouts()
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        self.frame = frame
        cardModel.frame = frame
        setUpView()
        addSublayouts()
        
    }
    
    //MARK:- Main card view methods
    
    /// Sets up the main card view
    private func setUpView(){
        layer.cornerRadius = 10
        clipsToBounds = true
        typeLabel.textColor = .white
        cardNumberLabel.textColor = .white
        dateLabel.textColor = .white
        nameLabel.textColor = .white
    }
    
    /// Sets up the sub views
    private func addSublayouts(){
        logoImageView.frame = CGRect(x: frame.minX+8, y: frame.minY+5, width: 75, height: 30)
        logoImageView.image = UIImage(named: cardModel.cardImage.rawValue)
        logoImageView.contentMode = .scaleAspectFit
        addSubview(logoImageView)
        
        typeLabel.frame = CGRect(x: frame.midX-35, y: 30, width: 70, height: 20)
        typeLabel.center = CGPoint(x: frame.midX, y: 30)
        typeLabel.attributedText = NSAttributedString(string: cardModel.type!.rawValue, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont(name: "AndaleMono", size: 18)
        typeLabel.adjustsFontSizeToFitWidth = true
        addSubview(typeLabel)
        
        cardNumberLabel.frame = CGRect(x: frame.midX-145 , y: 83, width: 290, height: 25)
        cardNumberLabel.center = CGPoint(x: frame.midX, y: 83)
        cardNumberLabel.text = formatCardNumber(cardModel.cardNumber)
        cardNumberLabel.textAlignment = .center
        cardNumberLabel.font = UIFont(name: "AndaleMono", size: 22)
        cardNumberLabel.adjustsFontSizeToFitWidth = true
        addSubview(cardNumberLabel)
        
        dateLabel.frame = CGRect(x: frame.minX + 15, y: frame.maxY-29, width: 45, height: 17)
        dateLabel.text = cardModel.date
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "AndaleMono", size: 15)
        dateLabel.adjustsFontSizeToFitWidth = true
        addSubview(dateLabel)
        
        nameLabel.frame = CGRect(x: dateLabel.frame.maxX, y: frame.maxY-29, width: cardNumberLabel.frame.width-dateLabel.frame.width, height: 17)
        nameLabel.text = cardModel.name
        nameLabel.textAlignment = .right
        nameLabel.font = UIFont(name: "AndaleMono", size: 15)
        nameLabel.adjustsFontSizeToFitWidth = true
        addSubview(nameLabel)
    }
    
    
    /// Sets CornerRadius for the back
    /// - Parameter radius: CGFloat
    func setCornerRadius(_ radius:CGFloat){
        layer.cornerRadius = radius
    }
    
    /// Accepts optional gradient colors and applies them on the card else generates a random gradient from cardModel.allColors
    /// - Parameter gradientColors: [CGColor]?
    func generateGradient(_ gradientColors:[CGColor]?){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        if let colors = gradientColors{
            gradientLayer.colors = colors
        }else{
            cardModel.random = Int.random(in: Range(uncheckedBounds: (0,cardModel.allColors.count)))
            gradientLayer.colors = cardModel.allColors[cardModel.random]
        }
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        if let lowLayer = layer.sublayers?[0]{
            layer.replaceSublayer(lowLayer, with: gradientLayer)
        }else{
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    /// Add specific gradient
    /// - Parameter gradientLayer: Layer to be inserted at 0
    func addCustomGradientLayer(gradientLayer:CAGradientLayer){
        if let lowLayer = layer.sublayers?[0]{
            layer.replaceSublayer(lowLayer, with: gradientLayer)
        }else{
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    
    //MARK:- cardNumberLabel methods
    private func formatCardNumber(_ number:String)->String{
        if(number=="" || number.count==0 || number.count>17){
            return "••••   ••••   ••••   ••••"
        }
        var formated = ""
        let dif=16-number.count
        var ct=0
        for _ in 0...dif{
            formated.append("•")
        }
        formated.removeLast()
        formated+=number
        var main=""
        for i in formated{
            if(ct==4){
                main+="   "
                ct=0
            }
            main.append(i)
            ct+=1
        }
        return main
    }
    
    func setCardNumber(number:String){
        let formattedString = formatCardNumber(number)
        cardNumberLabel.text = formattedString
    }
    
    //MARK:- logoImageView Methods
    
    /// Sets Card Provider Image
    /// - Parameter image: UIImage  (recommended  ?x? image)
    func setCardProviderImage(image: String){
        logoImageView.image = UIImage(named: image)
    }
    
    //MARK:- nameLabel Methods
    
    /// Set name label
    /// - Parameter name: Name string
    func setupNameHolder(_ name: String){
        nameLabel.text = name
    }
    
    
    
        
    
    
}
