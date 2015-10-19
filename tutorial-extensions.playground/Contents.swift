extension String {
    
    var letters:[String] {
        return self.characters.map { String($0) }
    }
    
}

let hello = "Hello world!"
print(hello.letters)

extension Int {
    
    var digits:[Int] {
        return String(self).letters.flatMap { Int($0) }
    }
    
}

let number = 314
print(number.digits)

extension String {
    
    var digits:[Int] {
        return self.letters.flatMap { Int($0) }
    }
    
}

let code = "X4Z3-82b"
print(code.digits)

extension String {
    
    var withoutDigits:[String] {
        return self.letters.filter { Int($0) == nil }
    }
    
}

print(code.withoutDigits)

extension String {
    
    var acronym:String {
        return self.withoutDigits.filter { $0 != " " }.filter { $0 == $0.uppercaseString }.joinWithSeparator("")
    }
    
}

let title = "Industrial Light and Magic 1992"
print(title.acronym)

extension CollectionType where Generator.Element == String {
    
    var arraysOfLetters:[[String]] {
        return self.flatMap { $0.letters }
    }
    
    var letters:[String] {
        return Array(self.arraysOfLetters.flatten())
    }
    
}

let words = ["Hello", "world!"]
print(words.arraysOfLetters)
print(words.letters)

print("---")

struct Movie: CustomStringConvertible {
    
    var title:String
    var year:Int

}

extension Movie {
    var description:String {
        return "\(title) (\(year))"
    }
}

extension CollectionType where Generator.Element: CustomStringConvertible {
    var descriptions:[String] {
        return self.map { $0.description }
    }
}

extension CollectionType where Generator.Element == Int {
    
    var uniques:[Int] {
        return Array(Set(self))
    }
    
}

extension CollectionType where Generator.Element == Movie {
    
    var years:[Int] {
        return self.map { $0.year }
    }
    
    var titles:[String] {
        return self.map { $0.title }
    }
    
    func from(year:Int) -> [Movie] {
        return self.filter { $0.year == year }
    }
    
    func before(year:Int) -> [Movie] {
        return self.filter { $0.year < year }
    }
    
    var byYear:[Movie] {
        return self.sort { $0.year < $1.year }
    }
    
}

let movies = [
    Movie(title: "Ghostbusters", year: 1984),
    Movie(title: "Gremlins", year: 1984),
    Movie(title: "Aliens", year: 1986),
    Movie(title: "Bram Stoker's Dracula", year: 1992),
    Movie(title: "Beverly Hills Cop", year: 1984),
    Movie(title: "2001, A Space Odyssey", year: 1968),
    Movie(title: "Basic Instinct", year: 1992),
    Movie(title: "X-Men", year: 2000),
    Movie(title: "Gladiator", year: 2000),
    Movie(title: "The Exorcist", year: 1973)
]

let uniqueYears = movies.years.uniques.sort()
let yearsList = Array(uniqueYears.dropLast()).map { String($0) }.joinWithSeparator(", ")
print("Ces \(movies.count) films sont sortis en \(yearsList) et \(uniqueYears.last!).")

let year = 1986
let moviesBefore = movies.before(year)
let list1986 = moviesBefore.byYear.descriptions.joinWithSeparator("\n")
print("Parmi eux, \(moviesBefore.count) sont d'avant \(year):\n\(list1986)")

print("---")

struct MovieA {
    
    var title:String
    var year:Int
    
    var description:String {
        return "\(title) (\(year))"
    }
    
}

let bttfA = MovieA(title: "Back to the Future", year: 1985)
print(bttfA)


struct MovieB: CustomStringConvertible {
    
    var title:String
    var year:Int
    
    var description:String {
        return "\(title) (\(year))"
    }
    
}

let bttfB = MovieB(title: "Back to the Future", year: 1985)
print(bttfB)

print("I love \(bttfA)")
print("I love \(bttfB)")

