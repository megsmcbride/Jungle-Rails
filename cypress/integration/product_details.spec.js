describe('Visit home page', () => {
  beforeEach(() => {
    cy.visit('/'); 
  });

  it("Should visit the product page from the home page", () => {             
    cy.get(".products article")
    .first()
    .click()
    cy.contains('Scented Blade')
  });


});