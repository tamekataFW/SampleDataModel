-- Project Name : noname
-- Date/Time    : 2015/04/22 13:27:07
-- Author       : tonakata
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- 得意先
create table t_cstmr (
  cstmr_cd integer not null
  , cstmr_nm character varying(50) not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_PKC primary key (cstmr_cd)
) ;

-- 得意先別値引
create table t_cstmr_dsct (
  cstmr_dsct_id integer not null
  , cstmr_cd integer not null
  , gds_cd integer not null
  , asd date not null
  , dsct_sttg_div_cd character varying(1) not null
  , cstmr_gp numeric(9)
  , cstmr_dsct_aom numeric(9)
  , cstmr_dsct_rate numeric(3, 1)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_dsct_PKC primary key (cstmr_dsct_id)
) ;

create index i_t_cstmr_dsct_alt1
  on t_cstmr_dsct(cstmr_cd,gds_cd,asd);

-- 商品
create table t_gds (
  gds_cd integer not null
  , gds_nm character varying(50) not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_gds_PKC primary key (gds_cd)
) ;

-- 商品.上代
create table t_gds_lp (
  gds_lp_id integer not null
  , gds_cd integer not null
  , asd date not null
  , lp_sttg_div_cd character varying(1) not null
  , lp_aom numeric(9)
  , gds_pr numeric(4, 1)
  , sttg_lp numeric(9)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_gds_lp_PKC primary key (gds_lp_id)
) ;

create index i_t_gds_lp_alt1
  on t_gds_lp(gds_cd,asd);

-- 商品.下代
create table t_gds_wp (
  gds_wp_id integer not null
  , gds_cd integer not null
  , asd date not null
  , wp_sttg_div_cd character varying(1) not null
  , wp_aom numeric(9)
  , gds_wr numeric(3, 1)
  , sttg_wp numeric(9)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_gds_wp_PKC primary key (gds_wp_id)
) ;

create index i_t_gds_wp_alt1
  on t_gds_wp(gds_cd,asd);

alter table t_cstmr_dsct
  add constraint t_cstmr_dsct_FK1 foreign key (cstmr_cd) references t_cstmr(cstmr_cd);

alter table t_gds_wp
  add constraint t_gds_wp_FK1 foreign key (gds_cd) references t_gds(gds_cd);

alter table t_gds_lp
  add constraint t_gds_lp_FK1 foreign key (gds_cd) references t_gds(gds_cd);

alter table t_cstmr_dsct
  add constraint t_cstmr_dsct_FK2 foreign key (gds_cd) references t_gds(gds_cd);

comment on table t_cstmr is '得意先';
comment on column t_cstmr.cstmr_cd is '得意先コード';
comment on column t_cstmr.cstmr_nm is '得意先名称';
comment on column t_cstmr.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr.pms_i_class is 'pms_i_class';
comment on column t_cstmr.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr.pms_u_class is 'pms_u_class';

comment on table t_cstmr_dsct is '得意先別値引';
comment on column t_cstmr_dsct.cstmr_dsct_id is '得意先別値引ID';
comment on column t_cstmr_dsct.cstmr_cd is '得意先コード';
comment on column t_cstmr_dsct.gds_cd is '商品コード';
comment on column t_cstmr_dsct.asd is '適用開始日';
comment on column t_cstmr_dsct.dsct_sttg_div_cd is '値引設定区分コード';
comment on column t_cstmr_dsct.cstmr_gp is '得意先販売単価';
comment on column t_cstmr_dsct.cstmr_dsct_aom is '得意先値引金額';
comment on column t_cstmr_dsct.cstmr_dsct_rate is '得意先値引率';
comment on column t_cstmr_dsct.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_dsct.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_dsct.pms_i_class is 'pms_i_class';
comment on column t_cstmr_dsct.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_dsct.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_dsct.pms_u_class is 'pms_u_class';

comment on table t_gds is '商品';
comment on column t_gds.gds_cd is '商品コード';
comment on column t_gds.gds_nm is '商品名称';
comment on column t_gds.pms_i_ymd is 'pms_i_ymd';
comment on column t_gds.pms_i_usr is 'pms_i_usr';
comment on column t_gds.pms_i_class is 'pms_i_class';
comment on column t_gds.pms_u_ymd is 'pms_u_ymd';
comment on column t_gds.pms_u_usr is 'pms_u_usr';
comment on column t_gds.pms_u_class is 'pms_u_class';

comment on table t_gds_lp is '商品.上代';
comment on column t_gds_lp.gds_lp_id is '商品上代ID';
comment on column t_gds_lp.gds_cd is '商品コード';
comment on column t_gds_lp.asd is '適用開始日';
comment on column t_gds_lp.lp_sttg_div_cd is '上代設定区分コード';
comment on column t_gds_lp.lp_aom is '上代金額';
comment on column t_gds_lp.gds_pr is '商品利益率';
comment on column t_gds_lp.sttg_lp is '設定上代';
comment on column t_gds_lp.pms_i_ymd is 'pms_i_ymd';
comment on column t_gds_lp.pms_i_usr is 'pms_i_usr';
comment on column t_gds_lp.pms_i_class is 'pms_i_class';
comment on column t_gds_lp.pms_u_ymd is 'pms_u_ymd';
comment on column t_gds_lp.pms_u_usr is 'pms_u_usr';
comment on column t_gds_lp.pms_u_class is 'pms_u_class';

comment on table t_gds_wp is '商品.下代';
comment on column t_gds_wp.gds_wp_id is '商品下代ID';
comment on column t_gds_wp.gds_cd is '商品コード';
comment on column t_gds_wp.asd is '適用開始日';
comment on column t_gds_wp.wp_sttg_div_cd is '下代設定区分コード';
comment on column t_gds_wp.wp_aom is '下代金額';
comment on column t_gds_wp.gds_wr is '商品仕切率';
comment on column t_gds_wp.sttg_wp is '設定下代';
comment on column t_gds_wp.pms_i_ymd is 'pms_i_ymd';
comment on column t_gds_wp.pms_i_usr is 'pms_i_usr';
comment on column t_gds_wp.pms_i_class is 'pms_i_class';
comment on column t_gds_wp.pms_u_ymd is 'pms_u_ymd';
comment on column t_gds_wp.pms_u_usr is 'pms_u_usr';
comment on column t_gds_wp.pms_u_class is 'pms_u_class';

