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
    cy.wrap(consigna.toString()).as('consigna')
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

Given('ya existe una pregunta de multiple opcion con consigna {string}', (consigna) => {
    cy.getPrevPMO(consigna)
})

Given('ya existe una pregunta de desarrollo con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.getPrevPD(consigna)
    })
})

Given('ya existe una pregunta de desarrollo con consigna {string}', (consigna) => {
    cy.getPrevPD(consigna)
})

When('completo el campo {word} con el valor {word}', (id, variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('input#'+id+'').clear()
        if (consigna.length > 0) {
            cy.get('input#'+id+'').type(consigna)
        }
    })
})

When('completo el campo {word} con el valor {string}', (id, consigna) => {
    cy.get('input#'+id+'').clear()
    if (consigna.length > 0) {
        cy.get('input#'+id+'').type(consigna)
    }
})

When('vacio el campo {word}', (id) => {
    cy.get('input#'+id+'').clear()
})

When('añado al campo {word} el valor {string}', (id, valor) => {
    if (valor.length > 0) {
        cy.get('input#'+id+'').type(valor)
    }
})

When('añado la opcion {word} {string}', (correcta, opcion) => {
    cy.get('.add-row a').click()
    cy.get('div#opciones_pregunta-group tr.form-row.dynamic-opciones_pregunta').last().within(() => {
        if (opcion.length > 0) {
            cy.get('td.field-contenido input').type(opcion)
        }
        if (correcta === 'correcta') {
            cy.get('td.field-es_correcta input').check()
        } else {
            cy.get('td.field-es_correcta input').uncheck()
        }
    })
})

When('modifico la opcion {int} al contenido {string} y marco {word}', (indice, contenido, correcta) => {
    cy.get('tr#opciones_pregunta-'+indice.toString()).within(() => {
        cy.get('td.field-contenido input').clear()
        if (contenido.length > 0) {
            cy.get('td.field-contenido input').type(contenido)
        }
        if (correcta === 'correcta') {
            cy.get('td.field-es_correcta input').check()
        } else {
            cy.get('td.field-es_correcta input').uncheck()
        }
    })
})

When('elimino la opcion {int}', (indice) => {
    cy.get('input#id_opciones_pregunta-'+indice.toString()+'-DELETE').check()
})

When('guardo el formulario', () => {
    cy.get('input[type=submit][name=_save]').click()
})

When('añado la palabra clave {string}', (palabra) => {
    cy.get('.add-row a').click()
    cy.get('div#palabras_clave_pregunta-group tr.form-row.dynamic-palabras_clave_pregunta').last().within(() => {
        if (palabra.length > 0) {
            cy.get('td.field-contenido input').type(palabra)
        }
    })
})

When('modifico la palabra clave {int} al contenido {string}', (indice, contenido) => {
    cy.get('tr#palabras_clave_pregunta-'+indice.toString()).within(() => {
        cy.get('td.field-contenido input').clear()
        if (contenido.length > 0) {
            cy.get('td.field-contenido input').type(contenido)
        }
    })
})

When('elimino la palabra clave {int}', (indice) => {
    cy.get('input#id_palabras_clave_pregunta-'+indice.toString()+'-DELETE').check()
})

When('entro a modificar la pregunta con consigna generada', () => {
    cy.get('@consigna').then(consigna => {
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

When('entro a modificar la pregunta con consigna {string}', (consigna) => {
    cy.get('table#result_list a').contains(consigna).click()
    cy.url().should('match', /\/admin\/LPA\/(textolibre|multipleopcion)\/\d+\/change\//)
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Then('mensaje de error visible', () => {
    cy.get('.errornote').should('exist')
})

Then('verifico existe pregunta con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('#result_list a').contains(consigna).should('exist')
    })
})

Then('verifico existe pregunta con consigna {string}', (consigna) => {
    cy.get('#result_list a').contains(consigna).should('exist')
})

Then('entro a modificar la pregunta con consigna {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('table#result_list a').contains(consigna).click()
    })
    cy.url().should('match', /\/admin\/LPA\/(textolibre|multipleopcion)\/\d+\/change\//)
})

Then('entro a modificar la pregunta con consigna {string}', (consigna) => {
    cy.get('table#result_list a').contains(consigna).click()
    cy.url().should('match', /\/admin\/LPA\/(textolibre|multipleopcion)\/\d+\/change\//)
})

Then('verifico existe la opcion {word} {string}', (correcta, opcion) => {
    cy.get('td.field-contenido input[type=text][value="'+opcion.toString()+'"]').should('exist')
    cy.get('td.field-contenido input[type=text][value="'+opcion.toString()+'"]').parent().parent().within(() => {
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

Then('verifico existen solo {int} opciones', (cantidad) => {
    cy.get('div#opciones_pregunta-group tr.form-row.dynamic-opciones_pregunta').should('have.length', cantidad)
})

Then('verifico existen solo {int} palabras clave', (cantidad) => {
    cy.get('div#palabras_clave_pregunta-group tr.form-row.dynamic-palabras_clave_pregunta').should('have.length', cantidad)
})

Then('verifico la url verifica {string}', (patron) => {
    const pattern = new RegExp(patron)
    cy.url().should('match', pattern)
})