#!/bin/bash

cd `dirname $0` &&
  echo "Installing bundle" &&
  bundle --quiet &&
  bundle exec ruby app.rb
