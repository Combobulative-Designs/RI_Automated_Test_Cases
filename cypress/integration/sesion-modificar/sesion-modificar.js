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

Given('ya existe una sesion con titulo {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.getPrevSesion(valor)
    })
})

Given('ya existe un texto con texto {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.getPrevTexto(valor)
    })
})

Given('ya existe un grupo de alumnos con nombre {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.getPrevGrupoAlumnos(valor)
    })
})

When('completo el campo {word} con el valor {word}', (id, variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#'+id+'').clear()
        if (valor.length > 0) {
            cy.get('#'+id+'').type(valor)
        }
    })
})

When('selecciono en el campo {word} el valor {word}', (id, variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#'+id+'').select(valor)
    })
})

When('completo el campo {word} con el valor {string}', (id, valor) => {
    cy.get('#'+id+'').clear()
    if (valor.length > 0) {
        cy.get('#'+id+'').type(valor)
    }
})

When('guardo el formulario', () => {
    cy.get('input[type=submit][name=_save]').click()
})

When('agrego la palabra clave {string}', (palabra) => {
    cy.get('div#palabras_clave_prueba-group .add-row a').click()
    cy.get('div#palabras_clave_prueba-group div.dynamic-palabras_clave_prueba').last().within(() => {
        if (palabra.length > 0) {
            cy.get('div.field-contenido input').type(palabra)
        }
    })
})

When('elimino la palabra clave {int}', (indice) => {
    cy.get('#id_palabras_clave_prueba-'+indice+'-DELETE').click()
})

When('entro a modificar la sesion con titulo {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('table#result_list a').contains(valor).click()
    })
    cy.url().should('match', /\/admin\/LPA\/prueba\/\d+\/change\//)
})

When('vacio el campo {word}', (id) => {
    cy.get('#'+id+'').clear()
})


Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})

Then('verifico existe sesion con titulo {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#result_list a').contains(valor).should('exist')
    })
})

Then('mensaje de error visible', () => {
    cy.get('.errornote').should('exist')
})

Then('entro a modificar la sesion con el titulo {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('table#result_list a').contains(valor).click()
    })
    cy.url().should('match', /\/admin\/LPA\/prueba\/\d+\/change\//)
})

Then('verifico el campo {word} tiene el valor {word}', (id, variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#'+id).invoke('val').should('eq', valor)
    })
})

Then('verifico el campo {word} tiene el valor {string}', (id, valor) => {
    cy.get('#'+id).invoke('val').should('eq', valor)
})

Then('verifico el combo {word} tiene el valor seleccionado {word}', (id, variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#'+id+'').find('option:selected').should('have.text', valor);
    })
})

Then('verifico existe la palabra clave {string}', (palabra) => {
    cy.get('div.dynamic-palabras_clave_prueba input[type=text][value="'+palabra.toString()+'"]').should('exist')
})

Then('verifico existen solo {int} palabras clave', (cantidad) => {
    cy.get('div#palabras_clave_prueba-group div.dynamic-palabras_clave_prueba').should('have.length', cantidad)
})

Then('verifico la url verifica {string}', (patron) => {
    const pattern = new RegExp(patron)
    cy.url().should('match', pattern)
})