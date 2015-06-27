users:
  ## Minimal required pillar values
  auser:
    fullname: A User

  ## Full list of pillar values
  buser:
    fullname: B User
    password: $6$w.............
    home: /custom/buser
    createhome: True
    manage_vimrc: False
    manage_bashrc: False
    expire: 16426
    sudouser: True
    sudo_rules:
      - ALL=(root) /usr/bin/find
      - ALL=(otheruser) /usr/bin/script.sh
    sudo_defaults:
      - '!requiretty'
    shell: /bin/bash
    prime_group:
      name: primarygroup
      gid: 500
    groups:
      - users
    ssh_key_type: rsa
    # You can inline the private keys ...
    ssh_keys:
      privkey: PRIVATEKEY
      pubkey: PUBLICKEY
    # ... or you can pull them from a different pillar,
    # for example one called "ssh_keys":
    ssh_keys_pillar:
      id_rsa: "ssh_keys"
      another_key_pair: "ssh_keys"
    ssh_auth:
      - PUBLICKEY
    ssh_auth.absent:
      - PUBLICKEY_TO_BE_REMOVED
    # Generates an authorized_keys file for the user
    # with the given keys
    ssh_auth_file:
      - PUBLICKEY
    # If you prefer to keep public keys as files rather
    # than inline in pillar, this works.
    ssh_auth_sources:
      - salt://keys/buser.id_rsa.pub
    # Manage the ~/.ssh/config file
    ssh_config:
      all:
        hostname: "*"
        options:
          - "StrictHostKeyChecking no"
          - "UserKnownHostsFile=/dev/null"
      importanthost:
        hostname: "needcheck.example.com"
        options:
          - "StrictHostKeyChecking yes"

    google_auth:
      ssh: |
        SOMEGAUTHHASHVAL
        " RESETTING_TIME_SKEW 46956472+2 46991595-2
        " RATE_LIMIT 3 30 1415800560
        " DISALLOW_REUSE 47193352
        " TOTP_AUTH
        11111111
        22222222
        33333333
        44444444
        55555555

  ## Absent user
  cuser:
    absent: True
    purge: True
    force: True


## Old syntax of absent_users still supported
absent_users:
  - donald
  - bad_guy
