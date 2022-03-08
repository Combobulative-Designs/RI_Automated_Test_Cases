import { When, Then, Given } from 'cypress-cucumber-preprocessor/steps'

Given('usuario ha iniciado sesion', () => {
    cy.login('qatesting', 'administrador')
})

Given('la url es {word}', (url) => {
    cy.visit(`${Cypress.config().baseUrl}${url}`)
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Given('genere un valor unico {word}', (variable) => {
    const consigna = Cypress._.random(0, 1e6)
    cy.wrap(consigna.toString()).as(variable)
})

Given('ya existe un texto con texto {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.getPrevTexto(consigna)
    })
})

When('completo el campo {word} con el valor {word}', (id, variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('#'+id+'').clear()
        if (consigna.length > 0) {
            cy.get('#'+id+'').type(consigna)
        }
    })
})

When('guardo el formulario', () => {
    cy.get('input[type=submit][name=_save]').click()
})

When('añado la definicion {string} con el contenido {string}', (palabra, contenido) => {
    cy.get('.add-row a').click()
    cy.get('div#definiciones_texto-group tr.form-row.dynamic-definiciones_texto').last().within(() => {
        if (palabra.length > 0) {
            cy.get('td.field-palabra input').type(palabra)
        }
        if (contenido.length > 0) {
            cy.get('td.field-contenido textarea').type(contenido)
        }
    })
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Then('verifico existe texto con texto {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('#result_list a').contains(consigna).should('exist')
    })
})

Then('entro a modificar el texto con texto {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('table#result_list a').contains(consigna).click()
    })
    cy.url().should('match', /\/admin\/LPA\/texto\/\d+\/change\//)
})

Then('verifico existen solo {int} definiciones', (cantidad) => {
    cy.get('div#definiciones_texto-group tr.form-row.dynamic-definiciones_texto').should('have.length', cantidad)
})

Then('verifico existe la definicion {string} con el contenido {string}', (palabra, contenido) => {
    cy.get('td.field-palabra input[type=text][value="'+palabra.toString()+'"]').should('exist')
    cy.get('td.field-palabra input[type=text][value="'+palabra.toString()+'"]').parent().parent().within(() => {
        cy.get('td.field-contenido textarea').contains(contenido)
    })
})

Then('mensaje de error visible', () => {
    cy.get('.errornote').should('exist')
})