---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 調達先
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_splr (
    splr_cd INTEGER NOT NULL,
    splr_nm VARCHAR(100),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_splr_pri PRIMARY KEY (splr_cd)
);

COMMENT ON TABLE t_splr IS '調達先';
COMMENT ON COLUMN t_splr.splr_cd IS '調達先コード';
COMMENT ON COLUMN t_splr.splr_nm IS '調達先名称';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 商品
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_gds (
    gds_cd INTEGER NOT NULL,
    gds_nm VARCHAR(100),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_gds_pri PRIMARY KEY (gds_cd)
);

COMMENT ON TABLE t_gds IS '商品';
COMMENT ON COLUMN t_gds.gds_cd IS '商品コード';
COMMENT ON COLUMN t_gds.gds_nm IS '商品名称';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 品質検査基準
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_qlty_insp_std (
    qlty_insp_std_cd INTEGER NOT NULL,
    qlty_insp_std_nm VARCHAR(100),
    qlty_insp_smry VARCHAR(2000),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_qlty_insp_std_pri PRIMARY KEY (qlty_insp_std_cd)
);

COMMENT ON TABLE t_qlty_insp_std IS '品質検査基準';
COMMENT ON COLUMN t_qlty_insp_std.qlty_insp_std_cd IS '品質検査基準コード';
COMMENT ON COLUMN t_qlty_insp_std.qlty_insp_std_nm IS '品質検査基準名';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 商品.品質検査基準.対照表
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_gds_qlty_insp_std (
    gds_cd INTEGER NOT NULL,
    qlty_insp_std_cd INTEGER NOT NULL,
    gds_insp_trgt_div_cd VARCHAR(1) NOT NULL,
    pass_std_infr_rate DECIMAL(4,1) NOT NULL,
    insp_rate DECIMAL(3,1),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_gds_qlty_insp_std_pri PRIMARY KEY (gds_cd,qlty_insp_std_cd),
    CONSTRAINT con_t_gds_qlty_insp_std_ref1 FOREIGN KEY (gds_cd) REFERENCES t_gds,
    CONSTRAINT con_t_gds_qlty_insp_std_ref2 FOREIGN KEY (qlty_insp_std_cd) REFERENCES t_qlty_insp_std
);

COMMENT ON TABLE t_gds_qlty_insp_std IS '商品.品質検査基準.対照表';
COMMENT ON COLUMN t_gds_qlty_insp_std.gds_cd IS '商品コード';
COMMENT ON COLUMN t_gds_qlty_insp_std.qlty_insp_std_cd IS '品質検査基準コード';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 発注
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_pord (
    pord_no INTEGER NOT NULL,
    pord_no_ns INTEGER,
    pord_no_nc INTEGER,
    splr_cd INTEGER NOT NULL,
    gds_cd INTEGER NOT NULL,
    pord_dt DATE,
    pord_qty DECIMAL(6,0),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_pord_pri PRIMARY KEY (pord_no),
    CONSTRAINT con_t_pord_ref1 FOREIGN KEY (splr_cd) REFERENCES t_splr,
    CONSTRAINT con_t_pord_ref2 FOREIGN KEY (gds_cd) REFERENCES t_gds
);
CREATE INDEX i_t_pord_alt1 ON t_pord (pord_no_ns);
CREATE INDEX i_t_pord_alt2 ON t_pord (pord_no_nc);

COMMENT ON TABLE t_pord IS '発注';
COMMENT ON COLUMN t_pord.pord_no IS '発注番号';
COMMENT ON COLUMN t_pord.pord_no_ns IS '未着手フラグ';
COMMENT ON COLUMN t_pord.pord_no_nc IS '未完了フラグ';
COMMENT ON COLUMN t_pord.splr_cd IS '調達先コード';
COMMENT ON COLUMN t_pord.gds_cd IS '商品コード';
COMMENT ON COLUMN t_pord.pord_dt IS '発注日';
COMMENT ON COLUMN t_pord.pord_qty IS '発注数';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 搬入受入HDR
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_ldg_acpt_hdr (
    ldg_acpt_no INTEGER NOT NULL,
    ldg_acpt_dt DATE,
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_ldg_acpt_hdr_pri PRIMARY KEY (ldg_acpt_no)
);

COMMENT ON TABLE t_ldg_acpt_hdr IS '搬入受入HDR';
COMMENT ON COLUMN t_ldg_acpt_hdr.ldg_acpt_no IS '搬入受入番号';
COMMENT ON COLUMN t_ldg_acpt_hdr.ldg_acpt_dt IS '搬入受入日';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 搬入受入明細
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_ldg_acpt_dtl (
    ldg_acpt_no INTEGER NOT NULL,
    acpt_dtl_no INTEGER NOT NULL,
    acpt_qty INTEGER,
    pord_no INTEGER NOT NULL,
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_ldg_acpt_dtl_pri PRIMARY KEY (ldg_acpt_no,acpt_dtl_no)
);

COMMENT ON TABLE t_ldg_acpt_dtl IS '搬入受入明細';
COMMENT ON COLUMN t_ldg_acpt_dtl.ldg_acpt_no IS '搬入受入番号';
COMMENT ON COLUMN t_ldg_acpt_dtl.acpt_dtl_no IS '受入明細番号';
COMMENT ON COLUMN t_ldg_acpt_dtl.acpt_qty IS '受入数';
COMMENT ON COLUMN t_ldg_acpt_dtl.pord_no IS '発注番号';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 入荷検品ロット
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_rcv_ins_lot (
    rcv_insp_no INTEGER NOT NULL,
    ldg_acpt_no INTEGER NOT NULL,
    acpt_dtl_no INTEGER NOT NULL,
    insp_dt DATE,
    acpt_qty INTEGER,
    acpt_rslt_div_cd VARCHAR(1),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_rcv_ins_lot_pri PRIMARY KEY (rcv_insp_no),
    CONSTRAINT con_t_rcv_ins_lot_ref1 FOREIGN KEY (ldg_acpt_no) REFERENCES t_ldg_acpt_hdr
);

COMMENT ON TABLE t_rcv_ins_lot IS '入荷検品ロット';
COMMENT ON COLUMN t_rcv_ins_lot.rcv_insp_no IS '入荷検品番号';
COMMENT ON COLUMN t_rcv_ins_lot.ldg_acpt_no IS '搬入受入番号';
COMMENT ON COLUMN t_rcv_ins_lot.acpt_dtl_no IS '受入明細番号';
COMMENT ON COLUMN t_rcv_ins_lot.insp_dt IS '検品日';
COMMENT ON COLUMN t_rcv_ins_lot.acpt_qty IS '受入数';
COMMENT ON COLUMN t_rcv_ins_lot.acpt_rslt_div_cd IS '受入合否区分コード';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : 入荷検品検査
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_rcv_insp_insp (
    rcv_insp_no INTEGER NOT NULL,
    rcv_insp_dtl_no INTEGER NOT NULL,
    qlty_insp_infr_qty INTEGER,
    qlty_insp_trgt_qty INTEGER,
    infr_rate DECIMAL(3,1),
    insp_rslt_div_cd VARCHAR(1),
    gds_cd INTEGER NOT NULL,
    qlty_insp_std_cd INTEGER NOT NULL,
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_rcv_insp_insp_pri PRIMARY KEY (rcv_insp_no,rcv_insp_dtl_no),
    CONSTRAINT con_t_rcv_insp_insp_ref1 FOREIGN KEY (rcv_insp_no) REFERENCES t_rcv_ins_lot,
    CONSTRAINT con_t_rcv_insp_insp_ref2 FOREIGN KEY (gds_cd) REFERENCES t_gds,
    CONSTRAINT con_t_rcv_insp_insp_ref3 FOREIGN KEY (qlty_insp_std_cd) REFERENCES t_qlty_insp_std
);

COMMENT ON TABLE t_rcv_insp_insp IS '入荷検品検査';
COMMENT ON COLUMN t_rcv_insp_insp.rcv_insp_no IS '入荷検品番号';
COMMENT ON COLUMN t_rcv_insp_insp.qlty_insp_infr_qty IS '品質検査不良数';
COMMENT ON COLUMN t_rcv_insp_insp.gds_cd IS '商品コード';
COMMENT ON COLUMN t_rcv_insp_insp.qlty_insp_std_cd IS '品質検査基準コード';
