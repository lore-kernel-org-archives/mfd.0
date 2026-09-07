Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0FE2E03E4
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768845; cv=none; b=UjrSsf5IdPRuQChcoBguaHb6RlFv+XK0AXtiKLhBdoZw315C5o/Y38A6SDgw8OPbR74MrN6mNHDhioMcvHJqr4XslhEArYBidHeZiNeK0aCapnBdUBihFiMwHH0QNXmWhFGbqKTFffP3IFBT6FAyrkj4irqW85FXGhcbDlYOaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768845; c=relaxed/simple;
	bh=Fe4SJDubEcKN/aVqB2Y6QQJBZVxKn0hGP2YKnt+P5cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQsHD1IaNYpiP1IAmwjmIqdYD5mvPH5cAztvgIkBMhtkGXdwyeOaUHj/TEZmAxSX0JdGBvAzdc/tKgVFngtODm/Sk4g0/KJRsZRC1W0OyTSGopDLhXKvCtL0wAgonIG4Ir2OtkBqUi1pmIY9Q89lbh63rlz9Z+CxQ5QUKrPO9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpmkfczR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkmasxbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpmkfczR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkmasxbl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777MUp2838813
	for <mfd@lists.linux.dev>; Mon, 7 Sep 2026 08:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbUhSdJqfU4j3cBjHfJ68H8KQt4qtDpaXXeLuXeVgGM=; b=kpmkfczRzIYDU7cZ
	zDm9dSeahAVejyIz48TzxKZQCamFgZd4JmB0N8mBsOg/3kB0fCZOEwQaCvVLoZZO
	fWBQxw8TpnPTgn+we+aVkHv6sj/OeP8iqSX6ct8fsjjbukSuF35lH6lwS4yxAlIU
	w5+HtRzxJ+81mnR/78vkUFCnyJhXmkU291+s9RuH+Ni2jbeg5QsMqWQnpqZXrQle
	Ny4ErBVvrHcxeZOCoLC7Il1KrDu3veYHUEvy5+/iBaJ6jBEe6OQ5lLCG7C78LOD7
	LKG1tBA5W8+3B7pZc5gMEeGYMX7i5t+uNAhYQM6zvLKS4/EQAUEaCrxLWbz9VZJq
	K1odEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuenw1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 08:14:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso4534404a12.0
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768842; x=1789373642; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbUhSdJqfU4j3cBjHfJ68H8KQt4qtDpaXXeLuXeVgGM=;
        b=gkmasxblMFfsfyak+gPsrXsd5izyH9kMiBGfjczdnmXBlasIS+z1+Dp+nmms3lJZh8
         yU0iZP9/3g8ByL6flVNm56N0GBViWSm3JTaWgEejJ5bbm0bLrrWbzVUT8pLLo/bDm+m+
         0o9WmH7AQhqGG5JvCR+WH6cYv/AHxvrGMiigchT7UqlcMacJJXahocfp8gJ9mGsqKgDT
         sOFH4yXZDQ0boDH/9UhsJWWHxXwS2e9hrQbLGCXYGfYFlAAihxWIcDC83WR09pf5Go9S
         CTFqIi+l5JPqpx3CAShtomeMabyDj3RiifjOIapZnjXrpDRDetioRLAMsRiUqLo5mTvW
         hTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768842; x=1789373642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbUhSdJqfU4j3cBjHfJ68H8KQt4qtDpaXXeLuXeVgGM=;
        b=U51b+13KBzBDBU2HM5VKpwsSyEeLIzrP3C0Kr64Pj0x+Ta/mvPLuVYpK05Qf8RxeGP
         3Oy13mIiDYQB1nb9BFpcHk+3L+YQyd1tDTEW3Bc3XYEVVilNRAIh16SyeYYMMHtLfCBR
         VO4F3Q1yW/lp19Sf0VLT0mghddXflemE1DLccGlHFAm9emnT481PsiTGg1k6+kKuDsgW
         li2y4UtI/CAI/VsG+9Go3xGDyBRbcYyHdr1t+t1ph8gkVsnX2EYOiaFDDYZLeZbYJj8D
         Jij9KyUY6Afolwo7WeDJFvFdQPjxSYF+c3PpGl8KmARlKmhdStbDGzqL6g30SLqlu6kH
         MuMg==
X-Forwarded-Encrypted: i=1; AKwUvBxTnxuSGZxGW5bbU4LlU3MK4XLGeBLjo6YTJlVL1z7HXQdT/L8euvsXHpRdaRmerPqYaF8=@lists.linux.dev
X-Gm-Message-State: AFuF++kJuP2jM3YXyKI3iSU8bycc8j/fCC5sSIw2P6ZXK9oL4UNFJ6PP
	pAuGKtP80xR77qDTciCzXx8lbXyIlfxDVVAnAMVCK3NSzsltWGsSl/slKfitMNF9zGdXtKa564j
	yEP6IDFzYGIOOYjSuFGJrZX3ELKmmU4ctsYqZlzObOryFKxXQL74PV+k=
X-Gm-Gg: AYBFou1aN1bE9l21ouggjBj0WZ6wYDr1C4qvDYVGTtkUH8Um2o4IOathAfyJH2vuzAq
	NVfh+ZUHXMZGHMIh4SyUB+YHhxKe7r5pcb6PXqRemeimXabPA9T8X7goeLEOzHF3J6up4lH1feQ
	YXFEmdhOV2pkeW9hrx+yZWPfsSJ3r/xBsI5T+avERRkZyisJkfx/yp1vqB1nB/GrWmQEWdqkJvp
	mHFl4rgee7UONznwNHGXboduRw11ARk5qd+0EqndIgvKalAVvCXTLDDmoKGjlchcqRmzh7BKRrP
	4IQ6c/SINt8ObUWIATopKaq3H29Aiqq0saF3zVQPpYZSqeiEo/ZDHGwq6PIbDZtgB6v5vrEmIJD
	qnx4MdJuKWYhChorXO2AfyK+1dD/9q3I=
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr31357116a91.32.1788768842022;
        Mon, 07 Sep 2026 01:14:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr31357045a91.32.1788768841617;
        Mon, 07 Sep 2026 01:14:01 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:37 +0530
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1015;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Fe4SJDubEcKN/aVqB2Y6QQJBZVxKn0hGP2YKnt+P5cA=;
 b=C6f6eCb69VSjSIpprg/cZqIZcNdnr08lgFgORs8EYRXbE/vBS71KrdBNMSs+THW2q6wYB+N5M
 bgsuP2N7wV/CWu4hb2fTF03amDOrOJVgLdfyrnXyPOGK+4qlJc59lWy
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXzDnvLK+e8lkz
 lETzpslOJg1+N79Rhg4XxIfac8CIl/oJBnr0t5ZHt1EYFu21A1VW/jwxE7LvaMayiqK6Cm2WTuj
 5uYNL3v9I9i9IAqJM0n0ORs/LKj5PfHF/Qdx7OcLNJNd+OOFBDwd/URyli/tSKRQo2gGaR/GdOC
 6ySCT0mlC1RciENYODYeF3cuJw64/QfqMcumM4sqb9FwXLUK38gqGW0nM059cArC/HaVfCyFBoV
 bvepMhyAlxlT37w/u5bq0QVYONEJtzljjDe+sucH4pME2KHiofIwerkEysOYbEVW6peN8fvm1g+
 TK9HzpUDG7jKPvJms10PlaT5FsCG0HrGV5spKMJWv+g3xbbplBTAjepow27XgDHWQvqx7MqlI5p
 /HwS4LtMC5zgBTH23+bCd8IB3VE6M4LXCyD9CQNF1sRhNraylcbwAYHC7zVbsAOES2VX17Js4q/
 +dsctuU+HgUslEyKtlg==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e724a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WdnH5iIHsr78bD39pAYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 9A1baC--4g3RniTGfpSlUyHisx6Eb3G3
X-Proofpoint-ORIG-GUID: 9A1baC--4g3RniTGfpSlUyHisx6Eb3G3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX2zltlxrClTKo
 Hp8qtyVDGgVGv7F28gETb4Ml0zBGaGoo9koepiDcaCg3pnTW7kvk6F//VPcZa+TaUKEltWVYXpD
 0b9ZoGq3AjVNkerzUVSMf7vklmqUTA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070088

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

