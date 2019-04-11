create view tq84_tab_col_count as
--
--   grant select on dba_tab_columns
--
     select
         'select' || chr(10) || '  count(*) cnt,' || chr(10) || '  ' ||
          listagg(col     , ',  ' || chr(10)) within group (order by column_id) || chr(10) ||
         'from ' || table_name || ';'  stmt,
     owner,
     table_name 
       from (
       select
          'count('          || column_name || ') c' || column_name  || ',' || chr(10) ||
          'count(distinct ' || column_name || ') d' || column_name  as col,
           column_id,
           owner,
           table_name
       from
          dba_tab_columns
       )
--     where
--        owner        = 'RENE' and
--        table_name   = 'STZH_ADRESSE_IMPORT'
       group by
          owner,
          table_name
;
