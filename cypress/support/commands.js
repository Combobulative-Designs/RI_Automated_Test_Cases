// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('login', (username, password) => {
    cy.session([username, password], () => {
        cy.visit('https://vast-depths-20382.herokuapp.com/admin/login/')
        cy.url().should('contain', 'admin/login')
        cy.get('input[name=username][id=id_username]').type(username)
        cy.get('input[name=password][id=id_password]').type(password)
        cy.get('input[type=submit][value="Iniciar sesión"]').click()
        cy.title().should('contain', 'Leer para aprender | Administración de Leer Para Aprender')
    })
})

Cypress.Commands.add('getPrevPMO', (consigna) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/multipleopcion/add/')
    cy.title().should('contain', 'Añadir Pregunta multiple opción')
    cy.get('input[name=consigna][id=id_consigna]').type(consigna)
    cy.get('.add-row a').click()
    cy.get('input#id_opciones_pregunta-0-contenido').type('Opcion 1')
    cy.get('input#id_opciones_pregunta-0-es_correcta').check()
    cy.get('.add-row a').click()
    cy.get('input#id_opciones_pregunta-1-contenido').type('Opcion 2')
    cy.get('input#id_opciones_pregunta-1-es_correcta').uncheck()
    cy.get('.add-row a').click()
    cy.get('input#id_opciones_pregunta-2-contenido').type('Opcion 3')
    cy.get('input#id_opciones_pregunta-2-es_correcta').uncheck()
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione Pregunta multiple opción a modificar')
})

Cypress.Commands.add('getPrevPD', (consigna) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/textolibre/add/')
    cy.title().should('contain', 'Añadir Pregunta de desarrollo')
    cy.get('input[name=consigna][id=id_consigna]').type(consigna)
    cy.get('.add-row a').click()
    cy.get('input#id_palabras_clave_pregunta-0-contenido').type('Palabra Clave 1')
    cy.get('.add-row a').click()
    cy.get('input#id_palabras_clave_pregunta-1-contenido').type('Palabra Clave 2')
    cy.get('.add-row a').click()
    cy.get('input#id_palabras_clave_pregunta-2-contenido').type('Palabra Clave 3')
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione Pregunta de desarrollo a modificar')
})

Cypress.Commands.add('getPrevTexto', (texto) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/texto/add/')
    cy.title().should('contain', 'Añadir texto')
    cy.get('textarea[id=id_texto]').type(texto)
    cy.get('.add-row a').click()
    cy.get('input#id_definiciones_texto-0-palabra').type('Palabra 1')
    cy.get('textarea#id_definiciones_texto-0-contenido').type('Contenido 1')
    cy.get('.add-row a').click()
    cy.get('input#id_definiciones_texto-1-palabra').type('Palabra 2')
    cy.get('textarea#id_definiciones_texto-1-contenido').type('Contenido 2')
    cy.get('.add-row a').click()
    cy.get('input#id_definiciones_texto-2-palabra').type('Palabra 3')
    cy.get('textarea#id_definiciones_texto-2-contenido').type('Contenido 3')
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione texto a modificar')
})

Cypress.Commands.add('getPrevInstitucion', (nombre) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/institucion/add/')
    cy.title().should('contain', 'Añadir Institución')
    cy.get('input[id=id_nombre]').type(nombre)
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione Institución a modificar')
})

Cypress.Commands.add('getPrevGrupoAlumnos', (nombre) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/grupo/add/')
    cy.title().should('contain', 'Añadir grupo')
    cy.get('input[id=id_nombre]').type(nombre)
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione grupo a modificar')
})

Cypress.Commands.add('getPrevGrupoAlumnos', (nombre) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/grupo/add/')
    cy.title().should('contain', 'Añadir grupo')
    cy.get('input[id=id_nombre]').type(nombre)
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione grupo a modificar')
})

Cypress.Commands.add('getPrevSesion', (titulo) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/prueba/add/')
    cy.title().should('contain', 'Añadir Sesión')
    cy.get('input[id=id_titulo]').type(titulo)
    cy.get('textarea[id=id_instrucciones]').type("Instrucciones para la sesion.")
    cy.get('div#palabras_clave_prueba-group .add-row a').click()
    cy.get('div#palabras_clave_prueba-group div.dynamic-palabras_clave_prueba').last().within(() => {
        cy.get('div.field-contenido input').type("Palabra Clave 1")
    })
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione Sesión a modificar')
})

Cypress.Commands.add('getPrevSesionWithAsocTextoYGrupo', (titulo, texto, grupo) => {
    cy.visit('https://vast-depths-20382.herokuapp.com/admin/LPA/prueba/add/')
    cy.title().should('contain', 'Añadir Sesión')
    cy.get('input[id=id_titulo]').type(titulo)
    cy.get('#id_texto').select(texto)
    cy.get('#id_grupo').select(grupo)
    cy.get('textarea[id=id_instrucciones]').type("Instrucciones para la sesion.")
    cy.get('div#palabras_clave_prueba-group .add-row a').click()
    cy.get('div#palabras_clave_prueba-group div.dynamic-palabras_clave_prueba').last().within(() => {
        cy.get('div.field-contenido input').type("Palabra Clave 1")
    })
    cy.get('input[type=submit][name=_save]').click()
    cy.title().should('contain', 'Seleccione Sesión a modificar')
})