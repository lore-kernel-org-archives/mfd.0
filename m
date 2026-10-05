Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693B48097E
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203156; cv=none; b=f+vyko2QiR/wlU7WnmN8UoJDwBW1utbrXpaQOPTLQUkV2R14YFHKOujiv4nDWKgDUI2h4k37ZqrhHC58Yxs3HHufjH8C/rYhB8w3n08eCzjt9i6qiypyqSGzSex7HBuiisnRfGbh3SUKqXxWpXuGee+ad7411l1dQkwTNDwWvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203156; c=relaxed/simple;
	bh=bWkI07yTaxFWD4atiiVpHEgTv/JWhA8cgER3iu8rSDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDAL0Ws6nFPftS4/cY2lpnyrjuoiDQT8FQoy59knhW3yYJMPAJFqZFJSy6iBsEuViLvj0BnwM8gfpsTrYVecOqhYHWFQf+nMkKI0DO6NEOFNfb/qpBgjjKfoHnoJ2qkHM9DOfpYp+0ZNqUnGDmWwKE89Bu42xbshT4DBM9EtAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfM8xqKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVhAkxr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfM8xqKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVhAkxr5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFaTI472534
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=; b=mfM8xqKb3FejSNJ+
	CgZaO3jOsZv+GauTDRjU5DvW746DbIjGmEheQZ1WWidlaQpN44OxwC0kstI7yh7y
	Zfvu2wNouaWJZCXXew5coFrqbk5CEZRQW3g+MDkZePN1oOB70r13SKOFnFwXGoZh
	fLfOAENqFG4i7u2OE40xiAmHeeSfb2z90WzCz5BlyhSA9FS7gjiU828taY1Ja6CH
	60l30yqmSP4dgCIMpV9KUR+i6AfJ8O0XVFi9cWX0+1fbYNW78pi6CQdlNWDZlfYp
	vWbjkKI/1PbdUe99c3uFq6SLZVy9KxK+b61hoGspxtF2lm4Txo3Mstkoj/yCkAEi
	3ZvATw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvewnds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:54 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-820ce3bb94bso1681321a34.0
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203153; x=1791807953; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=;
        b=gVhAkxr5wwCDUgwpbgdkVRStVRdbyMfmLZ0OMBLG6gwwZO2ytXx4z2K6rrMSY8dhib
         EJ2MNuyvkUocaR7GWwfIOmMsuiucolplzi6iKxglEOHOsQyBgnf8xIyh9VetvogJU10Z
         q/xd+y+9h0hepJ3ks7Ve0YulWvsCHb/FUzH5RHw7ZwOS86c+eJNUwaBMbP41H6y2L0LU
         A8w32EM2YzI+saQmU/qIGjMVv5e/rok24KirOwZMtR4ZibGWE+u4pcA4XBOOzEn7qGrM
         xb89FYezU+Ur0biLzgXqnG+SOwqysCO+eFHFWj4m0gPd1IBjK7evPlIm5Ef2pObhP5LT
         u8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203153; x=1791807953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=;
        b=HRmidq69uRoj+GFnBLkg9mRoEEcA3QmYRROPBpU0D0RGq+cQtEc3mxyRPjJA27yXUj
         vhXbu9Yjbu/X2qpsvo0zmur6APSYgXn2ogyBFLAYywoc8TSPAEDO/g9+h9tMh44OAwRS
         iPr6GsZobYLy7CR1oEpJLu4VgsccNYVol62RJ0hds4S6KFWsH2oLpcNZuk8q8bW5YYTU
         ZE1hT8uGH+qjyqIcSfURmwpT2cxeL9+GDDdFnWvf+De5XvuDI8QPNiIeY6KXKu3bG1FW
         7lipcPy580wXkL2irwmLz3SVNbx/WDrOHPU+PzxyJWstIvBTgf/y1BMvRF20749PuGCo
         i9aw==
X-Forwarded-Encrypted: i=1; AKwUvBzig0sh5ZJbH8vsq/scBEhZytm+DqvJ+xssOtsIiZGij4nUV5pec60q/DSOJUHsAJdOuTk=@lists.linux.dev
X-Gm-Message-State: AFuF++k3hCAxoJrxM7uJ5MRfytYTni1eCsbMV0Qxw8Q04Uta1Vd0X4mt
	Dfy9r3vCZwrhjOwNgeRnopo/W9NQxMNczlXy1GPzMsa5mXwkDD1TlTbNJ3SfbcoeMRJnW2oFtnp
	4JxlWxNhqc8Nn2lQHx1S7wq0fnNIIrREserv+IgqQ8dzVMZEuEnX7X7w=
X-Gm-Gg: AYBFou27PIOgGQyDvppMiqc1xJpk5hxVTMeeLD1PCGITzFxQqDZ9poMzn51qQTrQcnG
	zMTvY2bkKfMlKwXaqDWeXwyxk0lHdmEXEAJdTHeLEVge7+tE0tBQ3PhnmJ05Nph6/wXx3LU9sHT
	NIUV3BUWKEteY9SfhG3MIHXUyZc7THzu17wmKy9oUgz8fWFNnlwDKlMjrcvRu0rPYinlgdgVnVT
	8VGFkCMprKzvtBwuQO7gMOJo9pu4y5OERhgdjDaVVCG3bGUvYZT45ogpqj1AOskFlX/PjpEbXEf
	wi+fVeguuHonqzcYamnl9CUTTjVJqq6rUCjTSeDdP+higQGc/wUUxUke1DJUwBIOE3+OGsJuy4Q
	nq6WueLrEc1aNRavtpinMdJrq7cB5NT4PlA==
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id 46e09a7af769-8227fa8f917mr11197413a34.4.1791203153226;
        Mon, 05 Oct 2026 05:25:53 -0700 (PDT)
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id 46e09a7af769-8227fa8f917mr11197384a34.4.1791203152682;
        Mon, 05 Oct 2026 05:25:52 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:52 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:11 +0530
Subject: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1265;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=bWkI07yTaxFWD4atiiVpHEgTv/JWhA8cgER3iu8rSDw=;
 b=G0lvChTsfBSyXbyJbOlm2/bbEoTUbl+hghwIpt3euwBIZ3GEeqcSEhjB1ymHDU6ozgTHgXnjG
 nbz/VRCEmGvAdwQrewRv27fzccZPQBLiXh1i8Xk2quL0/l0R4IC43CX
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: J_MTPZomksrObvPp8_rM3AuYZlr9sWmf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1Y+mADJfw7bK
 4YuP28SJcxPxVar1WWWjSEIRy04shQdOWNScMw+OO9VQ6oqMRauAvsVwOd1LYs/SJcxNNHdaQlM
 VGd276jzRCJ1EWXvBwNLD9+fdAOdvBU=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac39752 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXzlDETr43OE74
 heT5lAiiyB3Z4EsbZ3hzrnKHEdu8aL033P3iZG1gZrOfROSlyUTPNB9vA0xrFxIw5Y4pnY7WNv3
 v1qeOlwqEPpnxakyD1e+NoR9wKZp4VT+DX7A9KxEf6oEMcY8itHCfvesYGquJFwE5/dYI6rFJqD
 vW0JnEUWgyTNyQpbxZCmBD4oeprRbBxdIghZt8UPT/YO21KGUJqJj1WcJ6pnU4sTgOcXIY7MHuz
 A/m0r7zCZSIUL/RVo9mx7CkBqHzYTGN3ObSy9leLHjVeVwpthgTKLsn0KvM6JOn18WNMvaIPFj3
 9ZCQuIVjttvboHEk4hd30s3A27cGSkVRsilzBHtUaii8JUmshPAAxIiLYibB6re0ep2ipL8xHad
 bR/zpHArh8q02eAyR18+u4nf+V2X2z8VZd1fcuFgVTrKZnsFOB8qIDqY52JLCDv7ioJOz6anowB
 Okl6Y9iyTR8518kb1yw==
X-Proofpoint-GUID: J_MTPZomksrObvPp8_rM3AuYZlr9sWmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

