# Comandi base BASH
Cercherò di essere chiaro, ma in ogni caso, quasi tutto ciò che dirò può essere ritrovato in [questo video su YouTube](https://www.youtube.com/watch?v=e7BufAVwDiM&t=289s), ciò che manca invece l'ho trovato su internet per gli affri miei.

Un file per essere in Bash deve finire con il .sh

Affinchè sia eseguibile devi eseguire nel terminale:

    chmod +x esempio.sh

È necessario all'inizio degli script Bash specificare con che linguaggio della tua macchina vuoi runnare lo script, in questo caso, bash, quindi devi sempre scrivere all'inizio:

    #! /bin/bash

Per scrivere qualcosa, è molto semplice, puoi fare:

    echo "Ciao"

Per runnare lo script fai:

    ./esempio.sh

## Reindirizzarsi a file diversi
Vogliamo prendere gli output e reindirizzarli nei diversi file.

Se voglio che il mio output del mio script bash vada dentro un file di testo, posso fare.

    #! /bin/bash

    echo "Ciao" > esempio.txt

In questo modo ha creato il file di testo e ci ha incollato dentro l'output. 

Ma posso anche fare in modo di usare il terminale e scrivere direttamente sul file di testo, così:

    #! /bin/bash

    cat > esempio.txt

In questo modo il terminale si "freeza" e tu ci scrivi sopra e tutto ciò che scrivi verrà incollato sul file che hai specificato, che però VERRÀ SOVRASCRITTO, quindi se avevi già un file esempio.txt, lo sovrascriverai. Poi per uscire dalla modalità di scrittura fai control + C-

Se non volessi sovrascrivere ciò che hai nel esempio.txt, ma volessi fare un append, devi fare:

    #! /bin/bash

    cat >> esempio.txt

In questo modo, qualsiasi cosa farai verrà messa affianco a ciò che già c'era nel file di testo.

## Commenti
Parlando di comenti, sono cose senza valore, non viene processato dal terminale, ma sono utili agli altri per comprendere meglio il codice. 

Supponiamo che tu abbia 10 righe da commentare, come fai a commentarle tutte con un solo comando? Così:

    #! /bin/bash

    : '
    Commento
    Commento
    Commento
    Commento
    Commento
    Commento
    Commento
    Commento
    Commento'

    cat > esempio.txt

Supponiamo che tu voglia fare in modo di far vedere anche a chi runna lo script dei commenti printati in modo più semplice. Esiste una cosa chiamata Doc Delimiter, che funziona così:

    #! /bin/bash

    cat << esempioDelimiter
    Commento da mostrare
    Riga aggiuntiva
    Riga aggiuntiva
    esempioDelimiter

In questo modo il commento su tutte e tre le linee viene mostrato a chi runna lo script. La parola di delimiter può essere qualsiasi parola. Attento alla sintassi con <<.

## Conditional statements
Classici if, else e compagnia bella. Vediamo un esempio di uso di if:

    #! /bin/bash

    variabile=10

    if [ $variabile -eq 10 ]

    then 
        echo "the condition is true"
        
    fi

Ci sono diverse cose carine da vedere in questo esempio: inanzitutto i cicli if terminano con un fi. Poi ricordati che per devinire le variabili non puoi mettere gli spazi con l'uguale, altrimenti non funziona. Un'altra cosa è l'uso del -eq, questo è particolare, non si usa il == come su python o matlab.

Proviamo a mettere un'else per la condizione falsa.

    #! /bin/bash

    variabile=1

    if [ $variabile -eq 10 ]

    then 
        echo "the condition is true"
        
    else

        echo "the condition is false"
        
    fi

Infatti runnando ora ti dice che la condizione è falsa.

Adesso parte una mazzata, perchè ci sono un sacco di modi per imporre le condizioni su bash e fare gli if else. Iniziamo vedendo gli operatori matematici, da usare sui numeri:

- not equal --> -ne
- equal --> -eq
- less than --> -lt
- less than or equal --> -le
- greater than --> -gt
- greater or equal --> -ge

Per le stringhe si possono usare anche queste opzioni, che però tieni a mente sono disponibili anche per i numeri, quindi sono anche un po' più intuitive e più versatili:

- equal --> =
- not equal --> !=
- less than --> <
- greater than --> >
- less or equal than --> <=
- greater or equal to --> >=

ATTENZIONE: se mai volessi usare i segni matematici quì sopra per verificare minore o minore e uguale o cose simili, dovrai fare uno script con le doppie parentesi tonde, NON FUNZIONA CON LE DOPPIE PARENTESI QUADRE QUANDO SI PARLA DI NUMERI (le doppie parentesi quadre le vedrai tra poco), ma al contrario funziona con le stringhe di lettere, perchè se ad esempio tu definissi due variabili che sono due parole con le lettere e poi volessi sapere quale viene prima nel dizionario della lingua, potresti fare così:

    str2="banana"
    str1="apple"

    if [[ $str1 < $str2 ]]; 
    
    then
    
    echo "Sempre vero: apple < banana"
    
    fi

Nota bene che nell'esempio quì sopra io ho fatto così apposta per farti vedere che non conta nulla l'ordine con cui definisci le variabili, ma conta il contenuto, le lettere, se la prima lettera è una a e nell'altra variabile è una b, apple nel dizionario della lingua viene prima di banana.

Se ad esempio vuoi un output falso, dovrai fare così:

    #! /bin/bash

    variabile=1

    if (( $variabile >= 10 ))

    then 
        echo "the condition is true"
        
    else

        echo "the condition is false"
        
    fi

C'è una cosa carina: hai la possibilità di usare una sintassi più moderna per aggirare vari cazzi e mazzi che bash potrebbe causarti se ti dimentichi tipo di mettere delle virgolette o caagte simili, usando le doppie parentesi per le condizioni, ecco un esempio:

    a=5
    b=10

    if [[ $a -ne $b ]]
    
    then

        echo "I numeri sono diversi"

    fi

oppure in caso di stringhe:

    str1="ciao"
    str2="hello"

    if [[ $str1 != $str2 ]] 
    
    then

        echo "Le stringhe sono diverse"
    
    fi


In questo modo ottieni una sintassi più moderna e più solida.

Concentriamoci ora sulla condizione elif, che in matlab è elseif. La logica dietro è la stessa, vuoi mettere un ulteriore controllo sulla condizione.

    #! /bin/bash

    variabile=1

    if (( $variabile >= 10 ))
    then 
        echo "the condition is true"	
    elif (($variabile > 10))
    then
        echo "the condition is true"
    else
        echo "the condition is false"
    fi

Fin quì nulla di nuovo, per vedere davvero la potenzialità di tutto ciò, bisonga dargli una variabile per cui una condizione sia vera e l'altra no, ad esempio:

    #! /bin/bash

    variabile=10

    if (( $variabile >= 10 ))
    then 
        echo "the 1st condition is true"	
    elif (($variabile > 10))
    then
        echo "the 2nd condition is true"
    else
        echo "the condition is false"
    fi

E infatti è vera solo la prima condizione.

Vediamo adesso come fare per le condizioni di "and":

    #! /bin/bash

    variabile=20

    if (( $variabile >= 12 )) && (($variabile <= 90))
    then
        echo "Età corretta per usare l'ascensore"
    else
        echo "Non usare l'ascensore"
    fi

In questo modo entrambe le condizioni devono essere simultaneamente corrette per la condizione corretta.

Adesso vedere la sintassi più corretta, ovvero quella più moderna con le doppie parentesi:

    #! /bin/bash

    variabile=20

    if [[ $variabile -ge 12  &&  $variabile -le 90 ]]
    then
        echo "Età corretta per usare l'ascensore"
    fi

È importante far vedere come la stessa condizione si possa ottenere anche usando -a al posto di &&, poichè chiaramente rappresenta la parola "and", ma attenzione che quì si usa la singola parentesi quadra, non le doppie:

    #! /bin/bash

    variabile=20

    if [ "$variabile" -ge 12  -a  "$variabile" -le 90 ]
    then
        echo "Età corretta per usare l'ascensore"
    fi

ATTENZIONE: come hai potuto vedere ho messo le "" ai lati delle parole, infatti quando non puoi usare la doppia parentesi quadra, se vuoi avere più solidità di codice, è richiesto fare così.

Adesso vogliamo, però, vedere l'operatore "or": in questo modo solo una delle due condizioni deve essere corretta per eseguire. Vediamo:

    #! /bin/bash

    variabile=10

    if [ "$variabile" -le 12  -o  "$variabile" -le 90 ]
    then
        echo "Età corretta per usare l'ascensore"
    else
        echo "Non prendere l'ascensore"
    fi

Viene comoda questa sintassi perchè riprende quella della "and" con -a, ma allo stesso modo, se volessi usare le doppie parentesi quadre, per riprendere la prima sintassi della &&, puoi fare così:

    #! /bin/bash

    variabile=10

    if [[ $variabile -le 12  ||  $variabile -le 90 ]]
    then
        echo "Età corretta per usare l'ascensore"
    else
        echo "Non prendere l'ascensore"
    fi

Possiamo analizzare ora il "case statement", che in sostanza sono come degli if multipli. Si usa in accoppiamento ad un altro comando, che è il read, che si usa per fare in modo che l'utilizzatore scriva sul terminale. Sembra complessissimo, ma vediamo in sostanza com'è:

    #!/bin/bash

    echo "Inserisci un numero da 1 a 3:"
    read numero

    case "$numero" in
    1)
        echo "Hai scelto uno"
        ;;
    2)
        echo "Hai scelto due"
        ;;
    3)
        echo "Hai scelto tre"
        ;;
    *)
        echo "Scelta non valida"
        ;;
    esac

L'asterisco viene utilizzato quando non metti una scelta accettata dallo script, che quindi ti comunica che la scelta non è valida. Chiaramente si può fare anche con le parole:

    #!/bin/bash

    echo "Scegli un gusto di gelato che ti piace"
    read Gusto

    case "$Gusto" in
    Vaniglia)
        echo "Hai scelto Vaniglia"
        ;;
    Cioccolato)
        echo "Hai scelto Cioccolato"
        ;;
    Caffè)
        echo "Hai scelto Caffè"
        ;;
    *)
        echo "Non abbiamo quel gusto"
        ;;
    esac

## Cicli
Vediamo ora il ciclo while. Supponiamo di voler aumentare una quantità finchè non raggiunge un certo numero.

    #!/bin/bash

    numero=1

    while [[ $numero -lt 10 ]]

    do
        echo "$numero"
        numero=$(( numero+1 ))
    done

Io ottengo stampato sul terminale questo:

    1
    2
    3
    4
    5
    6
    7
    8
    9

Questo codice ti fa un print del valore che ha assunto il numero e contemporaneamente incrementa il valore del numero fino a farlo uscire dalla condizione del ciclo while, che di conseguenza si ferma automaticamente. Ci sono cose interessanti da vedere quì, come ad esempio la sintassi con la doppia parentesi ed il $ davanti per cambiare il valore della variabile e la dicitura "done" per fermare il ciclo quando esci fuori dalla condizione.

Una cosa interessante che possiamo vedere è la controparte del ciclo while, che si fa con "until". La differenza è che IL CICLO WHILE FUNZIONA FINCHÈ LA CONDIZIONE È VERA, MENTRE IL CICLO UNTIL FUNZIONA FINCHÈ LA CONDIZIONE È FALSA, QUINDI FINO A CHE LA CONDIZIONE NON DIVENTA VERA. Vediamo un esempio:

    #!/bin/bash

    numero=1

    until [[ $numero -gt 10 ]]

    do
        echo "$numero"
        numero=$(( numero+1 ))
    done

Ottenendo sul terminale questo:

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

Ottengo il 10 in più del ciclo while, poichè quando il nuemro è diventato 10, comunque non era greater than 10, quindi lo ha printato ancora sul terminale.

Vediamo adesso il ciclo for. Abbiamo due modi fondamentali per scriverlo.

Suppongo di avere una serie di numeri e di voler aggiungere un'unità ad ognuno. Posso farlo con un ciclo for:

    #!/bin/bash

    for numero in 1 2 3 4 5

    do
        numeroAddizionato=$(( numero+1 ))
        echo $numeroAddizionato
    done

È interessante quì notare le sintassi alternative per far andare i numeri da 1 a 5 più velocemente, perchè se ad esempio avessi 200 numeri, sarebbe un problema. Le sintassi alternative sono:

    for numero in {1..5}

oppure

    for numero in {1..20..5}

in cui la sintassi significa:
   
    for numero in {inizio..fine..incremento}

La seconda sintassi per i cicli for è a mio avviso molto più restrittiva, ma comunque la metto per completezza:

    #!/bin/bash

    for (( i=1; i<=5; i++ ))

    do
        numeroAddizionato=$(( i+1 ))
        echo $numeroAddizionato
    done

In pratica dici da dove inizi, dici la condizione di stop del ciclo e la i++ è per aumentare di un'unità ogni volta.

## Break and continue statements

Si tratta di concetti più raffinati dei precedenti, ideati per interrompere il ciclo in caso una condizione esca dai parametri. Faccio un esempio: supponiamo di avere una serie di numeri e di voler aggiungere una quantità di test a quei numeri e di volerla aggiungere finchè i numeri sono in un range di sicurezza e di voler interrompere il ciclo quando non sono più numeri in sicurezza. Posso fare così

    #!/bin/bash

    for numero in {1..20}

    do
        if [[ $numero -ge 10 ]]
        then
            echo "Valori non sicuri"
            break
        fi
        
        numeroAddizionatoSicuro=$(( numero+1 ))
        echo $numeroAddizionatoSicuro
    done

Ottenendo come output sul terminale:

    2
    3
    4
    5
    6
    7
    8
    9
    10
    Valori non sicuri

In sostanza il ciclo ha raggiunto il punto in cui numero=10 e ha interrotto, non gli ha sommato l'unità per arrivare al numero addizionato.

Si potrebbe vedere l'azione del break come un error di matlab, se si volesse.

Procediamo con il continue statement. È uno statement che serve per creare delle eccezioni nello script, dei casi in cui non devi eseguire tutto ciò che c'è dopo, ma continuare col ciclo come se ignorassi quei casi.

Prendiamo un esempio in cui vuoi stampare dei numeri, ma non vuoi dei valori, come il 10 ed il 12:

    #!/bin/bash

    for numero in {1..20}

    do
        if [[ $numero -eq 10 || $numero -eq 12 ]]
        then
            echo "Non c'è nulla da vedere"
            continue
        fi
        
        echo $numero
        
    done

In questo modo ottengo sul terminale:

    1
    2
    3
    4
    5
    6
    7
    8
    9
    Non c'è nulla da vedere
    11
    Non c'è nulla da vedere
    13
    14
    15
    16
    17
    18
    19
    20

Il continue statement, come vedi, non interrompe il ciclo, ma semplicemente ignora tutto ciò che viene dopo, facendo passare il ciclo direttamente all'iterazione successiva.

## Script input

Vediamo come possiamo dare gli input allo script. Ecco un esempio in cui chiedo in input i tre nomi maschili più comuni in Italia:

    #!/bin/bash

    echo $1 $2 $3

Se lo faccio andare sul terminale, devo farlo andare con questa sintassi:

    liukushka@liukushka:~/Desktop/Vaccate$ ./esempio.sh Luca Mario Giorgio

In questo modo otterrò scritto sul terminale:

    Luca Mario Giorgio

Bisogna fare attenzione perchè se cambiassi la sintassi così:

    #!/bin/bash

    echo $0 $1 $2 $3

Otterrei in output anche il nome dello script:

    ./esempio.sh Luca Mario Giorgio

E se te lo stai chiedendo, il $0 è direttamente associato al primo input che dai, INCLUSO IL NOME DELLO SCRIPT, di conseguenza facendo:

    #!/bin/bash

    echo $0 $1 $2

Scrivendo sul terminale:

    liukushka@liukushka:~/Desktop/Vaccate$ ./esempio.sh Luca Mario Giorgio

Comunque ciò che otterrò in output sarà questo:

    ./esempio.sh Luca Mario

In sostanza ciò che è successo è che ho associato alle variabili $1, $2 e $3 delle parole. C'è una cosa interessante da far notare, perchè potrebbe succedere: bash usa un modo strano di intendere le cose, perchè potrei ad esempio chedere all'utilizzatore tre numeri e poi aggiungere al primo numero un'unità. Il codice SBAGLIATO sarebbe:

    #!/bin/bash

    echo $1 $2 $3

    numero=$1+1

    echo $numero

Poichè l'output sarebbe:

    1 2 3
    1+1

Perchè bash legge le operazioni matematiche tra le variabili che hai definito con questa sintassi:

    #!/bin/bash

    echo $1 $2 $3

    numero=$(( $1+1 ))

    echo $numero

E infatti così l'output è:

    1 2 3
    2

Se invece volessi invece associare ciò che scrive l'utilizzatore ad un array, potrei fare così:

    #!/bin/bash

    argomenti=("$@")

    echo ${argomenti[0]} ${argomenti[1]} ${argomenti[2]}

E runnando con:

    ./esempio.sh 1 2 3

Ottengo:

    1 2 3

Ma cosa accadrebbe se volessi avere in input da parte dell'utilizzatore quanti input lui vuole mettermi e poi printarli tutti a schermo? Guarda quì:

    #!/bin/bash

    argomenti=("$@")

    echo $@

In questo modo posso fare:

    ./esempio.sh 1 2 3 4 5 6 7 8 9

Avendo printati a schermo tutti i numeri che scrivo.

ATTENZIONE: NON FARE COSÌ:

    #!/bin/bash

    argomenti=("$@")

    echo $argomenti

Poichè in questo caso otterrai soltanto il primo elemento che darai in input.

Un'altra cosa interessante è che se volessi sapere la lunghezza dell'array potrei usare la dicitura $# in questo modo:

    #!/bin/bash

    argomenti=("$@")

    echo $@

Poi:

    ./esempio.sh 1 2 3



Ottenendo sul terminale:

    3

