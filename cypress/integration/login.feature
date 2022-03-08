Feature: Login de usuario

    Inicio de sesion de un usuario y autenticacion de sus credenciales.

Scenario: Login exitoso

    Given la url es /admin/login/
    When ingreso al sistema con usuario valido y contraseña valida
    Then verifico la url es /admin/

Scenario: Login fallido - Contraseña incorrecta

    Given la url es /admin/login/
    When ingreso al sistema con usuario valido y contraseña invalida
    Then verifico la url es /admin/login/
    And mensaje de error visible

Scenario: Login fallido - Usuario no registrado

    Given la url es /admin/login/
    When ingreso al sistema con usuario invalido y contraseña invalida
    Then verifico la url es /admin/login/
    And mensaje de error visible