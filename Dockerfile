FROM ruby:3.2-alpine

ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
WORKDIR ${ROOT}

RUN apk update && \
    apk add --no-cache \
        gcc \
        git \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        openssh \
        postgresql-dev \
        tzdata \
        nodejs \
        npm
COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN bundle install

COPY . ${ROOT}
# RUN bin/setup

# CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD ["bin/dev"]
CMD ["sh"]
