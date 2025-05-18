# Istruzioni generali su Lazyvim

Una volta che hai scaricato Lazyvim, ci sono diverse cose a cui devi prestare attenzione se vuoi che funzioni correttamente. Quì di seguito cercherò di scrivere i problemi che ho incontrato e come sono stati risolti.

## Livegrep

Per usare il livegrep, tu devi installare sul terminale una cosa che non viene installata di default. Lazyvim in questo è bastardo, perchè non ti dice da nessuna parte di installarlo, ma l'ho trovato chiedendo a ChatGPT:

  sudo apt install ripgrep 

In questo modo tu hai scaricato, almeno a quanto ho capito, uno strumento che può essere usato anche fuori da neovim, ma che in lazyvim è già ottimizzato, così puoi fare grep molto velocemente.

## Aprire "l'albero"

Per aprire su un pannello laterale l'albero con tutte le cartelle e sottocartelle, bisogna usare il tasto <special>, che nella maggior parte delle installazioni di lazyvim è la barra spaziatrice, seguito dal tasto e.

La cosa interessante è che tu in teoria potresti usare sia la e minuscola che la E maiuscola e teoricamente dovresti riuscire ad aprire l'albero sia nella cartella in cui sei (e), che l'albero più generale partendo dalla cartella home (E).

## Creare un file nell'albero

Quando sei nell'albero puoi navigare sia con le freccette che con i tasti hjkl, di cui parlerò in seguito, ma anche banalmente con il mouse o col trackpad. Una volta che sei nella posizione dove vuoi creare il file, semplicemente premi la lettera a.

In questo modo ti si apre una barra in cui puoi scrivere il nome del file che vuoi, oppure il nome della cartella che vuoi creare. Ricorda che se vuoi creare la cartella, devi far finire il nome con / .

Un altro modo per creare il file è con la seguente sintassi:

  :e nuovoFile.txt

In questo modo, però, crei un file di testo nella directory corrente, quella in cui hai ape Srto neovim, che nel tuo caso, dato che lo apri dal desktop, è la home. Per creare il file nel punto preciso, devi specificare proprio il percorso:

  :e ~/Desktop/Università/nuovoFile.txt 

## Scrivere nei file

Come ben oramai saprai, per passare dalla modalità NORMAL alla INSERT, devi premere la lettera i.

## Salvare il file

Per salvare il file in cui stai lavorando senza chiuderlo, puoi usare la seguente sintassi:

  :w 

Per salvare e chiudere il file, devi usare questa sintassi:

  :wq

Se devi salvare con nome un file, la sintassi è questa:

  :w nomefile.txt

Sempre ricordando che in questo caso te lo salva dove lo hai piazzato, quindi sempre sapere dove vengono creati i file.

## Stampare la directory corrente

Per sapere in che directory ti trovi, la sintassi è praticamente uguale al normale terminale, quindi:

  :pwd

## Muoversi nelle directories 

Anche quì la sintassi è praticamente uguale al terminale normale, quindi se volessi tornare alla directory /home/liukushka/ , potrei fare:

  :cd

Se invece volessi muovermi in una directory da dove sono, anche quì:

  :cd /directory/subdirectory 



