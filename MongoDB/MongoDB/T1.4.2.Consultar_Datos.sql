// MongoDB

//Conteo total de documentos por coleccion cliente
db.cliente.find().count();

//Conteo total de documentos por coleccion consumo
db.consumo.find().count();

//Conteo total de documentos por coleccion facturacion
db.facturation.find().count();

//Estadisticas por coleccion
db.cliente.stats()
db.consumo..stats()
db.facturation.stats()

//Maximo, Minimo, Promedio y suma total de monto facturacion

db.facturation.aggregate([
        { $group: {
        _id: "",
        maximo: {$max: '$FACTURA_MONTO'},
        minimo: {$min:'$FACTURA_MONTO'},
        promedio: {$avg:'$FACTURA_MONTO'},
        sumaFactura: {$sum: "$FACTURA_MONTO"},
        "contarResultados": {"$sum": 1} }},
    
    ]);

//Maximo, Minimo, Promedio y suma total de duracion en segundos 
//de las llamadas

db.consumo.aggregate([
        { $group: {
        _id: "",
        maximo: {$max: '$DURACION_SEG'},
        minimo: {$min:'$DURACION_SEG'},
        promedio: {$avg:'$DURACION_SEG'},
        sumaDuracionSeg: {$sum: "$DURACION_SEG"},
        "contarResultados": {"$sum": 1} }},
    
    ]);

//Distintos operadores que contiene la informacion de consumo de un cliente
db.consumo.aggregate( [ { $group : { _id : "$OPERADOR_RAN" } } ] );

//cantidad de consumos de voz por operador de telefonia

db.consumo.aggregate(  
                      [                                 
                       {$group:                         
                               { _id:"$OPERADOR_RAN",         
                                 cant_consumos:          
                                              {$sum:1}  
                               }
                        }
                       ]
                     );


//cantidad de clientes que tienen planes pospago y prepago
db.cliente.aggregate(  
                      [                                 
                       {$group:                         
                               { _id:"$_SERVICIO",         
                                 cant_clientes:          
                                              {$sum:1}  
                               }
                        }
                       ]
                    );
                       
//suma de duracion en segundos segun operador de telefonia

db.consumo.aggregate(  
                      [                                 
                       {$group:                         
                               { _id:"$OPERADOR_RAN",         
                                 duracion_segundos:          
                                              {$sum:"$DURACION_SEG"}  
                               }
                        }
                       ]
                    );


//suma de monto de facturacion por fecha de la factura 
db.facturation.aggregate(  
                      [                                 
                       {$group:                         
                               { _id:"$FACTURA_FECHA_VENCIMIENTO",         
                                 monto_facturacion: {$sum:"$FACTURA_MONTO"},
                                 "contarResultados": {"$sum": 1}  
                               }
                        }
                       ]
                    );