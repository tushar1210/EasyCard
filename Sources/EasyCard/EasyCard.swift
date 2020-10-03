import Foundation
#if canImport(UIKit)
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
        
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    
    private func setUpView(){
        layer.cornerRadius = 10
        clipsToBounds = true
        typeLabel.textColor = .white
        cardNumberLabel.textColor = .white
        dateLabel.textColor = .white
        nameLabel.textColor = .white
    }
    
    func setCornerRadius(_ radius:CGFloat){
        layer.cornerRadius = radius
    }
    
    ///Accepts optipnal gradient colors and applies them on the card else generates a random gradient from gradientArray
    func generateGradient(_ gradientColors:[UIColor]?){
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
    
    
    
    
}


#endif


