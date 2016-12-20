import UIKit

enum Suit: String {
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
}


enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    //what does stringValue do here? how does it get a value
    
  
    var stringValue: String {
        
        get{
            let stringValue = Rank.ace.rawValue
            
            switch stringValue{
            case 0..<11:
                return self.stringValue
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            case 14:
                return "A"
            default:
                return "unknow"
            }

            
        }
        set{
            stringValue = newValue
        }
        
            }
}

Rank(rawValue: 12)
Rank.ace.stringValue
Rank.king.stringValue = Rank(rawValue: 12)


class Card{
    var myRank = Rank(rawValue: 12)
    
    func printRank(){
        print(myRank!)
    }
    
}

var myCard = Card()

var stringValue1:String


myCard.myRank
stringValue1 = String(describing: myCard.myRank!)
myCard.myRank?.rawValue

stringValue1 == "Queen"

//-------------------------------------------------------------
enum Gender {
    case Male
    case Female
    
}

var foo: Gender

foo = .Female

switch foo {
    
case .Male:
    print("A man")
case .Female:
    print("A Female")
    
}


var playerLevel: String = "Newbie"

switch playerLevel {
case "Newbie": print("You're So New! Welcome")
    
case "Believer": "Keep Traning.  You need it!"
case "Average": "You didn't come here to be average"
case "Epic": "Damn! You're getting Good!"
case "Megastar": "All eyes on you"
default: "Something went wrong"

}


enum experienceLevel: String{
    case Newbie = "You're So New!"
    case Believer = "Welcome, Keep Traning.You need it!"
    case Average = "You didn't come here to be average"
    case Epic = "Damn! You're getting Good!"
    case MegaStar = "All eyes on you"

}


var player1Level: experienceLevel = experienceLevel.Average

switch player1Level {
case .Newbie: "You're So New!"
case .Believer: "Welcome, Keep Traning.You need it!"
case .Average: "You didn't come here to be average"
case .Epic: "Damn! You're getting Good!"
case .MegaStar: "All eyes on you"


var player2Level: experienceLevel = experienceLevel.Average
player2Level.rawValue

}

enum iMacPerformance: String{
    
    case Bad = "ahh hell NAW--NEED RAM!"
    case OK = " But we could  always kick it up a bit"
    case GOOD = "I like what I See"
    case Blazing = "Welcome to the GOOD LIFE"
}

var addRamOrNot:iMacPerformance = iMacPerformance.GOOD
func shouldIAddRam(performance:iMacPerformance){
    print("The iMac current RAM is \(addRamOrNot), \(addRamOrNot.rawValue)")
}
shouldIAddRam(performance: addRamOrNot)
//class practice

class Deck{
    
    var card = Card()
    
    init() {
        
    }
}


enum numberMatch: Int {
    
    case one = 1,two,three,four,five,six,seven,eight,nine,ten,Jack,Queen,King,Ace

    var stringValue:String {
        for i in 2...10 {
            if self.stringValue == String(describing: numberMatch(rawValue: i)!){
                print("here:",self.stringValue)
                return (String(describing: numberMatch(rawValue: i)!))
            }
        }
        return "no match found"
    }

}

