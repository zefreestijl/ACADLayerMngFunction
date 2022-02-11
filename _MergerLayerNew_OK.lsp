(defun C:Test0 (/ acad doc color2 n1 color1 method1 colorindex)
  ;;; By 3wood 31/03/2016, Change truecolor layer colors to index colors 
  (setq acad (vlax-get-acad-object)
 doc (vla-get-activedocument acad)
 color2 (vla-GetInterfaceObject acad (strcat "AutoCAD.AcCmColor." (substr (vlax-product-key) 28 2)))
 )
  (vla-startundomark doc)
  (vlax-for n1 (vla-get-layers doc)
    (setq color1 (vla-get-truecolor n1)
   method1 (vla-get-colormethod color1)
   colorindex (vla-get-colorindex color1)
   )
    (if (/= method1 195)
      (progn
 (vla-put-colorindex color2 colorindex)
 (vla-put-truecolor n1 color2)
      )
      )
    )
  (vla-endundomark doc)
  (princ)
  )


(defun c:Test1 (/ T_LayMatrix T_LayConfig)
   (setvar "CMDECHO" 0)
   (setvar "CLAYER" "0")
   (setq T_LayMatrix
      '(
	  (1   . "1_DLNSHO-PLAN-�ṹ��")
	  (2   . "2_DLNSHO-PLAN-ƽ��ǽ��")
	  (3   . "3")
	  (4   . "4_DLNSHO-PLAN-ƽ���Ŵ�")
	  (6   . "6")
	  (7   . "7_DLNSHO-PLAN-ƽ������_SEC-��������_DEFPOINTS_0")
	  (8   . "8_DLNSHO-PLAN-�Ͳ�")
	  (9   . "9_DLNSHO-PLAN-�ṹ�����")
	  (10   . "10_DLNSHO-PLAN-ƽ������")
	  (17   . "_7_Detail_Text")
	  (20   . "_20_Dote")
	  (29   . "29_DLNSHO-ELE-����ָ���")
	  (31   . "31_DLNSHO-PLAN-ʯ��Ļǽ")
	  (32   . "32_DLNSHO-MLP-�滮����")
	  (33   . "33_DLNSHO-ELE-�������-װ������")
	  (44   . "44_DLNSHO-PLAN-�ڵ��ע")
	  (45   . "45_DLNSHO-SEC-���濴��")
	  (46   . "46_DLNSHO-PLAN-Ϳ��")
	  (50   . "50_DLNSHO-SEC-����������")
	  (73   . "73_DLNSHO-MLP-��ͼ���")
	  (130   . "130_DLNSHO-ELE-����2")
	  (134   . "134_DLNSHO-ELE-����3")
	  (138   . "138_DLNSHO-ELE-����4")
	  (140   . "140_DLNSHO-PLAN-¥�ݵ���")
	  (143   . "143_DLNSHO-PLAN-����Ļǽ")
	  (162   . "162_DLNSHO-PLAN-���߻�����")
	  (163   . "163_DLNSHO-PLAN-���ߣ����")
	  (185   . "185_DLNSHO-PLAN-����Ļǽ")
	  (210   . "210_DLNSHO-PLAN-�޸ı�ע")
	  (211   . "211_DLNSHO-PLAN-�ṹ����")
	  (247   . "247_DLNSHO-SEC-���湹��")
	  (248   . "248")
	  (249   . "249")
	  (250   . "250_DLNSHO-SEC-�������_ELE-�������-�Ͳ�")
	  (251   . "251_DLNSHO-ELE-�������-��ɫ����_�Ҿ�")
	  (252   . "252_DLNSHO-ELE-�������-ǳɫ����")
	  (253   . "253")
	  (254   . "254_DLNSHO-ELE-�������-���ײ���")
	  (255   . "255_DLNSHO-ELE-����1")
       )
   )
   (vla-StartUndoMark (vla-get-ActiveDocument (vlax-get-acad-object)))
   (foreach T_Item (GetLayers)
      (if
         (setq T_LayConfig (assoc (car T_Item) T_LayMatrix))
         (progn
            (if
               (not (tblsearch "LAYER" (cdr T_LayConfig)))
               (command "-LAYER" "N" (cdr T_LayConfig) "C" (car T_LayConfig) (cdr T_LayConfig) "")
            )
            (command "-LAYMRG")
            (foreach T_Lay (cadr T_Item)
               (if
                  (/= T_Lay (cdr T_LayConfig))
                  (command "N" T_Lay)
               )
            )
            (command "" "N" (cdr T_LayConfig) "Y")
         )
      )
   )
   (vla-EndUndoMark (vla-get-ActiveDocument (vlax-get-acad-object)))
   (setvar "CMDECHO" 1)

  (setq Lst (list
'("1_DLNSHO-PLAN-�ṹ��" 1)
'("2_DLNSHO-PLAN-ƽ��ǽ��" 2)
'("4_DLNSHO-PLAN-ƽ���Ŵ�" 4)
'("7_DLNSHO-PLAN-ƽ������_SEC-��������_DEFPOINTS_0" 7)
'("8_DLNSHO-PLAN-�Ͳ�" 8)
'("9_DLNSHO-PLAN-�ṹ�����" 9)
'("10_DLNSHO-PLAN-ƽ������" 10)
'("29_DLNSHO-ELE-����ָ���" 29)
'("31_DLNSHO-PLAN-ʯ��Ļǽ" 31)
'("32_DLNSHO-MLP-�滮����" 32)
'("33_DLNSHO-ELE-�������-װ������" 33)
'("44_DLNSHO-PLAN-�ڵ��ע" 44)
'("45_DLNSHO-SEC-���濴��" 45)
'("46_DLNSHO-PLAN-Ϳ��" 46)
'("50_DLNSHO-SEC-����������" 50)
'("73_DLNSHO-MLP-��ͼ���" 73)
'("130_DLNSHO-ELE-����2" 130)
'("134_DLNSHO-ELE-����3" 134)
'("138_DLNSHO-ELE-����4" 138)
'("140_DLNSHO-PLAN-¥�ݵ���" 140)
'("143_DLNSHO-PLAN-����Ļǽ" 143)
'("162_DLNSHO-PLAN-���߻�����" 162)
'("163_DLNSHO-PLAN-���ߣ����" 163)
'("185_DLNSHO-PLAN-����Ļǽ" 185)
'("210_DLNSHO-PLAN-�޸ı�ע" 210)
'("211_DLNSHO-PLAN-�ṹ����" 211)
'("247_DLNSHO-SEC-���湹��" 247)
'("250_DLNSHO-SEC-�������_ELE-�������-�Ͳ�" 250)
'("251_DLNSHO-ELE-�������-��ɫ����_�Ҿ�" 251)
'("252_DLNSHO-ELE-�������-ǳɫ����" 252)
'("254_DLNSHO-ELE-�������-���ײ���" 254)
'("255_DLNSHO-ELE-����1" 255)
'("_143_CW_Glass" 143)
'("_7_Detail_Text" 7)
'("_185_CW_Metal" 185)
'("_29_Elev_Parting" 29)
); end list
); end setq

 (vl-load-com)

 (foreach lay Lst
   (if
     (not
(vl-catch-all-error-p
  (setq curLay(vl-catch-all-apply 'vla-Item
     (list(vla-get-Layers
	     (vla-get-ActiveDocument
		  (vlax-get-acad-object)))(car lay))))))
     (progn
(vla-put-Color curLay(cadr lay))
(setq fLst(list(cons 8(vla-get-Name curLay))))
(if
  (setq laySet(ssget "_X" fLst))
  (progn
    (foreach itm
	     (mapcar 'vlax-ename->vla-object 
                      (vl-remove-if 'listp 
                        (mapcar 'cadr(ssnamex laySet))))
      (vla-put-Color itm acByLayer)
    ); end foreach
  ); end if
); end progn
   ); end progn
 ); end if
); end foreach
   (princ)
   
)

(defun GetLayers (/ GL_Layer GL_Color GL_Name GL_Return)
   (setq GL_Layer (tblnext "Layer" T))
   (while
      GL_Layer
      (if
         (/= (setq GL_Name (cdr (assoc 2 GL_Layer))) "0")
         (if
            (not (assoc (setq GL_Color (cdr (assoc 62 GL_Layer))) GL_Return))
            (setq GL_Return (append GL_Return (list (list GL_Color (list GL_Name)))))
            (setq GL_Return (subst (list GL_Color (append (cadr (assoc GL_Color GL_Return)) (list GL_Name))) (assoc GL_Color GL_Return) GL_Return))
         )
      )
      (setq GL_Layer (tblnext "Layer"))
   )
   GL_Return
)

