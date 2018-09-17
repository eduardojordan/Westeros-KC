import Foundation

/*
 Las funciones son ciudadanos de primera clase
 -Podemos meterla dentro de un array
 -Podemos asignarlas a variables
 -Pueden ser parametros de otra funciones
 -Ser el resultado que devuelve una funcion ( es decir , una funcion puede devolver otra funcion)
 
 */

 //Tipo de una funcion

typealias IntToInt = (Int) -> Int  //Esto es un Clousure


//Ser el resultado que devuelve una funcion ( es decir , una funcion puede devolver otra funcion)

func adder (n: Int) -> IntToInt {
    
    //Las funciones capturan el entorno lexico
    func f(x: Int) -> Int {
        return x + n
    }
    return f
}

// Podemos asignarlas a variables

let add42 = adder (n:42)
let add10 = adder(n:10)
add42(8)
add10(8)

// Pueden ser parametros de otra funciones

func apply (f: IntToInt, n: Int) -> Int {
    return f(n)
}

apply(f: add42, n: 8)
apply(f: add10, n: 10)


//SINTAXIS DE CLOUSURES
// Toda funcion de swift es, en realidad un clousure

func f(_ n: Int)->Int {
    return n + 8
}

let f1 = { (n: Int) -> Int in
    return n + 8
}


f(8)
f1(8)

func h (n: Int, t: Int)-> Int {
    return 9
}

// Podemos meterlas dentro de un array
let functions : [IntToInt] = [f, f1, add42, add10]

for f in functions {
    print(f(8))
}


//Inferencia de tipos
//Sintaxis abreviada de clousures

let clousures  = [
    f,
    { (n:Int) -> Int in return n + 8}, // 100% explicito
    { (n:Int) in return n + 19},//95% explicito
    {n in return n * 5}, // 90% No hace falta especificar el tipo de entrad lo infiere de la primera  "f"
    { n in n * 5},// Si el cuerpo de la funcion solo tienen una linea no hace falta el return
    { $0 * 3 } // no hace falta ni siquiera un nombre al parametro
]

// Trailing clousure  / Clausura que cuelga
// Bloque / clousure de finalizacion completionHandelr, etc...

let evens = [6, 12, 8, 2, 10, 4]

evens.sorted(by: { a: Int, b: Int) -> Bool in
    a > b
})

evens

// Trailing clousure
var result = evens.sorted { $1 > $0 }

result


// Clasicos de FP : map, flatMap (compactMap), filter, reduce...

//Programacion imperativa ( la que se aprende al programar)
var results = [Int] ()
for number in evens {
    results.append(number * 2)
}

print(results)

// Programacion Funcional

results = evens.map { number in
    return number * 2
    
}

results = []

results2 = evens
    .map { $0 * 2} // Multiplicamos x 2
    .map { "El numero es \($0)"}

// FILTER

results = evens.filter { $0 > 6}

results


//flatMap

let intsorNil : [Int?] = [1, 2, nil, 4, nil, 7, nil, 10 , 12, nil]

results = intsorNil.compactMap{ $0?.hashValue}

// REDUCE

let r = evens.reduce(0) { result, each in
    var total = result
    total = total  + each
    return total
    
}

let r2 = evens.reduce(0) { $0 + $1}
