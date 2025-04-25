# Istruizioni per l'installazione e l'uso di Anaconda

Tutto ciò è stato fatto su Ubuntu 24.04.

Per l'installazione dell'ultima versione di anaconda, puoi andare a [questa pagina](https://repo.anaconda.com/archive/) e scaricare l'ultima versione con x86_64.sh.

Le informazioni sono state prese soprattutto da [questo video](https://www.youtube.com/watch?v=MTjuCYtaAVw).

Dopo, i comandi da seguire sono i seguenti.

Inizia spostandoti in questa cartella

    cd /tmp

che a quanto ho capito è una sorta di cartella temporanea, il cui contenuto viene cancellato dopo un po', anche se non so bene perchè.

Poi, parti con il download di Anaconda vero e proprio, scrivendo questo:

    wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

chiaramente sostituendo Anaconda3 eccetera con la tua versione, la versione che vuoi scaricare.

Puoi controllare che l'installazione sia andata a buon fine facendo:

    sha256sum Anaconda3-2024.10-1-Linux-x86_64.sh

e vedendo che ti dovrebbe restituire una stringa molto lunga, che dovresti confrontare con la stringa su [questa pagina](https://repo.anaconda.com/archive/), che puoi vedere affianco a ciò che hai scaricato.

Poi procedi con l'installazione vera e propria, così:

    bash Anaconda3-2024.10-1-Linux-x86_64.sh

E quì inizia la parte più merdosa, perchè non so come mai, ma ci sono sempre dei problemi del cazzo...

In sostanza tu premi Enter, così inizia l'installazione, poi arriva lo spataffio delle cose da leggere e tu premi enter finchè non si levano dalle balle. Poi ti chiede se accetti i termini e condizioni e tu chiaramente scrivi:

    yes

A questo punto poi, dopo l'installazione, ti chiederà se vuoi che anaconda si avvii automaticamente all'avvio della macchina e tu in teoria potresti rispondere di no, ma se lo fai, poi, è un problema di merda avviare anaconda... perciò ciò che fai è rispondere:

    yes

e dopo aver fatto ciò, riapri il terminale e fai un run di questa stringa quì:

    conda config --set auto_activate_base false

e in questo modo tu al momento dell'avvio del terminale non hai più (base) affianco al tuo nome e sai che stai usando il tuo python di sistema perchè se fai il run di:

    which python3

ottieni in cambio:

    /usr/bin/python3

Se adesso tu runni:

    conda activate

ottieni sul terminale questo:

    (base) liukushka@liukushka:~$

Per disattivarlo, semplicemente runni:

    conda deactivate

e tutto torna alla normalità.
