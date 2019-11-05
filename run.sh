#!/bin/bash

# set up ssmtp
if [[ $SESmailhub ]]; then
cat << EOF > /etc/ssmtp/ssmtp.conf
debug=yes

mailhub=$SESmailhub

Hostname=$HOSTNAME

FromLineOverride=yes
UseSTARTTLS=yes
EOF
fi

if [[ $SESAuthUser ]]; then
cat << EOF >> /etc/ssmtp/ssmtp.conf
$SESAuthUser
EOF
fi

if [[ $SESAuthPass ]]; then
cat << EOF >> /etc/ssmtp/ssmtp.conf
$SESAuthPass
EOF
fi

apache2-foreground
