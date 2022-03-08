import { When, Then, Given } from 'cypress-cucumber-preprocessor/steps'

Given('usuario ha iniciado sesion', () => {
    cy.login('qatesting', 'administrador')
})

Given('la url es {word}', (url) => {
    cy.visit(`${Cypress.config().baseUrl}${url}`)
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Given('genere una consigna unica', () => {
    const consigna = Cypress._.random(0, 1e6)
    cy.wrap(consigna).as('consigna')
})

Given('ya existe una pregunta de multiple opcion con consigna generada', () => {
    cy.get('@consigna').then(consigna => {
        cy.getPrevPMO(consigna)
    })
})

Given('ya existe una pregunta de multiple opcion con consigna {string}', (consigna) => {
    cy.getPrevPMO(consigna)
})

Given('ya existe una pregunta de desarrollo con consigna generada', () => {
    cy.get('@consigna').then(consigna => {
        cy.getPrevPD(consigna)
    })
})

Given('ya existe una pregunta de desarrollo con consigna {string}', (consigna) => {
    cy.getPrevPD(consigna)
})


When('completo el campo {word} con el valor generado', (id) => {
    cy.get('@consigna').then(consigna => {
        cy.get('input#'+id+'').type(consigna)
    })
})

When('completo el campo {word} con el valor {string}', (id, consigna) => {
    cy.get('input#'+id+'').type(consigna)
})

When('vacio el campo {word}', (id) => {
    cy.get('input#'+id+'').clear()
})

When('añado la opcion {word} {string}', (correcta, opcion) => {
    cy.get('.add-row a').click()
    cy.get('div#opciones_pregunta-group tr.form-row.dynamic-opciones_pregunta').last().within(() => {
        cy.get('td.field-contenido input').type(opcion)
        if (correcta === 'correcta') {
            cy.get('td.field-es_correcta input').check()
        } else {
            cy.get('td.field-es_correcta input').uncheck()
        }
    })
    /*
    contains('td.field-contenido input').type(opcion)
    if (correcta === 'correcta') {
        cy.get('div#opciones_pregunta-group tr.form-row.dynamic-opciones_pregunta').last().contains('td.field-es_correcta').contains('input').check()
    } else {
        cy.get('div#opciones_pregunta-group tr.form-row.dynamic-opciones_pregunta').last().contains('td.field-es_correcta').contains('input').uncheck()
    }*/
})

When('guardo el formulario', () => {
    cy.get('input[type=submit][name=_save]').click()
})

When('añado la palabra clave {string}', (palabra) => {
    cy.get('.add-row a').click()
    cy.get('div#palabras_clave_pregunta-group tr.form-row.dynamic-palabras_clave_pregunta').last().within(() => {
        cy.get('td.field-contenido input').type(palabra)
    })
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Then('mensaje de error visible', () => {
    cy.get('.errornote').should('exist')
})

Then('verifico existe pregunta de consigna generada', () => {
    cy.get('@consigna').then(consigna => {
        cy.get('#result_list a').contains(consigna).should('exist')
    })
})

Then('verifico existe pregunta de consigna {string}', (consigna) => {
    cy.get('#result_list a').contains(consigna).should('exist')
})

Then('entro a modificar la pregunta de consigna generada', () => {
    cy.get('@consigna').then(consigna => {
        cy.get('#result_list a').contains(consigna).click()
    })
})

Then('entro a modificar la pregunta de consigna {string}', (consigna) => {
    cy.get('#result_list a').contains(consigna).click()
})

Then('verifico existe la opcion {word} {string}', (correcta, opcion) => {
    cy.get('td.field-contenido input[type=text][value="'+opcion+'"]').should('exist')
    cy.get('td.field-contenido input[type=text][value="'+opcion+'"]').parent().parent().within(() => {
        if (correcta === 'correcta') {
            cy.get('td.field-es_correcta input[type=checkbox]').should('be.checked')
        } else {
            cy.get('td.field-es_correcta input[type=checkbox]').should('not.be.checked')
        }
    })
})

Then('verifico existe la palabra clave {string}', (palabra) => {
    cy.get('td.field-contenido input[type=text][value="'+palabra+'"]').should('exist')
})