  # Tehnologii utilizate:
- **RDBMS:** Oracle Database
- **Limbaj de interogare:** SQL

# Tema Economică:
Tema economică aleasă pentru baza de date este CONTABILITATEA. Aplicația se ocupă de gestionarea contribuțiilor la stat ale angajaților, a contabililor fiecărui angajat și sediul juridic al contabililor respectivi.

Tabelele implicate în proiect sunt următoarele:
- **Tabela ANGAJAT** - Detalii despre angajați.
- **Tabela CONTABILI** - Se ocupă de gestionarea contabililor fiecărui angajat, dar și de structura ierarhică prin intermediul coloanei `id_sef_contabil`.
- **Tabela SEDIU** - Conține sediile tuturor contabililor din tabela CONTABILI, dar și alte sedii neocupate.
- **Tabela CONTRIBUTII** - Se ocupă de structurarea tuturor dărilor angajaților la stat, incluzând: Contribuția de asigurări sociale (CAS), Contribuția de asigurări de sănătate (CASS), și impozitul pe venit datorat (impozit). De asemenea, tabela conține și data la care contribuțiile aferente fiecărui angajat au fost plătite, de persoana în cauză.

