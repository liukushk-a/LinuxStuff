# Firedrake
[Installare Firedrake](https://www.firedrakeproject.org/firedrake/install.html#firedrake-check)

Questo è il link per l'installazione di firedrake, basta seguire tutti i passaggi e l'installazione è abbastanza ez. Il problema è che ti viene il colpo che possa andare in conflitto con la versione di python3 che usa globalmente Ubuntu. Non dovrebbe succedere, perchè non è successo la prima volta, ma se dovessi avere paura, per verificare di non aver compromesso nulla, fai:
    
    python3 --version
    which python3

Dovresti ottenere qualcosa come:

    /usr/bin/python3

simbolo che il python di sistema è ancora intatto.

Poi puoi attivare firedrake scrivendo:

    source ~/firedrake/bin/activate

e a quel punto runnare ancora

    python3 --version
    which python3

e dovresti ottenere qualcosa come:

    /home/tuo_utente/firedrake/bin/python3

Per disattivare firedrake e tornare sul python d'ambiente puoi fare:

    deactivate

Per verificare che le librerie che hai installato sul python di sistema siano ancora al loro posto puoi fare:

    python3 -c "import numpy; print(numpy.__version__)"

e se non ottieni errori, allora va tutto bene.

Poi puoi controllare che pip non sia stato sovrascritto usando:

    which pip
    pip --version

Dovresti ottenere:

    /usr/bin/pip
    pip 23.x.x from /usr/lib/python3/dist-packages

Se invece ottenessi qualcosa come

    ~/firedrake/bin/pip

vuol dire che stai ancora usando il python di Firedrake.


