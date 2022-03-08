Feature: Elimincacion de Grupos de Alumnos
    
    Eliminacion de un Grupo de Alumnos

#@ignore-this
Scenario: Eliminacion exitosa de Grupo de Alumnos

    Given usuario ha iniciado sesion
    And genere un valor unico grupoViejo
    And ya existe un grupo de alumnos con nombre grupoViejo
    And la url es /admin/LPA/grupo/
    When entro a modificar el grupo de alumnos con nombre grupoViejo
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/grupo/
    And verifico no existe grupo de alumnos con nombre grupoViejo

@ignore-this
Scenario: Eliminacion fallida de Grupo de Alumnos - Asociada a alumnos

    Given usuario ha iniciado sesion
    #Falta definir alumno

@ignore-this
Scenario: Eliminacion fallida de Grupo de Alumnos - Asociada a sesiones

    Given usuario ha iniciado sesion
    #Falta definir alumno