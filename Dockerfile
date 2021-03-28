FROM golang:1.16.2-buster

# Install beego & bee
RUN go get github.com/beego/beego/v2@v2.0.0
RUN go get github.com/beego/bee/v2

# Expose port to public
EXPOSE 8080
EXPOSE 10443

COPY . /var/www/html
WORKDIR /var/www/html

RUN go mod download

CMD bee run -downdoc=true -gendoc=true