for n in 1 2 3 4 ; do
  docker exec host$n systemctl start sshd
done
