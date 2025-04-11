# Comandi base BASH
Cercherò di essere chiaro, ma in ogni caso tutto ciò che dirò può essere ritrovato in [questo video su YouTube](https://www.youtube.com/watch?v=e7BufAVwDiM&t=289s).

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


