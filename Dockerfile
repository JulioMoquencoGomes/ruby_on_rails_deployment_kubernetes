FROM ruby:3.2.1

RUN apt update
RUN apt upgrade -y
RUN apt install lsb-base lsb-release

ADD . /home/app/web
WORKDIR /home/app/web

RUN bundle install
COPY . /home/app/web

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]