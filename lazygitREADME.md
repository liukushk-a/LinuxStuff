# Installazione

Per l'installazione di lazygit, l'ideale è visitare la [pagina ufficiale dello sviluppatore](https://github.com/jesseduffield/lazygit/tree/master?tab=readme-ov-file#installation), in ogni caso, quì metto comunque i comandi che ho usato io per l'installazione, che sono stati copiati appunto da questo link:

  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/

Poi, per verificare che versione di lazygit hai installato, puoi usare:

  lazygit --version

Per il tutorial, ho guardato [questo video](https://www.youtube.com/watch?v=Ihg37znaiBo).


