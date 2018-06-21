FROM wordpress

# Install requirements for wp-cli support
RUN apt-get update \
  && apt-get install -y sudo less git vim nano mysql-client \
  && rm -rf /var/lib/apt/lists/*

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN ssh-keygen -q -t rsa -N '' -f /id_rsa
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar
