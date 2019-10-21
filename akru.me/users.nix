###
##
##  Users available on akru.me machine
##
###

{ pkgs, ... }:

{

  users.extraUsers.root = {
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjNHoP86ELLylAizWEvlZqceMXnEup6OZi8JEGng8NJ12d7ofqMzy+yQEPgzzFX1Cr6oTKtzMMLFg5+T0gN/xSbd/Yvu62K8gUoePHajKg/rT78LBjFLpSHZEHjS2vlRenmgMbT1y3qJe99iw+xmJ6P1p9mRlB5xsAC+gCd5kRbw4vO7im3mi6qd6gZZql+fyFRkoVdM0DF0hR4AMAUPM9PGJsSkoMN5PxvCw048f/+0sc5zXMTqy83/eoaYYOu9AtpaXQUqErI8OHJ0DZoai3w0fKXBj9eNt3h0eTBFUXAjjsvRjx0QkOnyBrZKYXk3tEnIThWJy2qmMY4IOZRyO4RhMC/zBmSJKg5ji7CUeOEnDAs4s2INNVybc0r2ms9BXqIiC+TtjiJImJyjQ2KHkRXLsCHVj9ned9NgcVSJrqA34Ywpu4wmyvAANfsa6Ubz29JoMCeTH7h+W77hw3DF59I5Ju6PBSkg0Z4Vh9xMuocVYiRRI4gBDOuf7yQn+kS6h7Kr69fbXijqccy5jkUn/90aAwzmz3FaXasE+n/StC0IrCkksnitiPwfvh3a67GC/2W6H2gqPvIW6t571NI3sYD24FKtae+T/ROLnwDk6GUFuaWN7ZehsYfE7mS5dXwXY+YxP2kmNgWr7r5dkdj5mm7y71mDyKbAd9XwGg7Q5LdQ== akru@krakov"
    ];
  };

  users.extraUsers.akru = {
    shell = pkgs.zsh;
    home = "/home/akru";
    isNormalUser = true;
    createHome = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjNHoP86ELLylAizWEvlZqceMXnEup6OZi8JEGng8NJ12d7ofqMzy+yQEPgzzFX1Cr6oTKtzMMLFg5+T0gN/xSbd/Yvu62K8gUoePHajKg/rT78LBjFLpSHZEHjS2vlRenmgMbT1y3qJe99iw+xmJ6P1p9mRlB5xsAC+gCd5kRbw4vO7im3mi6qd6gZZql+fyFRkoVdM0DF0hR4AMAUPM9PGJsSkoMN5PxvCw048f/+0sc5zXMTqy83/eoaYYOu9AtpaXQUqErI8OHJ0DZoai3w0fKXBj9eNt3h0eTBFUXAjjsvRjx0QkOnyBrZKYXk3tEnIThWJy2qmMY4IOZRyO4RhMC/zBmSJKg5ji7CUeOEnDAs4s2INNVybc0r2ms9BXqIiC+TtjiJImJyjQ2KHkRXLsCHVj9ned9NgcVSJrqA34Ywpu4wmyvAANfsa6Ubz29JoMCeTH7h+W77hw3DF59I5Ju6PBSkg0Z4Vh9xMuocVYiRRI4gBDOuf7yQn+kS6h7Kr69fbXijqccy5jkUn/90aAwzmz3FaXasE+n/StC0IrCkksnitiPwfvh3a67GC/2W6H2gqPvIW6t571NI3sYD24FKtae+T/ROLnwDk6GUFuaWN7ZehsYfE7mS5dXwXY+YxP2kmNgWr7r5dkdj5mm7y71mDyKbAd9XwGg7Q5LdQ== akru@krakov"
    ];
  };

}
