#!/usr/bin/env zsh

# Set missing language configuration
set_language() {
  echo "Setting ´vagrant´ user language configuration"
  echo -e "\n# Set locale configuration" >> ~/.profile
  echo 'export LC_ALL=en_US.UTF-8' >> ~/.profile
  echo 'export LANG=en_US.UTF-8' >> ~/.profile
  echo "export LANGUAGE=en_US.UTF-8\n" >> ~/.profile
}

# Install and configure PostgreSQL database manager
install_postgres() {
  echo "Installing PostgreSQL"
  sudo apt-get update
  sudo apt-get install -y postgresql postgresql-contrib

  # Set up vagrant user
  sudo -u postgres bash -c "psql -c \"CREATE USER vagrant WITH PASSWORD 'vagrant';\""
  sudo -u postgres bash -c "psql -c \"ALTER USER vagrant WITH SUPERUSER;\""

  # Make available useful extensions to the schemas
  sudo -u postgres bash -c "psql -c \"CREATE EXTENSION unaccent SCHEMA pg_catalog;\""
  sudo -u postgres bash -c "psql -c \"CREATE EXTENSION pg_trgm SCHEMA pg_catalog;\""

  # Start service
  sudo service postgresql start
}

# Install Redis
install_redis() {
  echo "Installing Redis"
  sudo apt-get install -y redis-server
}

# Install RVM
install_rvm() {
  echo 'Installing RVM'
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash
  source $HOME/.rvm/scripts/rvm
  rvm get head
}

# Install Matz Ruby Interpreter and common gems
install_ruby() {
  echo 'Installing Ruby 2.6'
  sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev libpq-dev
  rvm install 2.6
  rvm use 2.6@global
  gem update --system --no-ri --no-rdoc
  gem update --no-ri --no-rdoc
  gem install bundler rails rspec-rails cucumber-rails pg redis-rails webpacker mailcatcher pry-byebug --no-ri --no-rdoc
  rvm use 2.6 --default
  rvm cleanup all
}

# Install Yarn JavaScript modules manager
install_yarn() {
  echo 'Installing Yarn'
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install -y yarn
}

# Install Ngrok secure tunnel manager
install_ngrok() {
  echo 'Installing Ngrok'
  sudo apt install -y unzip
  wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
  sudo unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin
  rm -rf ngrok-stable-linux-amd64.zip
}

# Remove unused software
clean_up() {
  sudo apt -y autoremove && sudo apt autoclean
}

setup() {
  set_language
  install_postgres
  install_redis
  install_rvm
  install_ruby
  install_yarn
  install_ngrok
  clean_up
}

setup "$@"