# Cambiare il tema di grub

Pee cambiare il tema di grub su ubuntu 24.04, entra in questa cartella:

   cd /boot/grub/themes

Se non hai la cartella themes, creala, ricordandoti che devi avere privilegi da amministratore, quindi usare sudo. A questo punto crea dentro la cartella themes, un'altra cartella.

   sudo mkdir Ubuntu

Dentro sta cartella Ubuntu devi unzippare il pacchetto dove hai scaricato il tema. 

Poi devi modificare un file di testo in questa posizione:

   sudo gedit /etc/default/grub

Dentro questo file devi aggiungere questa riga, per dire al grub che tema vuoi che prenda:

   GRUB_THEME=/boot/grub/theme/Ubuntu/theme.txt

Per finire, fai un update del grub in questo modo:

   sudo update-grub

Presta attenzione a quando fai l'update del grub, perchè dovrebbe, tra le voci che ti sputa fuori sul terminale, dirti che ha trovato il tema.
