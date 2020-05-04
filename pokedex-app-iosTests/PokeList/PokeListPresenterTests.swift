import XCTest

@testable import pokedex_app_ios

final class PokeListPresenterTests: XCTestCase {
    private let router = PokeListRouteringSpy()
    private lazy var sut = PokeListPresenter(router: router)
    
    func test_whenPokemonIsSelected_thenNavigateToPokeDetail() {
        sut.pokeListItems.append(.init(name: "", url: ""))
        sut.didSelectPokemon(at: 0)
        XCTAssertTrue(router.navigateToPokeDetailCalled)
    }
}

class PokeListRouteringSpy: PokeListRoutering {
    var navigateToPokeDetailCalled = false
    
    func navigateToPokeDetail(pokemon: PokeListItem) {
        navigateToPokeDetailCalled = true
    }
    
}
