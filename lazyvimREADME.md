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

In questo modo ti si apre un menu con cui puoi fare diverse azioni. Concentriamoci per adesso su questo:

    <special> gg 

Così hai aperto lazygit nella cartella del file che stai scrivendo. Per muoverti usi le lettere hjkl, ma anche le freccette, come sempre.

Poi dentro lazygit posso usare la c per fare il commit, la p minuscola per il pull e la P maiuscola per il push.

## Preview di Markdown su lazyvim

Per visualizzare il markdown in preview ti apre una pagina di browser in locale e per farlo devi seguire le istruzioni su [questa pagina](https://www.reddit.com/r/neovim/comments/10w4u51/markdown_preview_on_lunarvim_and_lazyvim/). 

Per visualizzarlo devi fare:

    :Markdownpreview

In questo modo ti basta splittare le finestre per avere a lato il markdown in preview e a sx lazyvim, così è comodo, stile vscode.

## Precisazione sulle installazioni

Potrebbe capitare che tu debba installare delle cose aggiuntive, come fd-find oppure fzf, che magari nemmeno ti interessano, però si possono installare ez e inoltre puoi capire cosa manca runnando:

    :healthcheck

## Eliminare un file

Per eliminare il file, navighi dentro all'albero proprio come fai per aggiungerlo e poi premi semplicemente la lettera d.

Nota bene che affinchè funzioni devi essere in modalità NORMAL, non INSERT.

## Copilot su lazyvim

Per utilizzare copilot su lazyvim devi avere una versione di nodejs superiore alla 20. Nel mio caso, al momento dell'installazione di Ubuntu, avevo la 18.x, quindi ho fatto l'upgrade con i seguenti comandi:

    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs

Nel caso te lo stessi chiedendo, ho trovato le informazioni [a questa pagina](https://askubuntu.com/questions/1265813/how-to-update-node-js-to-the-long-term-support-version-on-ubuntu-20-04).

## Muoversi tra i buffer agilmente

Per muoverti tra i buffer in modo agile, puoi usare il tasto shift e poi i tasti h per andare a sinistra e l per andare a destra. In questo modo ti muovi tra i buffer aperti, come se fossero delle schede di un browser.

Ricordati sempre che è necessario essere in modalità NORMAL, altrimenti scrivi e basta.

## Search and replace

Per ricercare la parola che è sotto il cursore devi premere il tasto *. In questo modo potrai, usando N maiuscola (quindi shift+n) per muoverti indietro nelle varie volte in cui hai usato quella parola, oppure semplicemente n per andare avanti.

Ci sono poi diversi modi per rimpiazzare le parole che hai ricercato, ma ho l'impressione che serva un provider per la clipboard, che tu devi ancora installare, quindi questa sezione aspetterà.

## Usare vim per il latex con vimtex

Per usare vimtex c'è il plugin apposta, ma prima è necessario installare una cosa chiamata zathura, che è un visualizzatore di pdf. Per installarlo, puoi usare il seguente comando:

    sudo apt install zathura

Un'altra cosa da installare è latexmk, in questo modo:

    sudo apt install latexmk

Poi ci sono da installare tutti i pacchetti, ovvero:

    sudo apt install texlive-latex-extra

Un'altra cosa da installare è il pacchetto full per latex, che pesa la bellezza di 6 gB, ma pazienza, è necessario, quindi fai:

    sudo apt install texlive-full

Successivamente a questo, scrivo i principali comandi di vimtex, almeno, quelli che ritengo utili.

Accendere e spegnere il compilatore con \ll 

Vedere gli errori con \le

Forzare la visualizzazione del pdf con \lv

## Installare Lutris e Wine su ubuntu (per far girare NFS MW)

Per installare Lutris e Wine su Ubuntu, puoi usare i seguenti comandi. Prima di tutto, aggiungi la repository di lutris a quelle viste da apt:

    sudo add-apt-repository ppa:lutris-team/lutris -y

Fai un update e installa lutris:

    sudo apt update

    sudo apt install lutris -y

Per lanciarlo, fai semplicemente:

    lutris

Poi devo installare wine, ma prima le sue dipendenze, con:

    sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386

Adesso bisogna rendere la cartella accessibile per la scrittura, quindi faccio:

    sudo chown -R liukushka:liukushka /home/liukushka/Desktop/LinuxUser/Games/NFSMW

Dentro le impostazioni di lutris per il gioco, arguments e wine prefi puoi lasciarli vuoti, di default. 

Ora però c'è un altro problema, perchè il gioco si apre, ma mi dice che non riesce a leggere il CD-ROM, ma è ovvio, ho una iso, non un CD-ROM, quindi devo montare la partizione in una cartella e avviare il gioco dal terminale puntando a quella cartella. Faccio questo:

    sudo mount -o loop /home/liukushka/Desktop/LinuxUser/Games/Need\ For\ Speed\ Most\ Wanted\ Black\ Edition.iso /home/liukushka/Games/mounted_iso_NFSMW

Riceverai un messaggio d'errore, ma è tutto normale. Ciò che fai adesso e digitare nel terminale:

    winecfg 

Così puoi inserire le impostazioni su winecfg: devi eliminare il percorso :D che hai nei drivers e mettere il tuo :D, che punta alla cartella dove hai montato la iso, ovvero:

    /home/liukushka/Games/mounted_iso_NFSMW

Fatto ciò, però, devi scaricare un altro speed.exe, che ti permetterà di avviare il gioco senza CD fisico. Almeno questo era ciò che credevo di dover fare, prima di leggere su archive.org che è già presente una patch nell'installazione. Io ho usato [questo sito](https://www.nexusmods.com/needforspeedmostwanted2005/mods/64), che sembra affidabile, ma dato che ho già la patch, non è necessario.

Ciò che faccio ora è eseguire la patch da terminale, così:

    wine /percorso/alla/patch/nfsmwpatch1.3.exe

che nel mio caso è:

    wine /home/liukushka/Desktop/LinuxUser/Games/NFSMW/Patch/nfsmwpatch1.3.exe


