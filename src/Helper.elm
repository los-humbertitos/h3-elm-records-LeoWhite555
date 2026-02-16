module Helper exposing (..)

import Html exposing (Html, div, h1, li, text, ul)



-- 1. FUNCIONES MATEMÁTICAS


add2 : Int -> Int -> Int
add2 a b =
    a + b


add3 : Float -> Float -> Float -> Float
add3 x y z =
    x + y + z


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


languageNames : List { record | name : String } -> List String
languageNames list =
    List.map .name list


onlyStudents : List { record | name : String, uType : String } -> List String
onlyStudents list =
    List.map
        (\u ->
            if u.uType == "Student" then
                u.name

            else
                ""
        )
        list


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres list =
    List.map .genres list



-- 3. DATOS DE LA LAPTOP Y HTML


type alias Laptop =
    { ram : String
    , storage : String
    , brand : String
    , model : String
    , screenSize : String
    }


myLaptop : Laptop
myLaptop =
    { ram = "16GB"
    , storage = "1TB"
    , brand = "Lenovo"
    , model = "ThinkPad X1"
    , screenSize = "14 pulgadas"
    }


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
