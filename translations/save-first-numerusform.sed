    /message numerus=.yes.>/,/\/message>/ {
      /<translation/ {
        :loop
        /<\/numerusform/! {
          N
          b loop
        }
        h
        s,.*<numerusform>\([^<]*\)</numerusform>.*,        <translatorcomment>numerusform:\1</translatorcomment>,
        p
        x
        s,<translation>.*</numerusform>,<translation>,
      }
    }
