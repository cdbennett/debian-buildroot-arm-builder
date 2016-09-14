#!/bin/sh
echo "Removing documentation..."
find /usr/share/doc -depth -type f ! -name copyright | xargs --no-run-if-empty rm || true
find /usr/share/doc -empty | xargs --no-run-if-empty rmdir || true
rm -rf /usr/share/man /usr/share/groff /usr/share/info /usr/share/lintian /usr/share/linda /var/cache/man
