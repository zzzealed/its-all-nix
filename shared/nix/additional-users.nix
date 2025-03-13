{
  config = {
    # User(s)
    users.users.linus = {
      description = "Linus";
      isNormalUser = true;
      hashedPassword = "$y$j9T$XtOS1XUoiedzeI21jw2fO0$u1W2oarvgUTUrSUcVPTsCMmXCgOGAbEx123D9rmaH49";
      home = "/home/linus";

      extraGroups = [
        "samba"
        "vault"
      ];
    };
  };
}
