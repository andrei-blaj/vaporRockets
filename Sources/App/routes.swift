import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get("/") { request -> Future<View> in
        
        let homeData = HomeData(
            title: "Home"
        )
        
        return try request.view().render("home", homeData)
    }
    
    router.get("/rockets") { request -> Future<View> in
        
        let falcon1 = Rocket(
            name: "Falcon 1",
            imageUrl: "https://img.icons8.com/plasticine/2x/rocket.png",
            active: false
        )
        
        let falcon9 = Rocket(
            name: "Falcon 9",
            imageUrl: "https://img.icons8.com/plasticine/2x/rocket.png",
            active: true
        )
        
        let falconHeavy = Rocket(
            name: "Falcon Heavy",
            imageUrl: "https://img.icons8.com/plasticine/2x/rocket.png",
            active: true
        )
        
        let starship = Rocket(
            name: "Starship",
            imageUrl: "https://img.icons8.com/plasticine/2x/rocket.png",
            active: false
        )
        
        let rocketsData = RocketsData(
            title: "Rockets",
            rocketList: [falcon1, falcon9, falconHeavy, starship]
        )
        
        return try request.view().render("rockets", rocketsData)
    }
    
}

struct Rocket: Encodable {
    let name: String
    let imageUrl: String
    let active: Bool
}

struct RocketsData: Encodable {
    let title: String
    let rocketList: [Rocket]
}

struct HomeData: Encodable {
    let title: String
}
