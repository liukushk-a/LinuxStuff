# README per installazione e manutenzione di OpenVSP
## Installazione
In sostanza bisogna seguire la guida a [questo link](https://openvsp.org/wiki/doku.php?id=ubuntu_instructions), per le distribuzioni di tipo Debian, come Ubuntu.

Ci sono come al solito dei prerequisiti da installare, ma in teoria tu dovresti averli già tutti:

    $ sudo apt-get install python3-dev git git-gui cmake libxml2-dev libfltk1.3-dev g++ libcpptest-dev libjpeg-dev libglm-dev libeigen3-dev libcminpack-dev libglew-dev swig doxygen graphviz texlive-latex-base

Poi bisogna creare delle cartelle:

    mkdir OpenVSP && cd OpenVSP

    mkdir repo build buildlibs

    git clone --depth=1 https://github.com/OpenVSP/OpenVSP.git repo

In questo modo tu cloni la versione di OpenVSP nella cartella "repo".

Poi prepari i file build per le librerie:

    cd buildlibs

    cmake -DVSP_USE_SYSTEM_ADEPT2=false -DVSP_USE_SYSTEM_CLIPPER2=false -DVSP_USE_SYSTEM_CMINPACK=false -DVSP_USE_SYSTEM_CODEELI=false -DVSP_USE_SYSTEM_CPPTEST=false -DVSP_USE_SYSTEM_DELABELLA=false -DVSP_USE_SYSTEM_EIGEN=false -DVSP_USE_SYSTEM_EXPRPARSE=false -DVSP_USE_SYSTEM_FLTK=false -DVSP_USE_SYSTEM_GLEW=true -DVSP_USE_SYSTEM_GLM=false -DVSP_USE_SYSTEM_LIBIGES=false -DVSP_USE_SYSTEM_LIBXML2=true -DVSP_USE_SYSTEM_OPENABF=false -DVSP_USE_SYSTEM_PINOCCHIO=false -DVSP_USE_SYSTEM_STEPCODE=false -DVSP_USE_SYSTEM_TRIANGLE=false ../repo/Libraries -DCMAKE_BUILD_TYPE=Release

Dopo, fai il build delle librerie, usando quanti core tu voglia:

    make -j4

Ti rimane da buildare OpenVSP:

    cd ../build

Ricordati di cambiare il your/path/to in questo comando:

    cmake ../repo/src/ -DVSP_LIBRARY_PATH=/home/your/path/to/OpenVSP/buildlibs -DCMAKE_BUILD_TYPE=Release -DVSP_CPACK_GEN=DEB

Poi lanci la vera costruzione di OpenVSP:

    make -j4

E poi crei il pacchetto .deb:

    make package

Questo genera il pacchetto .deb, che poi puoi usare per l'installazione:

    sudo dpkg -i OpenVSP-3.41.1-Linux.deb

È interessante notare che in realtà il pacchetto .deb può anche essere scaricato dall'altra pagina di installazione di OpenVSP, in teoria quel metodo dovrebbe essere più veloce, ma non l'ho mai provato al momento, ho sempre compilato da sorgente, quindi non saprei se funzioni oppure no, finora da sorgente è andato tutto bene, quindi... vedi tu.

# Aggiornamento
Se hai installato il pacchetto .deb scaricandolo direttamente dalla pagina dei download, puoi eliminarlo e scaricarne un altro per avere già tutto.

Se invece hai compilato da sorgente, entra nella cartella repo e vedi che è una cartella .git, di conseguenza puoi fare:

    git pull origin main

In questo modo aggiorni la cartella secondo l'ultimo push degli sviluppatori e hai tutto all'ultima versione.

Dopo ciò, devi ripartire dalla preparazione dei file per il build delle libraries, quindi da:

    cd buildlibs

    cmake ...

Vai avanti ripetendo tutti i passaggi e così aggiornerai OpenVSP.