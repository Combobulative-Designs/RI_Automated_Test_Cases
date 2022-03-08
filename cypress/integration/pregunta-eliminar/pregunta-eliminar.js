import { When, Then, Given } from 'cypress-cucumber-preprocessor/steps'

Given('usuario ha iniciado sesion', () => {
    cy.login('qatesting', 'administrador')
})

Given('genere un valor unico {word}', (variable) => {
    const consigna = Cypress._.random(0, 1e6)
    cy.wrap(consigna.toString()).as(variable)
})

Given('ya existe una pregunta de multiple opcion con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.getPrevPMO(consigna)
    })
})

Given('ya existe una pregunta de desarrollo con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.getPrevPD(consigna)
    })
})

When('entro a modificar la pregunta con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('table#result_list a').contains(consigna).click()
    })
    cy.url().should('match', /\/admin\/LPA\/(textolibre|multipleopcion)\/\d+\/change\//)
})

When('entro a modificar la pregunta con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('table#result_list a').contains(consigna).click()
    })
    cy.url().should('match', /\/admin\/LPA\/(textolibre|multipleopcion)\/\d+\/change\//)
})

When('elijo eliminar el registro', () => {
    cy.get('.deletelink').click()
    cy.url().should('match', /\/admin\/LPA\/(textolibre|multipleopcion)\/\d+\/delete\//)
    cy.get('input[value="Si, estoy seguro"]').click()
})

When('verifico la url verifica {string}', (patron) => {
    const pattern = new RegExp(patron)
    cy.url().should('match', pattern)
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Then('verifico no existe pregunta con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('#result_list a').contains(consigna).should('not.exist')
    })
})