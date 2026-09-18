Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BBE51A14D
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749815; cv=none; b=DphiaPKU15Exu8ANyU23uK2wKJXCpHYYTnml1Q7V+Pjkbx7hlP3K2tS6sWiFJQockljMI4Suz09p6UvJRoH6t33s5zjm0s8vTqsu869GReSQIFA5idNdae1l51dQ+k0HPSKSp2HwgZTUlPrGk2sa3g0d7WVuswiVbZhEj8DV6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749815; c=relaxed/simple;
	bh=8UAuFJnUEqKcm2XD1+YeWZD/invavXXey/59IElm+FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtNFhErM0iqbJoOx2u6oaXUCCLIVRYqb+ZTDHMo69cRTyiYFOMeqA2qJUaWFCnv+J2PSI37p/GZVT+bynh2Pu6NaDFnh+MHqeSIs/q2XIwM7vgBBnbnmJIJZ17nJFZ4TdBPR4Hqe/ooGo1AI3I70ZiLhFaVoVNVWRoFv3DBKgxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EznILnNS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaLBqkUu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EznILnNS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaLBqkUu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOSYe3645817
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXhD2qfyTH3ir9nwCSQhy3VirEjLkSnYOqGNbJa/sSw=; b=EznILnNSgYugzLNG
	BZlZXV4xqBLhARQ5se3RElfuqitGY7T5atk6bYWRNRnFHbfw5lBPkNT4Ew2WstVW
	MX30rNgLrN+xzmFkwXW7vcpbRfH5smgNyRsO/a+OpEKrIpQJxmcjvBvV9E6YlOey
	aSlxdBeV3wbfy0VB97QrQE+nOahy5GKlEyqRmKnxA9hPYd+Dtafb1DBdbBLvBecG
	4Y0jJmx1cpSplNBR1paQP5yaLB5peY49z7WM05YndljAAMqfW/HuX35oHMLHLm8e
	aG5FE/7RFnyhg9myTBm+xQPzT19D9p/OL1refAb4lbynO72nsMpidYpLVJSWX1Kf
	hNXCEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dhk41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc92350888so15531865ad.3
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749811; x=1790354611; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXhD2qfyTH3ir9nwCSQhy3VirEjLkSnYOqGNbJa/sSw=;
        b=OaLBqkUu4y68oM0sp1y0sGR3+Lp6ljmnPMj4k1Fb8hDMMm7HFrize19VPifyqqf9Zx
         Q9/xnJhbGNoR7MolE/Wjju/+0S73B5PslndKoe00b3bWygECd+ElQEjdKSU3Mywa9gmY
         Hatm9PknH8qHCfU+p3e5UOf+mIgl/hUKMCcuI5R4OcHS93EzI0GeWqnoDwU1tguRooks
         XYkFvaqH09WIdPljeGucggMi3AsAaj8Dg56Y1hRWq1CAWBePnp3ktXfoWkLnKeVHmSXd
         6pXPKk4x5UlnjGuv9r77jUqa4Y87eZfCgm1xHt/Vi10z1er1Kc51FLSsurIDTvW0QqGe
         a6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749811; x=1790354611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXhD2qfyTH3ir9nwCSQhy3VirEjLkSnYOqGNbJa/sSw=;
        b=F8cItd/kiwgr0mA/62+7Bsg/g5yU+A3jmRpxCuvvXQEUGNb7iRtYcsvnn/qKKQrqBZ
         uEbF4U3bqHcZX6sIp5nmOhNMd8LO/2J7bPRJHS0Hf6VBrHP9u1pRU7ODjLjOSs2ni9+j
         a40MF2WHzb1Fo4wmOWwvBTb5TS/XskCbjGHyyTRowAMSceU/K3zArxhFelDg4clo1UH9
         9VREEv1t9qQBxMd+3ROgfJZVxD0hL2JZTsanct2Y+3DJbsTy67hkRQxaMWkidORGooQk
         vjiYGpNJM+X3lGmnaqzfUtzkHmskdgWIqdvHopK3xDyeI+0r/x7DoQb3+3cLQxwuvIuH
         tLqg==
X-Forwarded-Encrypted: i=1; AKwUvBxf2awELFRa940vCDUjTfL7CIYg+WktoHbzyfktWExhxbde+PCgHm8n8f5Np6l0jJ11YpE=@lists.linux.dev
X-Gm-Message-State: AFuF++n0nHdM0WF1+gjqUeNjKheWSkb88I2hwZ4Z1bEPNjxIw8xueqds
	CBo864kMIfPJYD5GeXmI3O9M4x9RF8Tq5iBKa9fuvBGzWlw/Uk5o107RoBowcacJTsUhJ2vloVW
	Rq9QVKVQGDCi2DPMbp1kMU/RxAQ3Od+2XZhC0LJSatReJlL1+B6lLKIY=
X-Gm-Gg: AYBFou2DjkkWFcICFEsP1YhHPZcWHjlmSP2m28pEghRet5Ns/PcAy7OXpFUFfqWF1vn
	8gA9GwzRFGsGKlCjnrcAEwm+JbaGGtxD49eYVA+1u/8XisT74DPaKSGr/2FU+cMOMiVTqp+HxeX
	FkrJQdVKgibHFqwQncfSA653Tyb4jYrAFTJynuIIQLS8FmXdHBoZyUNKF5+kzgMxGhE3G/ACzNp
	xkhiGIh5jfd/Kqzc20dPayvdDDPGrk9D+vYcOYN0T6V/zyE7HB0uOrt0MWXvgBPwRcnHB8dYX5p
	SlD1W2jmX89E2jQXO1lvND//eY5bQiDUQgAGKJ4fE7PFaSGgHeCBKo6RB4Wx9sd9pDybl1/onPQ
	PlJ4ogffBS2xdsOq45w==
X-Received: by 2002:a17:902:db0c:b0:2dd:ad73:c93b with SMTP id d9443c01a7336-2ddb1bebbecmr66585215ad.28.1789749811388;
        Fri, 18 Sep 2026 09:43:31 -0700 (PDT)
X-Received: by 2002:a17:902:db0c:b0:2dd:ad73:c93b with SMTP id d9443c01a7336-2ddb1bebbecmr66584925ad.28.1789749810887;
        Fri, 18 Sep 2026 09:43:30 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:29 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:45 +0530
Subject: [PATCH 1/6] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1049;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=jKXqOxLBkEN4smsi8ItCByyRDNS39ib2DMxiFpu43dE=;
 b=ifKFWo3gjLLDagND+qAkNzUjHEUMeJgS99ZjJlS0Qj895XjNUp66tEIjBkKEHgkPZogowouII
 9so46iR7otrCXQBG1eR90KSLJir/jyvrsBtbk9CTL5Ntn4TZISaQfLw
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX+dbtyrSX84bG
 QL/JHTSxlJ2YMcNkR0nUBP67Eqj6jMZ7JArAlRGyzzGfyB3H6KYzgdlDBwtDRsr3lbClVy61wc7
 nM4GgzriI97P7wjJl5SFLbWqyIWmesM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXxCLDz4oSb9eO
 Pa3TvqSV5NsKrSko/v3AbKJ5yd8r5/8b1I3iUQG3Q8rt9sf7hHoCniUoRLfuu3Mwt7sRNXoiCjZ
 o+8t7ENdWrKg4IddH7KHCs9so6NAFn9aqTttl6pzEczBrQeRdlxiCaqy7rAydBs+cASZj5YuGEl
 7Boq1ikOCy6Abzb0V7XJGrUonoijT1lvheIvJjey/UKpENSkYtF8v22a9sekCE4RhNxoNsp/3Mk
 eNggyJhwSbdq/o/F4tMTnBl+T3r+kAjI4wi22/x97TozQukqx/0SZhZR8bXjOvQsUWW7QPefSPX
 DdnGyeFqYTKovGyhXjhWfexfPEWiDgp2FZSaV9Kb8B1Mnp5YxZ+qHuf7oVU08M7iILKpMkVUBKs
 fnjSPBKCXn9EfyDjMvTuKBGyNodfWVppmjWvgX3HzkB4hojJQvCcinGMn8ZRStuxxlfybmTYEsl
 hUqkSD598/3nN9wKG0A==
X-Proofpoint-GUID: Mk6cOxGw82KLfGpK4Y2WLaUwclI8R48R
X-Proofpoint-ORIG-GUID: Mk6cOxGw82KLfGpK4Y2WLaUwclI8R48R
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad6a34 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fs3tcOIB28yc_fyh2y0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

