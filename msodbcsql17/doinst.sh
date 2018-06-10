
#=============================#
if [ -z $(grep "/opt/microsoft/msodbcsql17/lib64" /etc/ld.so.conf) ]; then
  echo "Spamming /etc/ld.so.conf"
  echo "/opt/microsoft/msodbcsql17/lib64" >>/etc/ld.so.conf
  /sbin/ldconfig
fi

echo "Install msodbcsql17 driver with this command (run as root):"
echo "  odbcinst -i -s -f /opt/microsoft/msodbcsql17/etc/odbcinst.ini -l"
echo
