## Licence
Este cancionero es una obra compilatoria. Los derechos de cada composición
pertenecen a sus autores originales. 
La compilación, formato y arreglos de presentación se distribuyen
bajo licencia CC BY-NC 4.0.

## Convención de commits

Para mantener un historial claro, usar estos prefijos:

Tipos específicos para cancionero:

- `song:`      agregar canción nueva
- `edit:`      cualquier corrección de letra, acordes o anotaciones
- `structure:` reorganizar secciones o el orden del cancionero
- `config:` cambios en configuración del proyecto (LaTeX, preámbulo, compilación, README, LICENSE)
- `meta:`      actualizar autor, título, sr u otros metadatos

Ejemplos:

``` Powershell
# Ejemplo 1
git commit -m "edit: [song_name] chords" # ó lyrics ó annotations

# Ejemplo 2
git commit -m "config: update preamble"
```

## Publicar commit sin Release, sin tag y sin desplegar pages

Basta con que el mensaje del commit contenga cualquiera de estas variantes
- `[skip ci]`
- `[ci skip]`
- `[no ci]`
- `[skip actions]`
- `[actions skip]`

No importa mayúsculas/minúsculas, ni en qué parte del mensaje lo pongas. Por ejemplo:

``` Powershell
git commit -m "edit: corregir typo en 'Vida en abundancia' [skip ci]"
git push
```