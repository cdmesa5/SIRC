import web
import request
from model import Model

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
    object_list = Model.get_users(self)
    return render.list_usuarios()

class crearUsuario:
  def GET(self):
    return render.form()

class guardarUsuario:
  def POST(self):
    usuario = web.input()
    var = (usuario['codigo'], usuario['nombre'], usuario['apellido'], usuario['correo'])
    Model.insert_user(self, var)
    return render.exitoso()


if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
