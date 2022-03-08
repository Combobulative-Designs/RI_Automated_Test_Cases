import { When, Then, Given } from 'cypress-cucumber-preprocessor/steps'

Given('usuario ha iniciado sesion', () => {
    cy.login('qatesting', 'administrador')
})

Given('la url es {word}', (url) => {
    cy.visit(`${Cypress.config().baseUrl}${url}`)
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Given('genere un valor unico {word}', (variable) => {
    const valor = Cypress._.random(0, 1e6)
    cy.wrap(valor.toString()).as(variable)
})

Given('ya existe una institucion con nombre {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.getPrevInstitucion(valor)
    })
})

When('entro a modificar la institucion con nombre {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('table#result_list a').contains(valor).click()
    })
    cy.url().should('match', /\/admin\/LPA\/institucion\/\d+\/change\//)
})

When('elijo eliminar el registro', () => {
    cy.get('.deletelink').click()
    cy.url().should('match', /\/admin\/LPA\/institucion\/\d+\/delete\//)
    cy.get('input[value="Si, estoy seguro"]').click()
})

Then('verifico no existe institucion con nombre {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#result_list a').contains(valor).should('not.exist')
    })
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})