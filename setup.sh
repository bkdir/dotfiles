rsync \
  --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude ".osx" \
  --exclude "setup.sh" \
  --exclude "bash" \
  -avh --no-perms . ~;
