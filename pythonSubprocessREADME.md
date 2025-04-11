# Python subprocess
Voglio segnarmi le cose utili per il modulo subprocess di Python.
Il tutorial che ho usato per questo README si trova a [questo link](http://youtube.com/watch?v=2Fp1N6dof0Y)

Come ogni modulo, va importato, scrivendo:

    import subprocess

Posso usare il modulo subprocess per fare tante cose fighe, come ad esempio scrivere cose sul terminale come se lo stessi facendo in bash, quindi posso scrivere:

    subprocess.run('ls')

e in questo modo il risultato è lo stesso che scriverlo sul terminale.

C'è una cosa molto interessante da notare, ovvero che posso anche dare in input stringhe di comandi, ma per farlo devo usare un'aggiunta, ovvero quella della shell, come nell'esempio che segue:

    subprocess.run('ls -l', shell=True)

È interessante parlarne perchè usare quella specifica sulla shell è come se ti desse un potere maggiore sul terminale, ma non è consigliato se devi dare input che non conosci, perchè non sarebbe sicuro, quindi è consigliato usarlo solo se stai dando input noti. Se invece non volessi usare quella specifica di shell, puoi passare più istruzioni assieme, ma usando una lista, in questo modo:

    subprocess.run(['ls', '-l'])

Ma adesso ci domandiamo come faccio per associare ad una variabile l'output del subprocess, invece che avere solo un print sul terminale? Proviamo ad associare una variabile al comando:

    p1 = subprocess.run(['ls', '-l'])
    
    print(p1)

Vedo che l'output è:

    -rw-rw-r-- 1 liukushka liukushka 1484 Mar 29 15:46 FiredrakeREADME.md
    -rw-rw-r-- 1 liukushka liukushka   92 Mar 31 21:35 Provasubprocess.py
    -rw-rw-r-- 1 liukushka liukushka 1349 Mar 31 21:35 pythonSubprocessREADME.md
    -rw-rw-r-- 1 liukushka liukushka 1231 Mar 29 22:00 Xoptfoil2README.md
    CompletedProcess(args=['ls', '-l'], returncode=0)

Quindi non è esattamente perfetto. Posso modificare il print in:

    print(p1.args)

In questo modo ottengo:

    ['ls', '-l']

Oppure così:

    print(p1.returncode)

Ottenendo:

    0

Poichè significa 0 errori. Possiamo anche printare il standout in questo modo:

    p1 = subprocess.run(['ls', '-l'])
    
    print(p1.stdout)

Ma vedo che così non ottengo nulla, allora posso aggiungere una parte:

    p1 = subprocess.run(['ls', '-l'], capture_output=True)
    
    print(p1.stdout)

Però quì ho il problema che mi printa una cagata, perchè mi fa vedere anche i byte della memoria di ciò che mi printa e cose di cui non mi fotte nulla, allora utilizzo il decode in questo modo:

    p1 = subprocess.run(['ls', '-l'], capture_output=True)
    
    print(p1.stdout.decode())

E così finalmente ho un print pulito del comando. Un'altra strategia che posso adottare è di dire al subprocess che voglio solo testo e non roba in codice, posso farlo in questo modo:

    p1 = subprocess.run(['ls', '-l'], capture_output=True, text=True)
    
    print(p1.stdout)

Posso fare un upgrade usando PIPE, che mi aiuta a collegare lo standard output, lo standard input e lo standard error al subprocess. Posso farlo scrivendo

    p1 = subprocess.run(['ls', '-l'], stdout=subprocess.PIPE, text=True)
    
    print(p1.stdout)

Di base è la stessa cosa di usare i capture output, ma così ho anche gli errori reindirizzati sul subprocess.PIPE. Diciamo, però, che vogliamo reindirizzare l'output del subprocess su un file di testo. Per farlo devo aprire un file di testo in modalità writing, aggiorno il mio codice in questo modo:

    with open('output.txt', 'w') as f:

        p1 = subprocess.run(['ls', '-l'], stdout=f, text=True)
    
Ma adesso torniamo un attimo indietro a quando avevamo il capture, per vedere cosa accade quando abbiamo degli errori: a tal proposito, proviamo a dare in input un comando sbagliato, quindi io ora come codice ho solamente:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True)

Non ottengo nulla in output, perchè ho dentro il comando la dicitura del capture. Ma python anche se non te lo dice, ha trovato un errore e per vederlo devo scrivere il codice così:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True)
    
    print(p1.stderr)

Posso aggiungere una riga per verificare di non aver avuto errori:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True)
    
    print(p1.stderr)
    
In questo modo vedo che mi dà l'errore printato sul terminale e mi dice anche qual'è. Se invece io volessi solo sapere se c'è stato un erorre oppure no, posso scrivere:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True)
    print(p1.returncode)

Così vedo che mi dà un numero e non più 0. Se voglio dargli una condizione di avanzamento dello script in caso di non errore, posso mettergli un if per dirgli che se hai avuto errori devi fare cose:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True)
    
    print(p1.returncode)

    if p1.returncode != 0

Oppure se invece la condizione è che se non hai avuto l'errore allora devi fare qualcosa, chiaramente il codice sarà:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True)
    
    print(p1.returncode)

    if p1.returncode == 0

Se volessi fare un'eccezione al suo modo di operare e che ti dica se hai avuto un errore puoi scrivere così:

    p1 = subprocess.run(['ls', '-l', 'dne'], capture_output=True, text=True, check=True)
        
    print(p1.returncode)

Un'altra cosa comune da fare con gli errori è quella di ignorarli reindirizzandoli verso un dev null, che è in sostanza come ingorarli. Il codice viene modificato in:

    p1 = subprocess.run(['ls', '-l', 'dne'], stderr=subprocess.DEVNULL, text=True, check=True)
        
    print(p1.returncode)

Ma ops, vedo che comunque mi dà l'errore. Il motivo è che il check=True bypassa il DEVNULL, perciò se non voglio vedere errori, modifico il codice così:

    p1 = subprocess.run(['ls', '-l', 'dne'], stderr=subprocess.DEVNULL, text=True)
        
    print(p1.returncode)

In questo modo in output mi dice che non ho errori. Ma se invece volessi prendere l'output di un subprocess e usarlo come input per un altro? Provo a fare una prova con i comandi cat e grep di linux:

    p1 = subprocess.run(['cat', 'output.txt'], capture_output=True)

    print(p1.stdout)

Ottengo come output questo:

    b'This\nis\na\ntest\nfile\nwith\n8\nlines'

Quindi per ottenerlo meglio aggiungo la parte True del text al codice:

    p1 = subprocess.run(['cat', 'output.txt'], capture_output=True, text=True)

    print(p1.stdout)

Ma adesso integro il grep, dicendo con -n che voglio il numero della riga a cui trovo la parola e poi la parola che sto cercando. Chiaramente definirò una nuova variabile che otterrò col comando subprocess:

    p1 = subprocess.run(['cat', 'output.txt'], capture_output=True, text=True)

    p2 = subprocess.run(['grep', '-n', 'test'], capture_output=True, text=True, input=p1.stdout)

    print(p2.stdout)

In questo modo gli ho detto che il grep lo devo fare sul file che mi ha trovato il primo comando. Però la cosa bella è che ci siamo dimenticati dello shell=True e di quanto sia potente, talmente potente che posso contrarre tantissimo ciò che ho appena scritto, in questo modo:

    p1 = subprocess.run('cat output.txt | grep -n test', capture_output=True, text=True, shell=True)

    print(p1.stdout)
