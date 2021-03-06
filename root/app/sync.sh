#!/usr/bin/with-contenv sh

if [ -n "$HEALTHCHECK_ID" ]; then
	curl -sS -X POST -o /dev/null "https://hc-ping.com/$HEALTHCHECK_ID/start"
fi

/app/gitout /config/config.toml /data

if [ -n "$HEALTHCHECK_ID" ]; then
	curl -sS -X POST -o /dev/null --fail "https://hc-ping.com/$HEALTHCHECK_ID"
fi
