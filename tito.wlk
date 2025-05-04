object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    var ingredientes = #{leche, hielo}

    method agregarIngredientes(unIngrediente) {
        ingredientes.add(unIngrediente)
    }

    method nutrientesPorLitro() {
        ingredientes.map({i => i.nutrientes()}.sum())
    }
}

object leche {
  method nutrientes() = 50
}

object hielo {
  method nutrientes() = 30
}

object aguaSaborizada {
    method rendimiento(cantidad) = 1 + wisky.rendimiento(cantidad * 0.25)
}

object coctel {
    var ingredientes = #{wisky, cianuro, terere}

    method rendimiento(cantidad) {
        var cantidadPorBebida = cantidad / ingredientes.size()

        ingredientes.map({i => i.rendimiento(cantidadPorBebida)}).product()
    } 

    method agregarIngredientes(unIngrediente) {
        ingredientes.add(unIngrediente)
    }
}

object coctelSuave {
    var bebidas = #{wisky, cianuro, terere}

    method rendimiento(cantidad) {
        var cantidadPorBebida = cantidad / bebidas.size()

        bebidas.map({b => b.rendimiento(cantidadPorBebida)}.filter({b => b > 0.5}).sum())
    }
}

