
# Entorno de desarollo para DESER en Vagrant

Archivos de configuración para construir automaticamente una maquina virtual con las herramientas básicas para desarrollar las prácticas de DESER.

## Forma de uso

0. Instala el software listado en la sección «Prerequisitos».
1. Clona el repositorio.
2. Ajusta el parametro `provider` y otras opciones del `Vagrantfile`.
3. Ejecuta `vagrant up` para construir la maquina virtual. Posteriormente, ejecuta `vagrant reload`.
4. Conectate a la máquina virtual con `vagrant ssh`. Ve al directorio sincronizado con `cd /vagrant`.

## Prerequisitos

* [Vagrant][0]
* [Virtualbox][1] y el paquete de extensión.

## Software incluido

* [Ubuntu Bionic][2]: Versión LTS.
* [Ruby][11] y [RVM][3]: Versión 2.6.x.
* [Rails][6]: Con las siguientes gemas:
  - RSpec
  - Cucumber
  - Mailcatcher
  - Pry-Byebug
  - PG
  - Redis-Rails
  - Webpacker
  - Bundler
* [Yarn][7] and [Webpacker][8]
* [Postgres][4]
* [Redis][5]
* [Ngrok][10]
* ZSH Shell (con [Oh-My-Zsh!][9]) 

---
[0]: https://www.vagrantup.com/downloads.html
[1]: https://www.virtualbox.org/wiki/Downloads
[2]: https://app.vagrantup.com/ubuntu/boxes/bionic64
[3]: https://rvm.io/
[4]: https://www.postgresql.org/
[5]: https://redis.io/
[6]: https://rubyonrails.org/
[7]: https://yarnpkg.com/
[8]: https://github.com/rails/webpacker
[9]: http://ohmyz.sh/
[10]: https://ngrok.com/
[11]: https://www.ruby-lang.org/
