module Helper exposing (..)

import Html exposing (Html, div, h1, text, ul, li)

-- 1. FUNCIONES MATEMÁTICAS
-- add2: Recibe dos Int y los suma
add2 : Int -> Int -> Int
add2 a b = 
    a + b

-- add3: Recibe tres Floats y los suma
add3 : Float -> Float -> Float -> Float
add3 x y z = 
    x + y + z

-- calc: Recibe dos números y una función (operación) para aplicarla
calc : a -> a -> (a -> a -> b) -> b
calc x y operation = 
    operation x y


-- 2. LISTAS Y RÉCORDS
type alias Videogame =
    { title : String
    , releaseYear : Int
    , available : Bool
    , downloads : Int
    , genres : List String
    }

-- languageNames: Extrae el campo .name de cada registro en la lista
languageNames : List { record | name : String } -> List String
languageNames list =
    List.map .name list

-- onlyStudents: Si es Student devuelve el nombre, si no, un string vacío
onlyStudents : List { record | name : String, uType : String } -> List String
onlyStudents list =
    List.map (\u -> if u.uType == "Student" then u.name else "") list

-- getVideogameGenres: Extrae la lista de géneros de cada videojuego
getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres list =
    List.map .genres list


-- 3. DATOS DE LA LAPTOP Y HTML
-- El test espera que estos campos existan y sean Strings
myLaptop =
    { ram = "16GB"
    , model = "XPS 13"
    , brand = "Dell"
    , screenSize = "13.4"
    }

-- main: Genera el HTML con la estructura exacta que pide el test (div > div > ul > li)
main : Html msg
main =
    div []
        [ h1 [] [ text "My laptop" ]
        , div []
            [ ul []
                [ li [] [ text ("Ram: " ++ myLaptop.ram) ]
                , li [] [ text ("Modelo: " ++ myLaptop.model) ]
                , li [] [ text ("Marca: " ++ myLaptop.brand) ]
                , li [] [ text ("Pulgadas: " ++ myLaptop.screenSize) ]
                ]
            ]
        ]