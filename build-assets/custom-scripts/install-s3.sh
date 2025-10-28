#!/bin/sh
# install-s3.sh — verifies and installs the Laravel S3 Flysystem adapter on boot

echo "** Checking for AWS S3 Flysystem adapter..."
cd /www/html || exit 1

# Only install if missing
if ! composer show | grep -q "league/flysystem-aws-s3-v3"; then
  echo "** Installing league/flysystem-aws-s3-v3..."
  composer require league/flysystem-aws-s3-v3 --no-interaction --no-progress
else
  echo "** AWS S3 adapter already installed."
fi

# Ensure Laravel config and storage links are fresh
php artisan config:clear
php artisan cache:clear
php artisan storage:link

echo "** S3 verification complete."
