NOTES FOR NOOBS

- install file maps package folders to installed folders
- changelog has incremental entries in it -- new entries are created with:
  # i means increment, dch means debchangelog
  dch -i 

- for the icon theme make sure the folder exists in the Directory List bit of index.theme

BUILDING IT
    # debuild builds it    
    debuild -S
    # debclean undoes this
    # dput sends the package
    cd ..    
    dput ppa:canonical-ux/ppa unity[tab]_[tab]
