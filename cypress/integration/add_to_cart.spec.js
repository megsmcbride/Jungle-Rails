describe('Visit home page', () => {
  beforeEach(() => {
    cy.visit('/'); 
  });

  it("Should add item to cart when clicking on the add button", () => {             
    cy.get(".products article").first().find(".btn").click({force: true});
    cy.contains("My Cart (1)")
  });


});