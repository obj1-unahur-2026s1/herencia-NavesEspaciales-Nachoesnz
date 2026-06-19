class Nave{
  var velocidad
  var direccion
  var combustible

  method velocidad(){
    return velocidad
  }


  method acelerar(cantidad){
    velocidad = (velocidad + cantidad).min(100000)
  }

  method desacelerar(cantidad){
    velocidad = (velocidad - cantidad).max(0)
  }

  method irHaciaElSol() {
    direccion = 10
  }

  method escaparDelSol() { direccion = -10 }
    method ponerseParaleloAlSol() { direccion = 0 }
    method acercarseUnPocoAlSol() { direccion = (direccion + 1).min(10) }
    method alejarseUnPocoDelSol() { direccion = (direccion - 1).max(-10) }

  method combustible(){
    return combustible
  }
  method cargarCombustible(cantidadACargar){
    combustible = combustible + cantidadACargar
  }
  method descargarCombustible(cantidadADescargar){
    combustible = combustible - cantidadADescargar
  }

  method prepararViaje() {
    self.cargarCombustible(30000)
    self.acelerar(5000)
  }

    // Condición base común para TODAS las naves
  method estaTranquila() {
    return combustible >= 4000 && velocidad <= 12000
  }

}

// NaveBaliza Hija de Clase Padre "Nave"
class NaveBaliza inherits Nave{
  var colorBaliza = "azul"
  method colorBaliza(){
    return colorBaliza
  }
  method cambiarColorDeBaliza(colorNuevo) {
      colorBaliza = colorNuevo
  }
  override method prepararViaje() { // seteo de metodo abstracto.
    colorBaliza = "Verde"
    self.ponerseParaleloAlSol()
    super()
  }
  override method estaTranquila(){
    return super() && colorBaliza != "rojo"
  }
}

class NavePasajeros inherits Nave{
  var property cantidadPasajeros

  var racionesComida
  var racionesBebida

  method agregarRacionesBebida(cantidadASumar){
    racionesBebida = racionesBebida + cantidadASumar
  }

  method agregarRacionesComida(cantidadASumar){
    racionesComida = racionesComida + cantidadASumar
  }

  method descargarRacionesBebida(cantidadARestar){
    racionesBebida = racionesBebida - cantidadARestar
  }

  method descargarRacionesComida(cantidadARestar){
    racionesComida = racionesComida - cantidadARestar
  }

  override method prepararViaje(){
    self.agregarRacionesBebida(6 * cantidadPasajeros)
    self.agregarRacionesComida(4 * cantidadPasajeros)
    self.acercarseUnPocoAlSol()
    super()
  }

}

class NaveCombate inherits Nave{
  var visibilidad = false
  var estadoMisiles = false

  method estaInvisible(){
    return visibilidad
  }
  method ponerseInvisible(){
    visibilidad = true
  }
  method ponerseVisible(){
    visibilidad = false 
  }

  method desplegarMisiles(){
    estadoMisiles = true
  }

  method replegarMisiles(){
    estadoMisiles = false
  }

  method misilesDesplegados(){
    return estadoMisiles
  }

  override method prepararViaje(){
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    super()
  }

  override method estaTranquila(){
    return super() && not self.misilesDesplegados()
  }

}

class NaveHospital inherits NavePasajeros{
  var quirofanoEstado
  method prepararQuirofano(){
    quirofanoEstado = true
  }
  method desPrepararQuirofano(){
    quirofanoEstado = false
  }
  method quirofanoEstado(){
    return quirofanoEstado
  }

  override method estaTranquila(){
    return super() && not quirofanoEstado
  }

}

class NaveCombateSigilosa inherits NaveCombate{
  override method estaTranquila(){
    return super() && not self.estaInvisible()
  }
}