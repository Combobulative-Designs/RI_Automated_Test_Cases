import { When, Then, Given } from 'cypress-cucumber-preprocessor/steps'

Given('la url es {word}', (url) => {
    cy.visit(`${Cypress.config().baseUrl}${url}`)
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

When('ingreso al sistema con usuario {word} y contraseña {word}', (validezUsuario, validezPass) => {
    if (validezUsuario === "valido") {
        if (validezPass === "valida") {
            cy.get('input[name=username][id=id_username]').type("admin")
            cy.get('input[name=password][id=id_password]').type("administrador")
        } else {
            cy.get('input[name=username][id=id_username]').type("admin")
            cy.get('input[name=password][id=id_password]').type("fakepass")
        }
    } else {
        cy.get('input[name=username][id=id_username]').type("fakeuser")
        cy.get('input[name=password][id=id_password]').type("fakepass")
    }
    cy.get('input[type=submit][value="Iniciar sesión"]').click()
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Then('mensaje de error visible', () => {
    cy.get('.errornote').should('exist')
})