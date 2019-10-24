import web
import request
from model import Modelo

render = web.template.render('templates/')

urls = (
  '/', 'listarUsuario',
  '/crearUsuario', 'crearUsuario',
  '/guardarUsuario', 'guardarUsuario',
  '/exitoso', 'exitoso',
)

class exitoso:
  def GET(self):
    return render.exitoso()

class listarUsuario:
  def GET(self):
    lista_usuarios = Modelo.get_usuarios(self)
    return render.list_usuarios()

class crearUsuario:
  def GET(self):
    return render.form()

class guardarUsuario:
  def POST(self):
    usuario = web.input()
    campos = (usuario['codigo'], usuario['nombre'], usuario['apellido'], usuario['correo'])
    Modelo.insertar_usuario(self, campos)
    return render.exitoso()


if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
