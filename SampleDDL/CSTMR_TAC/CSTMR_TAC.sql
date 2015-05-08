-- Project Name : noname
-- Date/Time    : 2015/05/08 14:55:49
-- Author       : tonakata
-- RDBMS Type   : Oracle Database
-- Application  : A5:SQL Mk-2

-- 取引先
create table t_cstmr (
  cstmr_no character varying(10) not null
  , cstmr_nm character varying(50) not null
  , ho_addr character varying(100)
  , cstmr_org_div_cd character varying(20)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_PKC primary key (cstmr_no)
) ;

-- 取引先_取引条件
create table t_cstmr_tac (
  cstmr_tac_no integer not null
  , cstmr_no character varying(10) not null
  , trd_div_cd character varying(1) not null
  , cls_d integer
  , pytrm integer
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_tac_PKC primary key (cstmr_tac_no)
) ;

create index i_t_cstmr_tac_alt1
  on t_cstmr_tac(cstmr_no);

-- 取引先_取引条件明細
create table t_cstmr_tac_dtl (
  tac_dtl_id integer not null
  , cstmr_tac_no integer not null
  , rcpt_div_cd character varying(1) not null
  , bill_sght integer
  , trdaccnt_id integer
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_tac_dtl_PKC primary key (tac_dtl_id)
) ;

create index i_t_cstmr_tac_dtl_alt1
  on t_cstmr_tac_dtl(cstmr_tac_no);

-- 取引先.取引口座.対照表
create table t_cstmr_trdaccnt (
  cstmr_trdaccnt_id integer not null
  , cstmr_no character varying(10) not null
  , trdaccnt_id integer not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_trdaccnt_PKC primary key (cstmr_trdaccnt_id)
) ;

create index i_t_cstmr_trdaccnt_alt1
  on t_cstmr_trdaccnt(cstmr_no,trdaccnt_id);

-- 取引口座
create table t_trdaccnt (
  trdaccnt_id integer not null
  , bank_nm character varying(50) not null
  , bank_cd character varying(50)
  , bank_br_nm character varying(50)
  , bank_br_cd character varying(10)
  , accnt_typ character varying(10)
  , accnt_no character varying(10)
  , accnt_hldr character varying(50)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_trdaccnt_PKC primary key (trdaccnt_id)
) ;

comment on table t_cstmr is '取引先';
comment on column t_cstmr.cstmr_no is '取引先番号';
comment on column t_cstmr.cstmr_nm is '取引先_名称';
comment on column t_cstmr.ho_addr is '本店所在地';
comment on column t_cstmr.cstmr_org_div_cd is '取引先_組織区分コード';
comment on column t_cstmr.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr.pms_i_class is 'pms_i_class';
comment on column t_cstmr.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr.pms_u_class is 'pms_u_class';

comment on table t_cstmr_tac is '取引先_取引条件';
comment on column t_cstmr_tac.cstmr_tac_no is '取引先_取引条件設定番号';
comment on column t_cstmr_tac.cstmr_no is '取引先番号';
comment on column t_cstmr_tac.trd_div_cd is '取引区分コード';
comment on column t_cstmr_tac.cls_d is '締日';
comment on column t_cstmr_tac.pytrm is '入金サイト';
comment on column t_cstmr_tac.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_tac.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_tac.pms_i_class is 'pms_i_class';
comment on column t_cstmr_tac.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_tac.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_tac.pms_u_class is 'pms_u_class';

comment on table t_cstmr_tac_dtl is '取引先_取引条件明細';
comment on column t_cstmr_tac_dtl.tac_dtl_id is '取引条件明細ID';
comment on column t_cstmr_tac_dtl.cstmr_tac_no is '取引先_取引条件設定番号';
comment on column t_cstmr_tac_dtl.rcpt_div_cd is '入金方法区分コード';
comment on column t_cstmr_tac_dtl.bill_sght is '手形サイト';
comment on column t_cstmr_tac_dtl.trdaccnt_id is '取引口座管理番号';
comment on column t_cstmr_tac_dtl.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_tac_dtl.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_tac_dtl.pms_i_class is 'pms_i_class';
comment on column t_cstmr_tac_dtl.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_tac_dtl.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_tac_dtl.pms_u_class is 'pms_u_class';

comment on table t_cstmr_trdaccnt is '取引先.取引口座.対照表';
comment on column t_cstmr_trdaccnt.cstmr_trdaccnt_id is '取引先_取引口座ID';
comment on column t_cstmr_trdaccnt.cstmr_no is '取引先番号';
comment on column t_cstmr_trdaccnt.trdaccnt_id is '取引口座管理番号';
comment on column t_cstmr_trdaccnt.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_trdaccnt.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_trdaccnt.pms_i_class is 'pms_i_class';
comment on column t_cstmr_trdaccnt.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_trdaccnt.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_trdaccnt.pms_u_class is 'pms_u_class';

comment on table t_trdaccnt is '取引口座';
comment on column t_trdaccnt.trdaccnt_id is '取引口座管理番号';
comment on column t_trdaccnt.bank_nm is '金融機関名';
comment on column t_trdaccnt.bank_cd is '金融機関コード（銀行コード）';
comment on column t_trdaccnt.bank_br_nm is '金融機関支店名';
comment on column t_trdaccnt.bank_br_cd is '金融機関支店コード';
comment on column t_trdaccnt.accnt_typ is '口座種類';
comment on column t_trdaccnt.accnt_no is '口座番号';
comment on column t_trdaccnt.accnt_hldr is '口座名義人';
comment on column t_trdaccnt.pms_i_ymd is 'pms_i_ymd';
comment on column t_trdaccnt.pms_i_usr is 'pms_i_usr';
comment on column t_trdaccnt.pms_i_class is 'pms_i_class';
comment on column t_trdaccnt.pms_u_ymd is 'pms_u_ymd';
comment on column t_trdaccnt.pms_u_usr is 'pms_u_usr';
comment on column t_trdaccnt.pms_u_class is 'pms_u_class';

