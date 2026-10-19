Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300F4E780D
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409168; cv=none; b=HTNyA3NOwZYljl3knKOIw4BiJk6wrSMV32itPWcsRHh32T7Db7BsjscWecvEjEN1jvfglsAISnkBKUaVQi56i6tRAm8MtCWS6kyFX6sDaMZHDEoFx3+RtVbINnmrjZOTprqiXjInpSaToG9ZsZ2qrVoVNnkg35oBVWTCxfX24lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409168; c=relaxed/simple;
	bh=5j1+5gWDZPo/v74nUWVlDehbVbzgsxlj7niMYz5yZPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEA3V6moyI9VzSPTXuIzg+3/QS/6PREFU/gRCIWsipWEkYR4fvAr/wFLeZqDbvByhfcMQ2YHnDRLTYr8Odk7OfrIwLE0UgsTRsZWvNPRA1jsebK9prr02Zh4iUf3w9je0/OkxbPwCJDr72aIgsyJa0L9jL0h+/3Lq4gdtBEMyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feU0h8Ze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQ+1PYki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feU0h8Ze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQ+1PYki"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Or1e1665440
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=; b=feU0h8ZeXYHiiH9X
	eoKb3NhJ76nB1ofJYJQssWZIzNApbA3KKqsXVseIty9J0jFcSv9g57EgVjfIJ80V
	FXF1Hd7oBkvES3EuJ97hzcScQqjy/4+Ujm0vN/RTFWqiAXXNKR+sH5svsvsdYuj/
	V0aEoLQNvg7offPJn2HUFrfukei0vorwjdLg6kpHozhUmvN3y3gxbwz0HoGqTTBV
	JxnVsLZ+XOkaUd9dvnSQ0vEPaWCKPC4tO6XzOoojuGgBmpdPpBt8pHpPFzWh9Rzl
	WqZpNTwPjIp0Glf6uX/xdypLAwGlPgb86GMDl+JtvOF8tLZDnro00oY3qJvpu8hi
	l2Utgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0tg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so453644785a.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409156; x=1793013956; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=;
        b=fQ+1PYkixMGxRAJ1eW6O1XQtH6H6yUtVVSk62oMQ+uebWomuIVRCuI83mHzjXQwpqF
         XXy6Hn0DIPLYzzYignygz4OVhhVQVWXAVGsGqFCqOjHdw1RV2TT9gr+bLNwpA/gNY1H3
         P987Q4miYGkmolB0Kxd9LCA/NQITYz1G2sFYdgLHhN2FQuIfwz59eFIPrinyUMfkRtjc
         dAT0QgsNHMGm44desdjRsz9IbckWWeohO85PJd16ZRmmQerkNq55OtOI3O8lSrZ3IWV5
         k/ZgYgLTRBLAW8XQ+5AgcyWm7FPf2Luve704wmNWBMoY+N04ZpT1PclOD2xchQWM7BaQ
         iOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409156; x=1793013956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=;
        b=MsbckHZ7D9FawoPvOZsZzc/ZzFyQKfWdBNevQNinFOS6JYjq59mCyUxm8go1EqWTwT
         JUrnJxAglejlPfhIvo6QBBmJUrnokzTlNVl0pYJlIBPL8wQ/8+vhH4wIovsBiTcPpXNi
         ZPqRJUYtriQfsxTBWGDpcqnLDb7zzbSXaO7CphczxukPIerTuug2jb8bS+/9xzJe9mpU
         44kZQF2JAj4SjTT2XyO/uzzqHVi8Ft5PoUOwNkSxCGdxay1DBFJTUcdnT2ah4fbzxBuU
         quwjf0dU6AD6mH6b1LIUHAP9E+YOJ9Y+pXlPk/G6o2eTbjahCthG9yTH31Zi2jeza9kI
         P/7w==
X-Forwarded-Encrypted: i=1; AKwUvBzAIYAR8bgTDOQH+RAJ9MldNENOtJi+texYd3wwMG8+p/NmpJVpFA+fw72gYxSti756Pm0=@lists.linux.dev
X-Gm-Message-State: AFq9FYJTnVLXF4qN1fTPMyvACyz6ZuP7tyQtzpSLC8rsZqC0IcTXp5mu
	JEBFy8VSv+n70rEBDJJjy/AduQEydnpn9Cqud3AjLsZgOC2c8I4HH2a72Rvv9QLQI8Yun7qrViz
	kecOawkHqCihrS82b7QVwLbCcGGPFe4BW8iTdq644Z1DLaZ8ckREpr7k=
X-Gm-Gg: AYBFou0hEZ25fu3Elj9ky7ZNKhBi28avAn13XNYXGDuicfA7NHmulxryz2a6ZJ7gIi5
	Qf7J6D0nWvsYu686bCvUwpIZhpPDN0j5CrG4Nn5ZPIP06RJ3VgOkk8upfyaB5fKvi8xHf9xii6y
	iPA31OFqkpXYYFSCuiw81v08PITFZ3D/KUz7C8BDh1QsMoCW6NsEQ47rV7tHvzYduVxpNXeMl3H
	nTGrtSaxSqgo4R8VA3foTWwUAYvQWDRZtW4uvTyE4TWdqK8auJYq/G7j8uzfCuAg9s9Q1vnRW6K
	jhen2UocdNO9CBg1GNEMBA/R905WwOfiPcDQ2imJyXE0Z6FE5C/L7NER+D7KWgv4rzU/g4B793z
	fvVKSzsQATJxqqv9cpSos/VQtT3coT9ri9QiIz1fyMGixnWLQD5uWClznNTDs0HgQAZhKLP/K7n
	ssVZFc1nXppf1s
X-Received: by 2002:a05:620a:3181:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f29b65959mr1138658185a.4.1792409155499;
        Mon, 19 Oct 2026 04:25:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f29b65959mr1138653785a.4.1792409154919;
        Mon, 19 Oct 2026 04:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:39 +0300
Subject: [PATCH v2 3/8] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-3-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5j1+5gWDZPo/v74nUWVlDehbVbzgsxlj7niMYz5yZPc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f45YrRHdCDK8bawXDs3JDG84GqSMd55FbwB1
 iURRmnFbeKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OQAKCRCLPIo+Aiko
 1fmSCACAe6SmTmaJZaTQrBt+Dfdyi5ffb1oQGY06s4FGLcr2y3TVD+8a1QPhWLOWpgLyWsvQ1dJ
 jahbLyMnTOxozSmpGz+gew9jTiT4esexYWMS0nC89rt9jGjG1x7x7OCYq7GMERuAU/vAuDCu9Pc
 TuLeJ+iiw1RtveSf+2Ed9fIaDS2lR9Dj7TcZedIQlLMf5mbHvhx3EIQkCLghCmCr5c2wxsjSCLr
 Nsno2PH+h51Q1ID9bhpYT0Bd6I3/XgILhRdD8VV6rNZ6sTFGfpNN3ETS3x1T1ih/1rAW9SNstDF
 UGBPaqAFev1GoAyStjNrsmNmIbfvJHAl5gRMokBuFfe6H8fK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXz/GWE1Gy1Rcj
 SCxA74nWPDaAaf7gu8Luof/TlPZrY7LZH23+0trhcwIH880usjpErFzthSb69edwA8T55TSMced
 ZgbZivNi6RczPPGyryRcUty+Btki7jE=
X-Proofpoint-ORIG-GUID: 5zicfSgN1eYrtEMteCdPn1PplWmyPrmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX1dvc9nFK2Kmg
 wLfiYJTJXDBIeh6y0JiDGSYlfijd8zyHyrSYCnYHr+rIcivJqOuxKTPpFciWBAAzUjerbsCPkdd
 VxG+w+afwvqZNj4mNmbe7QJOcrOBe+cap7IrxaL7ApffmHn2AsY/0CoJGZvJ15pZeC2C+dxWx62
 SEYCT7YVrxDTAmZSKVAGsKUfT45fS8IZ5nVo5VsSQrQf2ZucoZ0NIXMvqhajO+QRYdIKzDcmdyf
 GdYtuHjS/MpANgWU1WR4fsRUVKagYiLhjCXI8p4caJtgJTIMIiqPo6jbaD2D/dMRnxToIKEwMCa
 07s514Fs1kOWkeTU7hg2+VOMi6YnE8atfVaYKwpwKBIzC7wxAYChQ0mPMrdJM2iUOno+F0K/pVD
 mgqxAs/+MWS1+6Ol1YZrLpk9NAdW8myq4HmmkFHE8zBZGNkco0XmzogrgUrRdeS7VnnvHvJnf/0
 4KjtVjbuq6M/NKU5LqQ==
X-Proofpoint-GUID: 5zicfSgN1eYrtEMteCdPn1PplWmyPrmy
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5fe44 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Pve-c2K1UEanVU4iL48A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

Allow the LCDB regulator block as a child of the SPMI PMIC node.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..3ca32d741e68 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -191,6 +191,10 @@ patternProperties:
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
 
+  "^regulator@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,pm8150l-lcdb.yaml#
+
   "^rtc@[0-9a-f]+$":
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#

-- 
2.47.3

