# Use the official Ruby image as the base image
FROM ruby:3.3.0

# Set environment variables for Rails
ENV RAILS_ENV=development \
    RAILS_LOG_TO_STDOUT=true

# Install essential dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Rails
RUN gem install rails

# Set the working directory for the Rails application
WORKDIR /app

# Create a new Rails application
RUN rails new . --skip-bundle

# Expose port 3000 to the outside world
EXPOSE 3000

# Copy gemfiles before main app to prevent rebuilding with code changes
COPY app/Gemfile .
COPY app/Gemfile.lock .

# Install Rails dependencies (keep here until closer to prod, usfeul for adding in gems, otherwise build will ignore)
RUN bundle install

# Take local dev changes and apply to image
COPY app .

ENV GOOGLE_API_KEY "AIzaSyAarOQG8-wc46OfWwVSg1R_xBc_0tvaim0"

# Specify the command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
