class Nave{
  var velocidad
  var direccion


  method acelerar(cantidad){
    velocidad = (velocidad + cantidad).min(100000)
  }

  method desacelerar(cantidad){
    velocidad = (velocidad - cantidad).max(0)
  }

  method irHaciaElSol() {
    direccion = 10
  }

  method escaparDelSol() {
    direccion = -10
  }

  method ponerseParaleloAlSol() {
    direccion = 0
  }

  method acercarseUnPocoAlSol(){
    direccion = direccion + 1 .min(10)
  }

  method alejarseUnPocoAlSol(){
    direccion = direccion - 1 .max(-10)
  }

  method prepararViaje() // metodo abstracto


}

// NaveBaliza Hija de Clase Padre "Nave"
class NaveBaliza inherits Nave{
  var colorBaliza = "azul"
  method cambiarColorDeBaliza(colorNuevo) {
      colorBaliza = colorNuevo
  }
  override method prepararViaje() { // seteo de metodo abstracto.
    colorBaliza = "Verde"
    self.acercarseUnPocoAlSol()    
    // Caso que tenga un metodo Generico para todos.
    // super()
  }
  // Pausa
}