  #Section http_ldap
  if [ "${AUTH_TYPE}" = 'HTTP_LDAP' -o ${AUTH_TYPE} = "LDAP" ]; then
    set_gerrit_config auth.type "${AUTH_TYPE}"
    set_gerrit_config auth.gitBasicAuth true
    if [ "${AUTH_TYPE}" = 'HTTP_LDAP' ]; then
      set_gerrit_config auth.httpHeader "X-Remote-User"
      set_gerrit_config auth.trustContainerAuth true
    fi
    [ -z "${LDAP_SERVER}" ]                   || set_gerrit_config ldap.server "ldap://${LDAP_SERVER}"
    [ -z "${LDAP_SSLVERIFY}" ]                || set_gerrit_config ldap.sslVerify "${LDAP_SSLVERIFY}"
    [ -z "${LDAP_GROUPSVISIBLETOALL}" ]       || set_gerrit_config ldap.groupsVisibleToAll "${LDAP_GROUPSVISIBLETOALL}"
    [ -z "${LDAP_USERNAME}" ]                 || set_gerrit_config ldap.username "${LDAP_USERNAME}"
    [ -z "${LDAP_PASSWORD}" ]                 || set_secure_config ldap.password "${LDAP_PASSWORD}"
    [ -z "${LDAP_REFERRAL}" ]                 || set_gerrit_config ldap.referral "${LDAP_REFERRAL}"
    [ -z "${LDAP_READTIMEOUT}" ]              || set_gerrit_config ldap.readTimeout "${LDAP_READTIMEOUT}"
    [ -z "${LDAP_ACCOUNTBASE}" ]              || set_gerrit_config ldap.accountBase "${LDAP_ACCOUNTBASE}"
    [ -z "${LDAP_ACCOUNTSCOPE}" ]             || set_gerrit_config ldap.accountScope "${LDAP_ACCOUNTSCOPE}"
    [ -z "${LDAP_ACCOUNTPATTERN}" ]           || set_gerrit_config ldap.accountPattern "${LDAP_ACCOUNTPATTERN}"
    [ -z "${LDAP_ACCOUNTFULLNAME}" ]          || set_gerrit_config ldap.accountFullName "${LDAP_ACCOUNTFULLNAME}"
    [ -z "${LDAP_ACCOUNTEMAILADDRESS}" ]      || set_gerrit_config ldap.accountEmailAddress "${LDAP_ACCOUNTEMAILADDRESS}"
    [ -z "${LDAP_ACCOUNTSSHUSERNAME}" ]       || set_gerrit_config ldap.accountSshUserName "${LDAP_ACCOUNTSSHUSERNAME}"
    [ -z "${LDAP_ACCOUNTMEMBERFIELD}" ]       || set_gerrit_config ldap.accountMemberField "${LDAP_ACCOUNTMEMBERFIELD}"
    [ -z "${LDAP_FETCHMEMBEROFEAGERLY}" ]     || set_gerrit_config ldap.fetchMemberOfEagerly "${LDAP_FETCHMEMBEROFEAGERLY}"
    [ -z "${LDAP_GROUPBASE}" ]                || set_gerrit_config ldap.groupBase "${LDAP_GROUPBASE}"
    [ -z "${LDAP_GROUPSCOPE}" ]               || set_gerrit_config ldap.groupScope "${LDAP_GROUPSCOPE}"
    [ -z "${LDAP_GROUPPATTERN}" ]             || set_gerrit_config ldap.groupPattern "${LDAP_GROUPPATTERN}"
    [ -z "${LDAP_GROUPMEMBERPATTERN}" ]       || set_gerrit_config ldap.groupMemberPattern "${LDAP_GROUPMEMBERPATTERN}"
    [ -z "${LDAP_GROUPNAME}" ]                || set_gerrit_config ldap.groupName "${LDAP_GROUPNAME}"
    [ -z "${LDAP_LOCALUSERNAMETOLOWERCASE}" ] || set_gerrit_config ldap.localUsernameToLowerCase "${LDAP_LOCALUSERNAMETOLOWERCASE}"
    [ -z "${LDAP_AUTHENTICATION}" ]           || set_gerrit_config ldap.authentication "${LDAP_AUTHENTICATION}"
    [ -z "${LDAP_USECONNECTIONPOOLING}" ]     || set_gerrit_config ldap.useConnectionPooling "${LDAP_USECONNECTIONPOOLING}"
    [ -z "${LDAP_CONNECTTIMEOUT}" ]           || set_gerrit_config ldap.connectTimeout "${LDAP_CONNECTTIMEOUT}"
  fi
