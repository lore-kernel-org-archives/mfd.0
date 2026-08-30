Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F82459C5
	for <mfd@lists.linux.dev>; Sun, 30 Aug 2026 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061661; cv=none; b=sJC0ShdIrweuZVPRsvEedrHxM4VMm6kqi305eQFR2v8M0uxhvlj4EBeUCvZqHugNReYjGQ1Z+HvqU11SLDiuznav2C8QGtwMzn0Aclhned1+vzgbGf1VZYohHU/zut2Pv1n7qWWHLoA3s9sHvQcn8qaRB9/1Hii/3oFDVyMDIlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061661; c=relaxed/simple;
	bh=RZhefy0Bru+3z6+0XZb/9fKH1WWUBSNbqtpfus9KhRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8amRZPVqUCy48jd2R6P909ctiP8LquFctH8x3R3rCABfGblYpOQABoxqJcPh6/Uka6eLahHkrS7kaTLJs2W0grsF7XrzbvnjMwdfwEh6I88kUMcxX/KGCZ4tbdPupFvQmH41EbTWsF7szzy14Kb0aAiXBl0dg++XAdP986dR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn3cyGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8RJx8sN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn3cyGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8RJx8sN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U3MvAK2995429
	for <mfd@lists.linux.dev>; Sun, 30 Aug 2026 03:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgN
	iG8dIxo8=; b=hn3cyGjFJLwi24X75Y3rmwKbbhGtpQwbGcWaS4tSrnYlFpjD7wS
	Ihgr2fcD0aeH73tfDatMHwenzo8OCNeSv/AL3Rod2v122Sq8IjrVeMdBa5w6pSA0
	HSIBIvkL43F3z3tAMXhJQsNZRTVSplXTmr5IJfPdXgRUNGa6izFftL1+0DqLJX6X
	fImMKbPlkrp+Bbs/iowW8E/0XRhR7Ki/5zK9LmHkO+9bnalwZgUMJ8GMTAFmIa4C
	ukvXFkMzuoILgGaQGJTnFkLcG3FM5A6847ywkK2j+WWSycZvgQV0q8Rj0jvzqfK6
	TQge4biOHz/9DWAyGPAEK/YMWBDV1yHJwqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq823y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sun, 30 Aug 2026 03:47:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so3161361a12.2
        for <mfd@lists.linux.dev>; Sat, 29 Aug 2026 20:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788061659; x=1788666459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=L8RJx8sNPIdPz9ySfbIGepYb1QnF8zsJkWjVwLV5szXOoQt4JWvTlJgpFh2+eFmm5G
         yHgX0+n0i8Diwa1/lAoFnkvn/RcINMHigSzVmyM3u4zsO6gL0NqVXQOnyN/bGVXGJ7we
         lbqGH/+c6Lz+PxNeGFHDJVB/RKSGI2/iiOUgv4enjmgXIXO4bX0ozjF27QByoBYoY55p
         tr6j3p8XVXqgNt2uMm/X0uc3Z0rh682R+q5OPLBIiIbiC3d3r9nVE/+LBdoFvsW9Jiqw
         aNCRDhbDliji+x0Eude3EvvvUA+15poK59Ow0VHpmu4xLL4OrCSyWn7QigdC0juxzII4
         iFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788061659; x=1788666459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=SVMzABbdGXMYG3wZDtOLH6N/4sUj0mDsTko1f3t342swlDTp066/ryXryYovfJuooe
         iWQWJr5LXGNpBtBidRiRMfZarXHVBkkhfCtZg5XsbyiflYulzAksY91buuAwcXZD0pQu
         Lz8bKbky6upOUcVNebY84MyGkd6DHhNSSnP2VmZTO5wfcDAGKIkHKKvFgeKBvVc0tRwX
         XBKiRazqf4pQLns961UzqilBnF2dxnkWIY3+BDe41iPw1TGKTKrhm7gPQYlYg133XjxV
         l9PXh689Q6PZJsIspY3RepI88LMv1fz15Qw/EdShBOfkqSlUBFNthGATku2mBoFohkYB
         iYMg==
X-Forwarded-Encrypted: i=1; AHgh+RpDhKplW+UX3yhn8iCB5bf3wx3xG8q/lwB52yDM7fYaBac5jdkRS+qI2u70b+WZOa7376Y=@lists.linux.dev
X-Gm-Message-State: AFuF++nkCnpdszx4qb1ies8Xp2oms4eWJs/X+JeiFRv3cXny31eSEyt0
	bU4cZ8668w3ynX+q1nD8OSymSgxy6QBrpw+87KAWxAeNJhOcn/aMbg7q5azQ/bzHMH5uOpv27wV
	N56qbr/1DroEIbzJODf+vBqpEchejvUHUKeXhmaqdhuwrfgS24Ok8AQU=
X-Gm-Gg: AR+sD13IaVFf4Lh/Q/k/ESNnvhRiYPZHk6SpjRC/H1bRZ/JvJrL3mvzbr5EU8OrSq89
	HKWxtrlXUh8/dnAwOdew3xU+hpffAagJRFDrxWK0GoJfb3WOH32Df4Vnw7ceaW8hZwNfTJDxiWF
	GQMCMxOwd2DrvjOFEeuM30GFX+cOXWqEyrXIuINJETPUb4/m+J261UMUYhVRnSOkv9B2OQyz5VJ
	t8YuJ1aiebPJ447lFwKXn21/0dWrNpt8kWRRA0gqJ4nznYMdnBjijwz/SPPD19ur7PiINJlWyLS
	VdlGdqnbFV3CSKmFu6/h57KU0LU5tIQvzxjXWUkrzLMRNl2pz8czI0BmrC58FA8uql6TebCxO3q
	/qMPFsBSDcHkUwgVKhEOE1TwGtEmdMUi/suLC0YUT4UXjQPfgLjkytNDXHVwU
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456202637.6.1788061658710;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456170637.6.1788061658310;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm20956768eec.13.2026.08.29.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
Date: Sun, 30 Aug 2026 11:47:19 +0800
Message-ID: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kiQZgRF4PKJ600mQo7LyMXt2AuKvlwLW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfXw0AZNJxKtnhj
 vzO/WVfbvo6YrDXbNeSpoWAYarrSYQQ+t9Rn5hA/cdbwkg0DsbTMUzkROwHhqP0JCwvFgcRfA+/
 +qbN2s2Y9YFsv4t20WADKpJ3w8l7FnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfX2hfXyq3FLbYk
 D2xpzghJaIP9ClNtCgJmrLynNXsZSD/YNC4u6UA6xDfSyyHi5l+Iw3CnlV2iZ//4yb069mYNe4f
 iZKDYN60nuZUPg5Q4n9jKfVovT14IzwTcTTFongJi4/OVD6alFu3D/xW2yffTPIp1isR92vd415
 8w/ak4ddTwYQ0nigyykkTcFgNVUSLmm35hEmEmLgDYpQVbLN8FjzpfdL2C9rivXSPQZ0xwBXOrI
 rdzZjDRWgoT64z8WoFnuNl/d4YdObZIgzdhN+hQfuZkNY7KdLIHGZKJsOIhv8giZv25yaHuIz4Q
 a+Qkl/gGdh0uOPbizb+xlpzuIQFW4pMhbxJuRFSQ8iN39SD2Exx1WXsiylPawpStw0EJxieRM81
 OMk1ONeZupz6CJVOr1K5fFr6c88LzRVMNFieZhFe7YQH96RHBOc+igLgAM1Hg+AajgtYB0zmbCL
 06GOFR5dEzZrHmnNtnw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a93a7db cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GXJ8kvFa_VRzmclzPfYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: kiQZgRF4PKJ600mQo7LyMXt2AuKvlwLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300029

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 5e0ed30a9a46..f6534e9e9912 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,pm8994
           - qcom,pm8998
           - qcom,pma8084
+          - qcom,pmau0102
           - qcom,pmc8180
           - qcom,pmc8180c
           - qcom,pmc8380
-- 
2.43.0

