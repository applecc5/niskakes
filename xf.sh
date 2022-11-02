#!/bin/sh
##

# Set ARG
UUID=e067d10b-7da9-4e25-94d0-f580db764a6f
#ARCH="64"
cat <<EOF >/etc/v2ray/config.json
{
    "log": {
        "loglevel": "warning"
    },
	"inbounds": [
		{
			"listen": "0.0.0.0",
			"port": 8080,
			"protocol": "vless",
			"settings": {
				"clients": [
					{
						"id": "$UUID"
					}
				],
			"decryption": "none"
		},
		"streamSettings": {
			"network": "ws",
			"wsSettings": {
					"path": "/$UUID-vless"
				}
			}
		}
	],
	"outbounds": [
		{
			"protocol": "freedom"
		}
	]
}
EOF


chmod +x /usr/bin/v2ray/v2ray
ls -la /usr/bin/v2ray/*
echo "Install done"
echo "--------------------------------"
echo "Fly App Name: ${FLY_APP_NAME}"
echo "Fly App Region: ${FLY_REGION}"
echo "V2Ray UUID: ${UUID}"
echo "--------------------------------"

# Run v2ray
/usr/bin/v2ray/v2ray  run -config=/etc/v2ray/config.json
