# Ejecuta un weblogic en la máquina local.
# Una vez ejecutado podemos acceder a él en:
# https://localhost:9002/console/login/LoginForm.jsp

# Gets domain properties path.
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
FILE="domain.properties"
MOUNT="${BASEDIR}/${FILE}"

# Run Weblogic.
echo 'Starting Weblogic 12.2.1.4 con domain.properties:' ${MOUNT}
docker run -d -e DOMAIN_NAME=base_domain \
  --name weblogic12_2_1_4-dev -p 7001:7001 -p 9002:9002 \
	-v "${MOUNT}":/u01/oracle/properties/domain.properties \
	store/oracle/weblogic:12.2.1.4-dev