# Use an official Ruby image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Set working directory
WORKDIR /usr/src/app

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the repo
COPY . .

# Expose Jekyll default port
EXPOSE 4000

# Default command: build & serve
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]