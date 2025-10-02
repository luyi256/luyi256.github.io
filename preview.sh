#!/bin/bash

# Quick preview script for al-folio Jekyll website
# Usage: ./preview.sh

echo "🚀 Starting al-folio website preview..."

# Check if Docker is available and use it (recommended)
if command -v docker &> /dev/null && command -v docker-compose &> /dev/null; then
    echo "📦 Using Docker for preview..."
    echo "🔗 Website will be available at: http://localhost:4000"
    echo "Press Ctrl+C to stop the preview server"
    echo ""
    
    # Pull latest image and start
    docker compose pull
    docker compose up
    
elif command -v bundle &> /dev/null; then
    echo "💎 Using local Ruby/Jekyll for preview..."
    echo "🔗 Website will be available at: http://localhost:4000"
    echo "Press Ctrl+C to stop the preview server"
    echo ""
    
    # Install dependencies if needed
    if [ ! -d "vendor/bundle" ]; then
        echo "📥 Installing Ruby dependencies..."
        bundle install
    fi
    
    # Start Jekyll server with live reload
    bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload --incremental
    
else
    echo "❌ Error: Neither Docker nor Ruby/Jekyll found!"
    echo ""
    echo "Please install one of the following:"
    echo "1. Docker & docker-compose (recommended)"
    echo "2. Ruby, Jekyll, and Bundler"
    echo ""
    echo "See INSTALL.md for detailed installation instructions."
    exit 1
fi