# Installazione modulo aggiunto persu2 

Provo a vedere di capire che passaggi sono stati fatti per l'installazione di quel modulo. Tutti i passaggi sono stati fatti su Ubuntu 24.04, per altre distribuzioni, non assicuro nulla. Segnerò anche i comandi che hanno dato errori e problemi, per completezza, anche se non ho esperienza di ciò che sta succedendo e quindi non saprei come risolvere tali problemi.

All'inizio è stata creata dentro la cartella Codes, dove viene installato normalmente SU2, un'altra cartella:

    cd Codes
    mkdir SU2ADJ

Dentro questa cartella, infatti, verrà fatta la configurazione del nuovo SU2, con disponibilità del modulo per l'aggiunto.

Dopo, si torna dentro SU2:

    cd SU2

Bisogna rimuovere una cartella che era necessaria per il build del vecchio SU2:

    rm -rf build/

Ora, sempre restando dentro SU2, è stato provato questo comando:

    CXXFLAGS="-mtune=native -march=native" ./meson.py buildADJ --prefix=/home/liukushka/Codes/SU2ADJ -Denable-autodiff=true -Denable-directdiff=true -Denable-pywrapper=true -Denable-tecio=false -Denable-cgns=false

Poi, suppongo per fare il vero build, il comando successivo è:

    ./ninja -C buildADJ/ install -j6

Quì deve esserci stato un errore nel build, infatti poi si è cercato di richiamare le condizioni di compilazione per C++:

    CXXFLAGS="-mtune=native -march=native" ./meson.py buildADJ --prefix=/home/liukushka/Codes/SU2ADJ -Denable-autodiff=true -Denable-directdiff=true -Denable-pywrapper=true -Denable-tecio=false -Denable-cgns=false

A questo punto, ci deve essere stato un errore, perciò è stato deciso di richiamare le impostazioni del compilatore con il "reconfigure" finale:

    CXXFLAGS="-mtune=native -march=native" ./meson.py buildADJ --prefix=/home/liukushka/Codes/SU2ADJ -Denable-autodiff=true -Denable-directdiff=true -Denable-pywrapper=true -Denable-tecio=false -Denable-cgns=false --reconfigure

Per spiegare velocemente i comandi, CXXFLAGS="-mtune=native -march=native" è necessario per dire al compilatore di ottimizzare il codice per l'architettura del computer su cui stai runnando. ./meson.py buildADJ è necessario per eseguire lo script e buildADJ è la cartella temporanea in cui andranno i file per la compilazione. --prefix=/home/liukushka/Codes/SU2ADJ serve per dire dove vuoi installare SU2. Quelle dopo sono tutte opzioni:

- -Denable-autodiff=true serve per la differenziazione automatica, necessaria per l'aggiunto.

- -Denable-directdiff=true serve per la differenziazione diretta, anche questa utile per l'aggiunto.

- -Denable-pywrapper=true serve per abilitare il wrapper di python per usare SU2 con python

- -Denable-tecio=false serve per il supporto del formato di TecPlot, in teoria andrebbe messo true se usi TecPlot

- -Denable-cgns=false per il supporto dei file mesh CGNS 

Ad ogni modo, dopo il passaggio con il --reconfigure, si è ancora dentro la cartella SU2 e si lancia il comando per il build:

    ./ninja -C buildADJ/ install -j6

Adesso ciò che faccio è commentare le righe che avevo scritto nel .bashrc dopo l'installazione normale di SU2:

    #export SU2_RUN=/home/liukushka/Codes/SU2_bin/bin
    #export SU2_HOME=/home/liukushka/Codes/SU2
    #export PATH=$PATH:$SU2_RUN
    #export PYTHONPATH=$PYTHONPATH:$SU2_RUN

E scrivere queste righe al loro posto:

    export SU2_RUN=/home/liukushka/Codes/SU2ADJ/bin
    export SU2_HOME=/home/liukushka/Codes/SU2
    export PATH=$PATH:$SU2_RUN
    export PYTHONPATH=$PYTHONPATH:$SU2_RUN

Poi faccio un source:

    source ~/.bashrc

Se adesso si esegue:

    which SU2_CFD

Si dovrebbe ottenere questo:

   /home/liukushka/Codes/SU2ADJ/bin/SU2_CFD 

Adesso ci sono questioni da sistemare con python: non so se ho capito correttamente ma la versione di python potrebbe dare problemi, quindi sarebbe il caso di verificare per che versione di python la cosa funziona. Io uso al momento 3.12.3 e sta funzionando, quindi bene, ma in ogni caso sarebbe bene capirci qualcosa di che versione funziona e quale no.

Anche con pip3 succedono cose simili a python, la versione che uso è 24.0.

È necessario fare delle installazioni di moduli per far funzionare l'aggiunto:

    pip3 install mpi4py

Poi anche installazioni con apt:

    sudo apt install python3-mpi4py
    sudo apt install openmpi
    sudo apt install libopenmpi

Adesso le cose dovrebbero andare. Posso clonare dove voglio la cartella di SU2 con tutti i tutorial:

    git clone git@github.com:su2code/Tutorials.git

Se adesso entro dentro sta cartella tutorial, mi muovo in questo modo:

    cd Tutorials/design/Inviscid_2D_Unconstrained_NACA0012

Per la cronaca, ho preso un esempio a caso, si può verificare anche con altri esempi. 

La sintassi per chiamare la risoluzione con l'aggiunto è molto particolare e macchinosa e si fa così:

    python3 $SU2_RUN/shape_optimization.py -g CONTINUOUS_ADJOINT -o SLSQP -f inv_NACA0012_basic.cfg -n 4

Il motivo è che devi sempre dire a SU2 di prendere lo script python in quella posizione.



