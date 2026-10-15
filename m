Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962B4EBAE4
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054741; cv=none; b=uo7zJCr0PjqfgVBiY81y+1hCVJMh+mApG3d7y68TvpgNn/eEcw7gWbXAZp68tY+bbIeHV2YWPy/JNjNbXAJY4DyItCVMtcziccXmtLO8PqKyPFMB1KlAaVreyxtoV8Xo4mnF8DINOkQPD2L722Tj6sCZI5q6OdOZuy3R0Dy6xBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054741; c=relaxed/simple;
	bh=0crPU1F57WiNmZgblPHqxJxKN+WWqULT8xXlWGIFR9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg87c70GRKZoKTWz2yXVwpRvaodCqWt6Ir5a3Lacpt7mPZrx0S3e95Qo+nVFtXCnr2/qSBVeO4TbRwHX0RFjL8cuz2pbnMg6AInVfo42QacMwEggfg8tetaXtL6oEKqdE7PxetDzRRc7cHwgbHwpD8yeTMxiJdmYjCRhKih1ETA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgroUWBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EdixHfZ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgroUWBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EdixHfZ1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wfEe1889621
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtIbWYmm7ff7OUPpUFuKzJSSPLR0ROTbUkKbTEOsXzM=; b=kgroUWBL2VhZHY0v
	sEDYouHcrcnsMdtnLfnNjaQVlDt3gZxh9NXNnI4KpT8OxPlmOaNrdQs5cXsBkA6L
	yQTXu1PAKiqxiZciLM/gaGmxNfqgkaT+JN3nQD8KeupF3kn3QSoN/oGEN+2PzbAQ
	edzuIQoufRxw2p5hsoVZKW6TUjuDM8HxgoBho+XlDgOhATftVoMt6wZMSt1bT1se
	d0yeQSRRV4QXmrc1WdcYIXoqBfbfarqBCZS7TBJqZLxN/QpagEyalDnQIlzdQc+4
	YF78zWoH6XPhyWtWmlRQZ3j8Kt8yCahRSCkdWHb6yoG7hOS1vQ4E6HpdL+kFI++0
	1ApP0Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda14xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:58:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b4bf686ceso163560766d6.3
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054738; x=1792659538; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtIbWYmm7ff7OUPpUFuKzJSSPLR0ROTbUkKbTEOsXzM=;
        b=EdixHfZ1TkFOFUKsDwNA2i8/9eo7wJVgEhAPpSI6PXoAaD3fw0KXrpnuPn1UFLZfdo
         rRzkfV9J3dDSDChzDZkGnDT/N8awUucBGPOZKGGgWMC2RICXUDG0bVK460m8zoH+KqXm
         rLJeZ5ajKh4aYuJiwopyaNeB8Q3WH7qjrKF8snUWpR36vaEm3gKQGMolPUhyNVGH40Ng
         6yev0y9e5j9s34fV8prwb0QO3bQBizTmTtU5Zuzp6ehrw5TEq+VezjDxBx6EXQ2KMR2r
         VG7Q+tuPvCLw978d0c3I9ZsTAfjqbxGKnXAbRjUNixFAO9wyZyvFS3QQ6j92PDjLFivM
         dGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054738; x=1792659538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtIbWYmm7ff7OUPpUFuKzJSSPLR0ROTbUkKbTEOsXzM=;
        b=dzeqzfkT/Nzedku3Z5wYw4YELo5GZQC+SFbK7nZsz/5bjVkXR7pDQNEecXtIPlL4t9
         6RfWNMZW3QftWj4JncDx114qhGcZvpp+r50UsgYLfbuXCtETZ3RE58qmlaZ2VRS7ZwKQ
         8a+YIXsmLx3+peibXc5uMeVCyvfwumVTYYTK5PPnHgCMKJUb3OMavMQ2iTKLXRERDxlC
         QJQupoUDQcx2UlM/KPnM/Zgoar2xiCXfQQDWiR3/w7qWRJ9wOoy5XyI6+E12rv0pzDhd
         1hr+qnGMuOwB6qW6w86U+GvsCafzIB1/+NIinFeUxqiulCdXX+oP0LZ1sHoNkZff9q4z
         KIUg==
X-Forwarded-Encrypted: i=1; AKwUvBysYfkYMs7TQU9u8ajx8V0wUDnv6zH/HY7nCcV+bJ8PnJrYeIQiWxyrysjINk2arFNH7mg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLuikG6/5+xAlI+sRpBhgMfSaTtJb/XYTcUHqcbZg7A1fVjU048
	Ig94V2QPdj52MkFolCsAPA6vWddxB6um91Wwwjsm0MlMgPXoPEPHH3Qx1uGcAf2ljyNhJZ0B5Pw
	x5OMQeLsqxbEeFSOdgjkUlSuYsZeIxxT+wHYN+IjfcvpkFA5YvQI/Jo0=
X-Gm-Gg: AYBFou2uvvQDvbqfmmD1Oxn1MIA1nHoGIaliTqrHXtcLKLlX8mhQqyZqgq/RxGlw82A
	tunQDV0RXA6pNN+TZCFTlmchDBtf/eD3fd1UDbQja55T/G71b9NRqAvGARnvKqVkuUXYpfaKrFW
	BhNRc3rdPTzO4apFUucX1NfCDK6LL37IGi0ANGJoNkYh9hor5sthRD4c7ScLwQe8Aq2eGPEeIBW
	HqWBZ1yipHE46mVqPVEDUqfK6yVxM0JyUZRfZtycqcqtNbm3Ht+p1zsnBHFQHd8KwJ/80a0QFKx
	8NRMu0luaUtZoZo8XIP67qOB83ydqJzjXysPzY7DZRhKft6kyvL5gJjhkNCEJ1GO+MWn/isDTFy
	jfCsqZH6cj3O0TCyTJuZrDbOVze1axynA/6xAk4ftUyW8ek4LpY2EKzo3xHwUBuAEHtD7KWUJFb
	G5E6W1Yc3Kk4vs
X-Received: by 2002:a05:620a:4045:b0:93e:b664:db34 with SMTP id af79cd13be357-93ebd27dd53mr3033931785a.57.1792054737658;
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4045:b0:93e:b664:db34 with SMTP id af79cd13be357-93ebd27dd53mr3033928585a.57.1792054737158;
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:40 +0300
Subject: [PATCH 3/9] dt-bindings: regulator: add Qualcomm LCDB regulator
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0crPU1F57WiNmZgblPHqxJxKN+WWqULT8xXlWGIFR9Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXE3MMATOMFhtKps8PFYXmSqrI3N+vo7Dgn8
 esmJM/cIu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxAAKCRCLPIo+Aiko
 1UZ2B/4rcY0My5fgNc6N/WUfHMYJS05A819Quw4iBwTE9Y5h18zsWhSwEIjpjvc6W2mFT1mrdPG
 El5ZIsYQW/gso2uwlR9hGkoGs0eH1iWT/sJJYf3mtJNrPmwoJqeZayL/yHV57dg00a8G9Qj/mQA
 RIMeTDEg05pXFBNINuXk4sdDkcWUIklN7sI2aL1vX3E/IAGHtWOG79UF6kMtcQO2g5A8sysRHHn
 OvRKyBEZp24bCS9LJ+vAFRdjdYNNsm+Taz4WW5WHyyAJRIdSD5nQymAq5GMtzZLW+/OgfIw2WXS
 P4dppgpPDq9PEm/pCj9968nqP+pS0EUzlTTK85CT6UDD/aSV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX8ySNCO3IjVpq
 MFLSX+Zf33EoJ5FvxrbCK0903+mcaa3tlQ6AV6QLP97rebaguhJeOgmmfGjDz+06K5BKUySN1dy
 vJ7pxDe3IAHzavjPnY4Rd+PNPJJuwkc=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad095d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=T9loRX4MMf1nJrAHyI0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kScpZIwYKg5Qd9azFpSw3Vk9VlTOhIUJ
X-Proofpoint-ORIG-GUID: kScpZIwYKg5Qd9azFpSw3Vk9VlTOhIUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX+1kYoXVDJrdt
 EUUZyTivo9GzxNHiSPIZ4VkMiUr3sPe67sBr/GKjppawxHQ1qWsQcpYLbBlCFPj9zQQiYhvVOUU
 mkW8JQaOfDWfjm1BP/TTzr+GdA+MMpTWjzQW0XbVs44gVd/AmeWvI5/y9VMneUCPdn0NO0NGLSY
 +DSL5+fs1U9zVWbHiWkJZMSOFozufJYqLVR34W5Mf+YqwpSS48dkG+geip1eYlafLwun9PvUdXQ
 L7CiCESo5hGXCummpoOVhzofCo3Xtabuopudt2KsW5nLCejTrebqU7BwtqocyDAjr26T88MSFjj
 k5kvOxG2+p5j6/nBA1FpSINI1WEwTxFfSZ9bY3z3v0KNhynI2jE3SgDTBL3t0Q5iZueL2NX65/b
 Dn0VZlbabW6Vs3oEIGaDoBVBXk/bA48w+mYSU6rRGHWwZ+aPnSDrDD6+61SlybZVG1QGifC6DSd
 Pjd991vtzEXvV8bj1UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

Several Qualcomm PMICs have an LCDB block providing the positive and
negative bias rails for LCD panels. It is not supported by Linux, so
boards using it either model the rails as dummy fixed regulators and
depend on the state left by the bootloader.

Describe the LCDB regulator present on the PM8150L. Use it as a fallback
compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
version of LCDB block, so it's not being covered.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,pm8150l-lcdb.yaml      | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml
new file mode 100644
index 000000000000..eb5014f86439
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,pm8150l-lcdb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LCDB (LCD Bias) regulator
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  LCDB is the LCD panel bias supply found on Qualcomm PMICs such as PMI632,
+  PM6150L and PM8150L. It consists of a boost converter feeding an LDO, which
+  provides the positive bias rail, and an inverting charge pump (NCP), which
+  provides the negative one. Both rails are switched together by a single
+  module enable.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,pm8150l-lcdb
+      - items:
+          - enum:
+              - qcom,pm6150l-lcdb
+              - qcom,pmi632-lcdb
+          - const: qcom,pm8150l-lcdb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: short circuit on one of the outputs
+
+  ldo:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: Positive bias rail.
+
+  ncp:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Negative bias rail. The voltage is specified as an absolute value.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lcdb@ec00 {
+            compatible = "qcom,pm8150l-lcdb";
+            reg = <0xec00>;
+            interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+            ldo {
+                regulator-min-microvolt = <4000000>;
+                regulator-max-microvolt = <6000000>;
+            };
+
+            ncp {
+                regulator-min-microvolt = <4000000>;
+                regulator-max-microvolt = <6000000>;
+            };
+        };
+    };
+
+...

-- 
2.47.3

