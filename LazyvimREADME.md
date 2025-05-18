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

## Aprire un terminale

Per aprire un terminale finora ho scoperto 2 modi.

Con il primo modo si apre un terminale in basso, nella zona inferiore dello schermo, terminale classico, come quello che c'era su VSCode. Per aprirlo nella directory corrente, dove stai lavorando, la sintassi è:

   <special>ft

Se invece volessi aprirlo nella directory principale, la solita /home/liukushka/ , la sintassi è:

   <special>fT 

Per chiudere il terminale puoi fare:

   ctrl d 

Oppure puoi spostarti in un'altra finestra in cui stai lavorando e usare la stessa sintassi che hai usato per creare il terminale, insomma, come lo crei lo distruggi. Un altro modo per chiudere il terminale lo spiego tra poco, parlando del secondo modo per creare il terminale; tale modo per chiuderlo, infatti, funziona anche con questo tipo di terminale.

Per creare un terminale come se fosse una finestra, invece, una finestra in cui puoi lavorare come se fosse uno script, puoi fare:

   :term 

Poi per entrare in modalità scrittura usi:

   i 

Per invece uscire dalla modalità terminale, la sintassi è questa:

   ctrl \n 

Quindi tenendo premuto control premi \n . Adesso entriamo in una cosa leggermente spinosa, perchè c'è una differenza per i due metodi, perchè se stai usando il terminale "floating", ovvero quello in basso, dopo aver fatto control \n, puoi fare direttamente :q. Se invece hai aperto il terminale come se fosse una finestra, dopo il control \n, devi usare la sintassi:

   <special> bd 

Questo è per chiudere il buffer, infatti le finestre aperte sono dei Buffer, ma ne parlerò più avanti.

## Buffer

I Buffer sono quelli che tu volgarmente identifichi come finestre, come le finestre di un browser che vedi normalmente.

Per scoprire cosa puoi fare coi buffer, puoi usare la sintassi:

   <special> b 

Una sintassi analoga si può avere anche usando la linea di comando:

   :bd 

Poi puoi vedere che c'è tanta roba che puoi fare, puoi scorrere tra i buffers usando i numeri, puoi mettere i pin sui buffer e tanta altra roba interessante.

Ci sono tante cose che puoi fare, ma queste sono le principali, poi se ti interessa altro, puoi sempre cercare su internet comandi più avanzati. 

## Lazygit su lazyvim

Per aprire lazygit dentro neovim, mi basta fare:

   <special> g 

In questo modo ti si apre un menu con cui puoi fare diverse azioni.


