import UIKit

enum Gender {
    case male
    case female
}

protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
    
    func rescue(victimName: String)
}

extension SuperBeing {
    var strength: Int { return 50 }
    var speed: Int { return 50 }
}

class Superhero: SuperBeing {
    let name: String
    let strength: Int
    let speed: Int
    let weakness: String
    let gender: Gender
    let outfitColor: String
    let equipment: String
    let vehicle: String
    
    init(name: String, weakness: String, gender: Gender,
         outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
        self.strength = 34
        self.speed = 34
    }
    
    func rescue(victimName: String) {
        print("The '\(name)' was not afraid of a dangerous situation and the '\(victimName)' saved him from death.")
    }
    
    func combat(villain: SuperVillain) {
        print("'\(name)' tied and defeated '\(villain.name)'")
    }
}

class SuperVillain: SuperBeing {
    let name: String
    let strength: Int
    let speed: Int
    let weakness: String
    let gender: Gender
    let evilScheme: String
    let obsession: String
    let rivalry: String

    init(name: String, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
        self.strength = 34
        self.speed = 34
    }
    
    func rescue(victimName: String) {
        print("The '\(name)' ignored the danger of the situation and '\(victimName)' perished.")
    }
    
    func attack(superhero: Superhero) {
        print("Evil \(name) plans to attack and level the entire city, it is doubtful whether \(superhero.name) will be able to stop it.")
    }
    
    func experimentation(subject: String) {
        print("\(name) is experimenting on vulnerable citizens, his victim is now \(subject)")
    }
}


let superhero1 = Superhero(name: "სპაიდერმენი", weakness: "სიცხე", gender: .male, outfitColor: "წითელი", equipment: "ქვა", vehicle: "პრიუსი")
let superhero2 = Superhero(name: "გელა", weakness: "ნერვები", gender: .male, outfitColor: "შავი", equipment: "კრიალოსანი", vehicle: "ბნვ")
let superhero3 = Superhero(name: "გოგო", weakness: "სიმართლე", gender: .female, outfitColor: "ლურჯი", equipment: "სარკე", vehicle: "მეტრო")
let superhero4 = Superhero(name: "ბეტმენი", weakness: "არაფერი", gender: .male, outfitColor: "შავი", equipment: "პალტო", vehicle: "პიცოტი")
let superhero5 = Superhero(name: "ნინძა", weakness: "ყველა", gender: .male, outfitColor: "თეთრი", equipment: "ქუდი", vehicle: "ბოტასები")
let supervillain1 = SuperVillain(name: "გიო", weakness: "ყველა", gender: .male, evilScheme: "ყველა", obsession: "ყველა", rivalry: "ყველა")
let supervillain2 = SuperVillain(name: "გეგა", weakness: "ყველა", gender: .male, evilScheme: "ყველა", obsession: "ყველა", rivalry: "ყველა")
let supervillain3 = SuperVillain(name: "ლუკაჩო", weakness: "არაფერი", gender: .male, evilScheme: "არაფერი", obsession: "არაფერი", rivalry: "არაფერი")
let supervillain4 = SuperVillain(name: "თეგა", weakness: "არაფერი", gender: .male, evilScheme: "არაფერი", obsession: "არაფერი", rivalry: "არაფერი")

superhero1.rescue(victimName: "ტეკენა")
superhero1.combat(villain: supervillain1)
supervillain1.attack(superhero: superhero1)
supervillain1.experimentation(subject: "საბერძნეთის ნაკრები")
