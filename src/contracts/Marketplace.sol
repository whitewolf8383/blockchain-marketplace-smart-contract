pragma solidity ^0.5.0;

contract Marketplace {
  string public name;
  mapping(uint => Product) public products;
  uint public productCount = 0;

  struct Product {
    uint id;
    string name;
    uint price;
    address owner;
    bool purchased;
  }

  event ProductCreated(
    uint id,
    string name,
    uint price,
    address owner,
    bool purchased
  );

  constructor() public {
    name = "Francis Marketplace";
  }

  function createProduct(string memory _name, uint _price) public {
    // Make sure parameters are correct
    require(bytes(_name).length > 0);
    require(_price > 0);
    // Increment productCount
    productCount ++;
    // Create the Product
    products[productCount] = Product(productCount, _name, _price, msg.sender, false);
    // Trigger an event
    emit ProductCreated(productCount, _name, _price, msg.sender, false);
  }
}
