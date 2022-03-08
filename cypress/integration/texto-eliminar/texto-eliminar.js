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

Given('ya existe una sesion con titulo {word} asociada al texto {word} y al grupo {word}', (var1, var2, var3) => {
    cy.get('@'+var1).then(titulo => {
        cy.get('@'+var2).then(texto => {
            cy.get('@'+var3).then(grupo => {
                cy.getPrevSesionWithAsocTextoYGrupo(titulo, texto, grupo)
            })
        })
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

When('entro a modificar el texto con texto {word}', (variable) => {
    cy.get('@'+variable).then(consigna => {
        cy.get('table#result_list a').contains(consigna).click()
    })
    cy.url().should('match', /\/admin\/LPA\/texto\/\d+\/change\//)
})

When('elijo eliminar el registro', () => {
    cy.get('.deletelink').click()
    cy.url().should('match', /\/admin\/LPA\/texto\/\d+\/delete\//)
    cy.get('input[value="Si, estoy seguro"]').click()
})

Then('verifico no existe texto con texto {word}', (variable) => {
    cy.get('@'+variable).then(valor => {
        cy.get('#result_list a').contains(valor).should('not.exist')
    })
})

Then('verifico la url es {word}', (url) => {
    cy.url().should('eq', `${Cypress.config().baseUrl}${url}`)
})