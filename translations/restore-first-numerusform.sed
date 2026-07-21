    /message numerus=.yes.>/,/\/message>/ {
      /translatorcomment>numerusform:/ {
        s,<.*>numerusform:\(.*\)<.*>,    <numerusform>\1</numerusform>,
        h
        s,.*,        <extracomment>The singular form will not be used!</extracomment>,
      }
    /<translation>/G
  }
