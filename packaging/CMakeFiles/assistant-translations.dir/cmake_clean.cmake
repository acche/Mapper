file(REMOVE_RECURSE
  "assistant_bg.qm"
  "assistant_cs.qm"
  "assistant_da.qm"
  "assistant_de.qm"
  "assistant_en.qm"
  "assistant_es.qm"
  "assistant_fr.qm"
  "assistant_hr.qm"
  "assistant_hu.qm"
  "assistant_ja.qm"
  "assistant_ko.qm"
  "assistant_nl.qm"
  "assistant_pl.qm"
  "assistant_pt_BR.qm"
  "assistant_ru.qm"
  "assistant_sv.qm"
  "assistant_tr.qm"
  "assistant_uk.qm"
  "assistant_zh_CN.qm"
  "assistant_zh_TW.qm"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/assistant-translations.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
