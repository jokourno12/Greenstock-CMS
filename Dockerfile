# Gunakan base image Tomcat
FROM tomcat:9.0.89-jdk17

# Metadata
LABEL maintainer="Jokourno"

# Hapus seluruh isi direktori /usr/local/tomcat/
RUN rm -rf /usr/local/tomcat/*

# Copy semua data yang sejajar dengan Dockerfile ke dalam /usr/local/tomcat/
COPY . /usr/local/tomcat/

# Expose port yang digunakan oleh Tomcat
EXPOSE 8080

# Command untuk menjalankan Tomcat saat kontainer dimulai
CMD ["/bin/bash", "-c", "cd /usr/local/tomcat/bin && ./magnolia_control.sh start && tail -f ../logs/catalina.out"]
