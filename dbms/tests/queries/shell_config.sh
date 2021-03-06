
export CLICKHOUSE_BINARY=${CLICKHOUSE_BINARY:="clickhouse"}
[ -x "$CLICKHOUSE_BINARY-client" ] && CLICKHOUSE_CLIENT_BINARY=${CLICKHOUSE_CLIENT_BINARY:=$CLICKHOUSE_BINARY-client} && CLICKHOUSE_CLIENT=${CLICKHOUSE_CLIENT:="$CLICKHOUSE_CLIENT_BINARY"}
[ -x "$CLICKHOUSE_BINARY" ] && CLICKHOUSE_CLIENT_BINARY=${CLICKHOUSE_CLIENT_BINARY:=$CLICKHOUSE_BINARY client} && CLICKHOUSE_CLIENT=${CLICKHOUSE_CLIENT:="$CLICKHOUSE_CLIENT_BINARY"}
export CLICKHOUSE_CLIENT_BINARY=${CLICKHOUSE_CLIENT_BINARY:=$CLICKHOUSE_BINARY-client}
export CLICKHOUSE_CLIENT=${CLICKHOUSE_CLIENT:="$CLICKHOUSE_CLIENT_BINARY"}
export CLICKHOUSE_CLIENT_SERVER_LOGS_LEVEL=${CLICKHOUSE_CLIENT_SERVER_LOGS_LEVEL:="warning"}
export CLICKHOUSE_CLIENT="${CLICKHOUSE_CLIENT} --send_logs_level=${CLICKHOUSE_CLIENT_SERVER_LOGS_LEVEL} ${CLICKHOUSE_CLIENT_OPT}"
[ -x "${CLICKHOUSE_BINARY}-local" ] && CLICKHOUSE_LOCAL=${CLICKHOUSE_LOCAL:="${CLICKHOUSE_BINARY}-local"}
[ -x "${CLICKHOUSE_BINARY}" ] && CLICKHOUSE_LOCAL=${CLICKHOUSE_LOCAL:="${CLICKHOUSE_BINARY} local"}
export CLICKHOUSE_LOCAL=${CLICKHOUSE_LOCAL:="${CLICKHOUSE_BINARY}-local"}

export CLICKHOUSE_CONFIG=${CLICKHOUSE_CONFIG:="/etc/clickhouse-server/config.xml"}
export CLICKHOUSE_CONFIG_CLIENT=${CLICKHOUSE_CONFIG_CLIENT:="/etc/clickhouse-client/config.xml"}

[ -x "${CLICKHOUSE_BINARY}-extract-from-config" ] && CLICKHOUSE_EXTRACT_CONFIG=${CLICKHOUSE_EXTRACT_CONFIG:="$CLICKHOUSE_BINARY-extract-from-config --config=$CLICKHOUSE_CONFIG"}
[ -x "${CLICKHOUSE_BINARY}" ] && CLICKHOUSE_EXTRACT_CONFIG=${CLICKHOUSE_EXTRACT_CONFIG:="$CLICKHOUSE_BINARY extract-from-config --config=$CLICKHOUSE_CONFIG"}
export CLICKHOUSE_EXTRACT_CONFIG=${CLICKHOUSE_EXTRACT_CONFIG:="$CLICKHOUSE_BINARY-extract-from-config --config=$CLICKHOUSE_CONFIG"}

export CLICKHOUSE_CONFIG_GREP=${CLICKHOUSE_CONFIG_GREP:="/etc/clickhouse-server/preprocessed/config.xml"}

export CLICKHOUSE_HOST=${CLICKHOUSE_HOST:="localhost"}
export CLICKHOUSE_PORT_TCP=${CLICKHOUSE_PORT_TCP:=`${CLICKHOUSE_EXTRACT_CONFIG} --try --key=tcp_port 2>/dev/null`} 2>/dev/null
export CLICKHOUSE_PORT_TCP=${CLICKHOUSE_PORT_TCP:="9000"}
export CLICKHOUSE_PORT_TCP_SECURE=${CLICKHOUSE_PORT_TCP_SECURE:=`${CLICKHOUSE_EXTRACT_CONFIG} --try --key=tcp_port_secure 2>/dev/null`} 2>/dev/null
export CLICKHOUSE_PORT_TCP_SECURE=${CLICKHOUSE_PORT_TCP_SECURE:="9440"}
export CLICKHOUSE_PORT_HTTP=${CLICKHOUSE_PORT_HTTP:=`${CLICKHOUSE_EXTRACT_CONFIG} --key=http_port 2>/dev/null`}
export CLICKHOUSE_PORT_HTTP=${CLICKHOUSE_PORT_HTTP:="8123"}
export CLICKHOUSE_PORT_HTTPS=${CLICKHOUSE_PORT_HTTPS:=`${CLICKHOUSE_EXTRACT_CONFIG} --try --key=https_port 2>/dev/null`} 2>/dev/null
export CLICKHOUSE_PORT_HTTPS=${CLICKHOUSE_PORT_HTTPS:="8443"}
export CLICKHOUSE_PORT_HTTP_PROTO=${CLICKHOUSE_PORT_HTTP_PROTO:="http"}
export CLICKHOUSE_URL=${CLICKHOUSE_URL:="${CLICKHOUSE_PORT_HTTP_PROTO}://${CLICKHOUSE_HOST}:${CLICKHOUSE_PORT_HTTP}/"}
export CLICKHOUSE_URL_HTTPS=${CLICKHOUSE_URL_HTTPS:="https://${CLICKHOUSE_HOST}:${CLICKHOUSE_PORT_HTTPS}/"}
export CLICKHOUSE_CURL_COMMAND=${CLICKHOUSE_CURL_COMMAND:="curl"}
export CLICKHOUSE_CURL=${CLICKHOUSE_CURL:="${CLICKHOUSE_CURL_COMMAND} --max-time 10"}
export CLICKHOUSE_TMP=${CLICKHOUSE_TMP:="."}
mkdir -p ${CLICKHOUSE_TMP}
