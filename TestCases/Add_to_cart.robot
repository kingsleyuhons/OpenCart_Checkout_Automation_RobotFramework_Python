*** Settings ***
Documentation   Add to cart functionality
Resource    ../Resources/Keywords.robot
Suite Teardown      Close All Browsers

*** Test Cases ***
Verify users can preview products before adding to cart
    Users should be able to search for product and preview
Verify users can add products to cart
    Users should be able to add product to cart
Verify users can add products to cart with delivery date
    Users should be able to add product to cart with delivery date
Verify users can add products to cart with specifications and information provided about the products
    Users should be able to add product to cart with specifications and additional product information