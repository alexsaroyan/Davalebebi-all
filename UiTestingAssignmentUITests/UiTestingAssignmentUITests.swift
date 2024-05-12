import XCTest
@testable import UnitTestingAssignment

class CartViewModelTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        cartViewModel = CartViewModel()
        mockNetworkManager = MockNetworkManager()
        cartViewModel.networkManager = mockNetworkManager
    }
    
    override func tearDown() {
        cartViewModel = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testViewDidLoadFetchesProducts() {
        cartViewModel.viewDidLoad()
        
        // Verify that allProducts is not nil after viewDidLoad
        XCTAssertNotNil(cartViewModel.allproducts)
        
        // Verify that fetchProducts() is called
        XCTAssertTrue(mockNetworkManager.isFetchProductsCalled)
    }
    
    func testAddProductWithID() {
        // Given
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 10.0)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0)
        cartViewModel.allproducts = [product1, product2]
        
        // When
        cartViewModel.addProduct(withID: 1)
        
        // Then
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts[0].id, 1)
    }
    
    func testAddProduct() {
        // Given
        let product = Product(id: 1, title: "Product 1", description: "Description 1", price: 10.0)
        
        // When
        cartViewModel.addProduct(product: product)
        
        // Then
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts[0].id, 1)
    }
    
    func testAddRandomProduct() {
        // Given
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 10.0)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0)
        cartViewModel.allproducts = [product1, product2]
        
        // When
        cartViewModel.addRandomProduct()
        
        // Then
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertTrue(cartViewModel.allproducts!.contains(where: { $0.id == cartViewModel.selectedProducts[0].id }))
    }
    
    func testRemoveProductWithID() {
        // Given
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 10.0)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0)
        cartViewModel.selectedProducts = [product1, product2]
        
        // When
        cartViewModel.removeProduct(withID: 1)
        
        // Then
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts[0].id, 2)
    }
    
    func testClearCart() {
        // Given
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 10.0)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0)
        cartViewModel.selectedProducts = [product1, product2]
        
        // When
        cartViewModel.clearCart()
        
        // Then
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
    
    // Add more tests based on the requirements and functionalities of CartViewModel
}

// Mock NetworkManager for testing
class MockNetworkManager: NetworkManagerProtocol {
    
    var isFetchProductsCalled = false
    
    func fetchProducts(completion: @escaping (Result<[Product]?, Error>) -> Void) {
        isFetchProductsCalled = true
        
        // Mock data for testing
        let mockProducts = [Product(id: 1, title: "Product 1", description: "Description 1", price: 10.0),
                            Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0)]
        completion(.success(mockProducts))
    }
}

