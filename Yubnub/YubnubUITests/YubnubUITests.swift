//
//  YubnubUITests.swift
//  YubnubUITests
//
//  Created by Levi Gustin on 7/25/23.
//

import XCTest

final class YubnubUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your
        // tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListView() throws {
        // Main view is presented on open
        let navTitle = app.staticTexts["SWAPI People"]
        XCTAssert(navTitle.exists)

        // List view is populated
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))

        // Navigate to Detail view
        firstRow.tap()
        let detailsTitle = app.staticTexts["Luke Skywalker"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 0.5))

        // Navigate back to List view
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        backButton.tap()
        XCTAssert(navTitle.waitForExistence(timeout: 0.5))
    }

    func testDetailViewForPerson() throws {
        // Navigate to Details view
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))
        firstRow.tap()

        // Verify Person details
        let detailsTitle = app.staticTexts["Luke Skywalker"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 0.5))
        let heightTitle = app.staticTexts["Height"]
        XCTAssert(heightTitle.exists)
        let heightValue = app.staticTexts["172 cm"]
        XCTAssert(heightValue.exists)
        let massTitle = app.staticTexts["Mass"]
        XCTAssert(massTitle.exists)
        let massValue = app.staticTexts["77 kg"]
        XCTAssert(massValue.exists)
        let hairColorTitle = app.staticTexts["Hair color"]
        XCTAssert(hairColorTitle.exists)
        let hairColorValue = app.staticTexts["blond"]
        XCTAssert(hairColorValue.exists)
        let skinColorTitle = app.staticTexts["Skin color"]
        XCTAssert(skinColorTitle.exists)
        let skinColorValue = app.staticTexts["fair"]
        XCTAssert(skinColorValue.exists)
        let eyeColorTitle = app.staticTexts["Eye color"]
        XCTAssert(eyeColorTitle.exists)
        let eyeColorValue = app.staticTexts["blue"]
        XCTAssert(eyeColorValue.exists)
        let birthYearTitle = app.staticTexts["Birth year"]
        XCTAssert(birthYearTitle.exists)
        let birthYearValue = app.staticTexts["19BBY"]
        XCTAssert(birthYearValue.exists)
        let genderTitle = app.staticTexts["Gender"]
        XCTAssert(genderTitle.exists)
        let genderValue = app.staticTexts["male"]
        XCTAssert(genderValue.exists)
        let homeworldTitle = app.staticTexts["Homeworld"]
        XCTAssert(homeworldTitle.exists)
        let homeworldButton = app.buttons["Tatooine"]
        XCTAssert(homeworldButton.waitForExistence(timeout: 5.0))
        let filmsTitle = app.staticTexts["Films"]
        XCTAssert(filmsTitle.exists)
        let filmsButton = app.buttons["A New Hope"]
        XCTAssert(filmsButton.waitForExistence(timeout: 5.0))
        // Need to provide species test once it's easier to navigate to species instead of chaining
        let vehiclesTitle = app.staticTexts["Vehicles"]
        XCTAssert(vehiclesTitle.exists)
        let vehiclesButton = app.buttons["Snowspeeder"]
        XCTAssert(vehiclesButton.waitForExistence(timeout: 5.0))
        let starshipsTitle = app.staticTexts["Starships"]
        XCTAssert(starshipsTitle.exists)
        let starshipsButton = app.buttons["X-wing"]
        XCTAssert(starshipsButton.waitForExistence(timeout: 5.0))
    }

    func testDetailViewForFilm() throws {
        // Navigate to Details view
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))
        firstRow.tap()

        // Navigate to Film details
        let filmsButton = app.buttons["A New Hope"]
        XCTAssert(filmsButton.waitForExistence(timeout: 5.0))
        filmsButton.tap()

        // Verify Film details
        let detailsTitle = app.staticTexts["A New Hope"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 0.5))
        let episodeNumberTitle = app.staticTexts["Episode number"]
        XCTAssert(episodeNumberTitle.exists)
        let episodeNumberValue = app.staticTexts["4"]
        XCTAssert(episodeNumberValue.exists)
        let directorTitle = app.staticTexts["Director"]
        XCTAssert(directorTitle.exists)
        let directorValue = app.staticTexts["George Lucas"]
        XCTAssert(directorValue.exists)
        let producerTitle = app.staticTexts["Producer"]
        XCTAssert(producerTitle.exists)
        let producerValue = app.staticTexts["Gary Kurtz, Rick McCallum"]
        XCTAssert(producerValue.exists)
        let releaseDateTitle = app.staticTexts["Release date"]
        XCTAssert(releaseDateTitle.exists)
        let releaseDateValue = app.staticTexts["1977-05-25"]
        XCTAssert(releaseDateValue.exists)
        let charactersTitle = app.staticTexts["Characters"]
        XCTAssert(charactersTitle.exists)
        let charactersValue = app.buttons["Luke Skywalker"]
        XCTAssert(charactersValue.waitForExistence(timeout: 5.0))

        // Scroll to unhide bottom elements since off screen items don't "exist"
        app.swipeUp()

        let planetsTitle = app.staticTexts["Planets"]
        XCTAssert(planetsTitle.exists)
        let planetsButton = app.buttons["Tatooine"]
        XCTAssert(planetsButton.waitForExistence(timeout: 5.0))
        let starshipsTitle = app.staticTexts["Starships"]
        XCTAssert(starshipsTitle.exists)
        let starshipsButton = app.buttons["CR90 corvette"]
        XCTAssert(starshipsButton.waitForExistence(timeout: 5.0))
        let vehiclesTitle = app.staticTexts["Vehicles"]
        XCTAssert(vehiclesTitle.exists)
        let vehiclesButton = app.buttons["Sand Crawler"]
        XCTAssert(vehiclesButton.waitForExistence(timeout: 5.0))
        let speciesTitle = app.staticTexts["Species"]
        XCTAssert(speciesTitle.exists)
        let speciesButton = app.buttons["Human"]
        XCTAssert(speciesButton.waitForExistence(timeout: 5.0))
        let openingCrawlTitle = app.staticTexts["Opening crawl"]
        XCTAssert(openingCrawlTitle.exists)
        // Need to match opening crawl text and verify non-empty
    }

    func testDetailViewForPlanet() throws {
        // Navigate to Details view
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))
        firstRow.tap()

        // Navigate to Planet details
        let planetButton = app.buttons["Tatooine"]
        XCTAssert(planetButton.waitForExistence(timeout: 5.0))
        planetButton.tap()

        // Verify Planet details
        let detailsTitle = app.staticTexts["Tatooine"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 0.5))
        let rotationPeriodTitle = app.staticTexts["Rotation period"]
        XCTAssert(rotationPeriodTitle.exists)
        let rotationPeriodValue = app.staticTexts["23 hrs"]
        XCTAssert(rotationPeriodValue.exists)
        let orbitalPeriodTitle = app.staticTexts["Orbital period"]
        XCTAssert(orbitalPeriodTitle.exists)
        let orbitalPeriodValue = app.staticTexts["304 days"]
        XCTAssert(orbitalPeriodValue.exists)
        let diameterTitle = app.staticTexts["Diameter"]
        XCTAssert(diameterTitle.exists)
        let diameterValue = app.staticTexts["10465 km"]
        XCTAssert(diameterValue.exists)
        let climateTitle = app.staticTexts["Climate"]
        XCTAssert(climateTitle.exists)
        let climateValue = app.staticTexts["arid"]
        XCTAssert(climateValue.exists)
        let gravityTitle = app.staticTexts["Gravity"]
        XCTAssert(gravityTitle.exists)
        let gravityValue = app.staticTexts["1 standard G"]
        XCTAssert(gravityValue.exists)
        let terrainTitle = app.staticTexts["Terrain"]
        XCTAssert(terrainTitle.exists)
        let terrainValue = app.staticTexts["desert"]
        XCTAssert(terrainValue.exists)
        let surfaceWaterTitle = app.staticTexts["Surface water"]
        XCTAssert(surfaceWaterTitle.exists)
        let surfaceWaterValue = app.staticTexts["1 %"]
        XCTAssert(surfaceWaterValue.exists)
        let populationTitle = app.staticTexts["Population"]
        XCTAssert(populationTitle.exists)
        let populationValue = app.staticTexts["200000"]
        XCTAssert(populationValue.exists)

        // Scroll to unhide bottom elements since off screen items don't "exist"
        app.swipeUp()

        let residentsTitle = app.staticTexts["Residents"]
        XCTAssert(residentsTitle.exists)
        let residentsValue = app.buttons["Luke Skywalker"]
        XCTAssert(residentsValue.waitForExistence(timeout: 5.0))
        let filmsTitle = app.staticTexts["Films"]
        XCTAssert(filmsTitle.exists)
        let filmsButton = app.buttons["A New Hope"]
        XCTAssert(filmsButton.waitForExistence(timeout: 5.0))
    }

    func testDetailViewForStarship() throws {
        // Navigate to Details view
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))
        firstRow.tap()

        // Navigate to Starship details
        let starshipButton = app.buttons["X-wing"]
        XCTAssert(starshipButton.waitForExistence(timeout: 5.0))
        starshipButton.tap()

        // Verify Starship details
        let detailsTitle = app.staticTexts["X-wing"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 5.0))
        let modelTitle = app.staticTexts["Model"]
        XCTAssert(modelTitle.exists)
        let modelValue = app.staticTexts["T-65 X-wing"]
        XCTAssert(modelValue.exists)
        let manufacturerTitle = app.staticTexts["Manufacturer"]
        XCTAssert(manufacturerTitle.exists)
        let manufacturerValue = app.staticTexts["Incom Corporation"]
        XCTAssert(manufacturerValue.exists)
        let costTitle = app.staticTexts["Cost"]
        XCTAssert(costTitle.exists)
        let costValue = app.staticTexts["149999 credits"]
        XCTAssert(costValue.exists)
        let lengthTitle = app.staticTexts["Length"]
        XCTAssert(lengthTitle.exists)
        let lengthValue = app.staticTexts["12.5 m"]
        XCTAssert(lengthValue.exists)
        let maxAtmosSpeedTitle = app.staticTexts["Max atmos speed"]
        XCTAssert(maxAtmosSpeedTitle.exists)
        let maxAtmosSpeedValue = app.staticTexts["1050"]
        XCTAssert(maxAtmosSpeedValue.exists)
        let crewTitle = app.staticTexts["Crew"]
        XCTAssert(crewTitle.exists)
        let crewValue = app.staticTexts["1"]
        XCTAssert(crewValue.exists)
        let passengersTitle = app.staticTexts["Passengers"]
        XCTAssert(passengersTitle.exists)
        let passengersValue = app.staticTexts["0"]
        XCTAssert(passengersValue.exists)
        let cargoCapacityTitle = app.staticTexts["Cargo capacity"]
        XCTAssert(cargoCapacityTitle.exists)
        let cargoCapacityValue = app.staticTexts["110 kg"]
        XCTAssert(cargoCapacityValue.exists)
        let consumablesTitle = app.staticTexts["Consumables"]
        XCTAssert(consumablesTitle.exists)
        let consumablesValue = app.staticTexts["1 week"]
        XCTAssert(consumablesValue.exists)
        let hyperdriveRatingTitle = app.staticTexts["Hyperdrive rating"]
        XCTAssert(hyperdriveRatingTitle.exists)
        let hyperdriveRatingValue = app.staticTexts["1.0"]
        XCTAssert(hyperdriveRatingValue.exists)
        let mgltTitle = app.staticTexts["MGLT"]
        XCTAssert(mgltTitle.exists)
        let mgltValue = app.staticTexts["100 mglts/hr"]
        XCTAssert(mgltValue.exists)
        let starshipClassTitle = app.staticTexts["Starship class"]
        XCTAssert(starshipClassTitle.exists)
        let starshipClassValue = app.staticTexts["Starfighter"]
        XCTAssert(starshipClassValue.exists)

        // Scroll to unhide bottom elements since off screen items don't "exist"
        app.swipeUp()

        let pilotsTitle = app.staticTexts["Pilots"]
        XCTAssert(pilotsTitle.exists)
        let pilotsValue = app.buttons["Luke Skywalker"]
        XCTAssert(pilotsValue.waitForExistence(timeout: 5.0))
        let filmsTitle = app.staticTexts["Films"]
        XCTAssert(filmsTitle.exists)
        let filmsButton = app.buttons["A New Hope"]
        XCTAssert(filmsButton.waitForExistence(timeout: 5.0))
    }

    func testDetailViewForVehicle() throws {
        // Navigate to Details view
        let firstRow = app.buttons["Luke Skywalker, 172 cm, 77 kg"]
        XCTAssert(firstRow.waitForExistence(timeout: 5.0))
        firstRow.tap()

        // Navigate to Vehicle details
        let vehicleButton = app.buttons["Snowspeeder"]
        XCTAssert(vehicleButton.waitForExistence(timeout: 5.0))
        vehicleButton.tap()

        // Verify Vehicle details
        let detailsTitle = app.staticTexts["Snowspeeder"]
        XCTAssert(detailsTitle.waitForExistence(timeout: 0.5))
        let modelTitle = app.staticTexts["Model"]
        XCTAssert(modelTitle.exists)
        let modelValue = app.staticTexts["t-47 airspeeder"]
        XCTAssert(modelValue.exists)
        let manufacturerTitle = app.staticTexts["Manufacturer"]
        XCTAssert(manufacturerTitle.exists)
        let manufacturerValue = app.staticTexts["Incom corporation"]
        XCTAssert(manufacturerValue.exists)
        let costTitle = app.staticTexts["Cost"]
        XCTAssert(costTitle.exists)
        let costValue = app.staticTexts["unknown credits"]
        XCTAssert(costValue.exists)
        let lengthTitle = app.staticTexts["Length"]
        XCTAssert(lengthTitle.exists)
        let lengthValue = app.staticTexts["4.5 m"]
        XCTAssert(lengthValue.exists)
        let maxAtmosSpeedTitle = app.staticTexts["Max atmos speed"]
        XCTAssert(maxAtmosSpeedTitle.exists)
        let maxAtmosSpeedValue = app.staticTexts["650"]
        XCTAssert(maxAtmosSpeedValue.exists)
        let crewTitle = app.staticTexts["Crew"]
        XCTAssert(crewTitle.exists)
        let crewValue = app.staticTexts["2"]
        XCTAssert(crewValue.exists)
        let passengersTitle = app.staticTexts["Passengers"]
        XCTAssert(passengersTitle.exists)
        let passengersValue = app.staticTexts["0"]
        XCTAssert(passengersValue.exists)
        let cargoCapacityTitle = app.staticTexts["Cargo capacity"]
        XCTAssert(cargoCapacityTitle.exists)
        let cargoCapacityValue = app.staticTexts["10 kg"]
        XCTAssert(cargoCapacityValue.exists)
        let consumablesTitle = app.staticTexts["Consumables"]
        XCTAssert(consumablesTitle.exists)
        let consumablesValue = app.staticTexts["none"]
        XCTAssert(consumablesValue.exists)
        let vehicleClassTitle = app.staticTexts["Vehicle class"]
        XCTAssert(vehicleClassTitle.exists)
        let vehicleClassValue = app.staticTexts["airspeeder"]
        XCTAssert(vehicleClassValue.exists)
        let pilotsTitle = app.staticTexts["Pilots"]
        XCTAssert(pilotsTitle.exists)
        let pilotsValue = app.buttons["Luke Skywalker"]
        XCTAssert(pilotsValue.waitForExistence(timeout: 5.0))
        let filmsTitle = app.staticTexts["Films"]
        XCTAssert(filmsTitle.exists)
        let filmsButton = app.buttons["The Empire Strikes Back"]
        XCTAssert(filmsButton.waitForExistence(timeout: 5.0))
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
