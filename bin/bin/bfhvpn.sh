export BW_SESSION=$(bw unlock --raw)
echo $(bw get password e80b9e18-8752-4205-919a-ab514bac3dbc) | sudo -S openconnect \
    -F main:username=loffk2 \
    -F main:password=$(bw get password vc41.bfh.ch) \
    -F challenge:answer=$(bw get totp vc41.bfh.ch) \
    vpn.bfh.ch
export BW_SESSION=''
unset BW_SESSION
