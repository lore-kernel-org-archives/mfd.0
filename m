Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18D4E5339
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409179; cv=none; b=tADojh6tcCQgZC4ljMRwqpp08ZWfScRMe+rzazHdGzTmBwqQ5FCdU3+2yuk10LqDddmMMx4vnp7tZopaOrNF1O2DvOGmRw5H0tKGTqs6u3kjydsMNzfwnhpNYLKUhpe1UXEbjanA5YQquHFMGYVsjwzo/vFfkcA60s15VmDD1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409179; c=relaxed/simple;
	bh=OtPhW13oTkk/vnq0/hqRzt/x1W323smpeKt1P7yBbyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGT6lmwNJuICFlyeC7UhRmtDvLJAYwz6qcdUz8bFR41HLs1dUvnzXdCG/U/R2Yh6uEDlN3wT82PDPvSN6D+NfUl07JthzPmwTrxqu3zmXh0Misbem/PywJ38SHA24iDofqYQ++7jNJseoVMOnJtGiYk+jYk5igpwWzTSp3wm0cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyDi0r4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U94un9Dk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyDi0r4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U94un9Dk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5fL1896526
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+pC6oEHMspVu+VNo8HMZcCwsNZGyw7oBC0aS0Ct3Os=; b=lyDi0r4HMJq2W7KL
	AtWTcVrV3xrBuJMST0C0Vam5Rt3oRjCNOOOVwAkBN+tb1IYyrg011pvsQx2BMLra
	xrltTuSiomk2ARr499rSnO9gdiXbli98XchqYpHhkvs849msrt0DTVMfV2YsjcQx
	kvAkDVhGwlNx1qXrh1yYqKzYpFtKHshKxfMr8stTEy9LLSzjI7TMw3n3FdJEVPEr
	jZCaHJL6NvUvxp4EgSZbXWQLn69t0I/yu0GfaFgCy3cR2Gvky3rw9cHgw2F6syXa
	psa45iPGm9mrOa0OM2xQj1Tq9kGctJ8vLWvMwhZKv/KqdwzHD6q3dgRvYtIZAv31
	ow4t1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9m8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso223774485a.2
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409163; x=1793013963; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+pC6oEHMspVu+VNo8HMZcCwsNZGyw7oBC0aS0Ct3Os=;
        b=U94un9DkAUouWV3gAGi2cLJ4c1B73l/wJGNskqOEUttBxEI4b/pbfdumRjo1UnJkET
         /EU/XcDohwNMIMRS7lFun0rvrSmepcUG+2UT9ALYgBfz+/HQ9qdkGlAjpkbkysWKsPgV
         xaZrcbl0x6FYboZYwluhEerqY2YeRWOStNuxZddwRINxFRpzrcDU1WV6XS5dqr5DGM4x
         5iQAvgcz44YTauiMWBr+9KukOW8EcyZwErF8oz6dpzr7hos88JAfg2j4lBqQOHcunDEf
         DCTrJst1f2EylxIDDiXVboBp+5LHH8apwPJ8qaLX94Pu46148iG7X6QMkgCmevmEnpJc
         W22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409163; x=1793013963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+pC6oEHMspVu+VNo8HMZcCwsNZGyw7oBC0aS0Ct3Os=;
        b=cwDBOtycGDr36jSPy4ycD7fUjNTscqB8Ss3iB9cpWCRSkR1Ij1C//QeRfdgD9SaOXr
         A93A9W1GULG7zrxEqZFoXn+TK/ELc0nlI2IVCMr+QYo6cV0ke/Flfquojlpu6OJBy9Nb
         8piwCriK69JWNG4/v6Pr+Bc09CyuyhI00hv4Jo4tKy/nlSMbts2+jdSDZpvr2cs89xoD
         A5FrUEl6gEpskgqEj+8qvTdo4bIXbX5ghK/hScMvNrm7IlDPHlBEjUYg9hdjdWSXHbWi
         IsW05i1x6Ikp9PDxKm62NDb9BREpiTljRRKsxIHi1YkiIAcYk+c9lXfwz6psNvD9Page
         KiFg==
X-Forwarded-Encrypted: i=1; AKwUvBwhoopJBT2/N/QhvCx2zCXLeZVrTCPQ2ixETsFGedeutLsfX81JUYFu34Uka2U5AaFGPdg=@lists.linux.dev
X-Gm-Message-State: AFq9FYKBNpW+RSXu5fDegVciNRomq0/ovhjaJ8w9HNShhhhlTlc2jIpb
	IVkKzahv+Oy/Ec1pwF0A4Qwk9InGQRWmEsRzQS137ajW/vPYX7FJmolPLJia3ktiaGEle+pnJy1
	FTuX0ew5q2zG2Ox3LOBVBw5iyU8ANLlrdgaEd5GjSZjyWYsmrwXm1THM=
X-Gm-Gg: AYBFou3C+yTF4RSMfOG3RNcoZayySM/ZWrhY8GHbQxSP9lSozUMMkEQFVr4C9Sa+zcs
	Og97Gx5RkdNjIDPutI+VRfqaUIXbWgSNACP8kC/2xRoeprDnODJPA6GR/ds/euaCwc8n4EV8mra
	79Bh8rPxxXKhi2QkTkaM5BUl2XoO1/KA1oBq6jrHtaCZGLZOYYPlr2t6zS0Pd3+maB72hZhdLzS
	1+HX3sAy7AJnId3hoyJ9E2QWeDL3pJaQBqtU5gB1iY0qvsodIPTYTCh875Y0vAb0V08jUYw7ol3
	wHXgjovng28xC0Xx84psw8BUUQj7sPJ/+xX+3xbE+NPwzv3iBUcXE45hsKw1Xi8P7xPPE8Vwq6S
	hOBNqK7v1lAGQYGDhSwCHX+iIDPAEmKUTOauV7DmHWSkz2yZ/ZjWb84VujpG+6XTbgOK/EoH+a5
	72sfduCk79l847
X-Received: by 2002:a05:620a:2613:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93f29cc8bd1mr1257986585a.19.1792409163441;
        Mon, 19 Oct 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2613:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93f29cc8bd1mr1257980985a.19.1792409162750;
        Mon, 19 Oct 2026 04:26:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:26:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:43 +0300
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OtPhW13oTkk/vnq0/hqRzt/x1W323smpeKt1P7yBbyU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bVf9aa1sGyKcnvAnxCO1trIi/MeZqoenHTdJMnsk++T
 DtpXH2/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT6fVj/+8YNNdXP6E67qzX
 8V3T2w1Nbm7lLEyaP7Nz3oRpFk6Hg1ze5z7qnh7TpJmR4qOtXBCy/aJO83FWtzltO8JMJCyPyNx
 uO1p/X6UqoiqBycJzC7vKh69JDTLCir0TBMXOxL9m8mvN3dwbKhiem6Duwp/x44XBnJre+U36Yc
 7Xb5xI5Zr2ar79vnav3WcXlE6WPu2T3nlC267su5FO2B7FDxync22jDx6dnfalludzrtGHFUcK5
 vPwCx6/aGHjxL5625a65jPfOadZnHCeVzeRT0JkT6+qbDdHZW+98oNPE30kZY/dZtJcf5NNWOFB
 aUsGR7WC/ZLPqRUhs1w+K2qb7C1eK+zx6tcttb1/jmQCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXxYbi1Pe+kRne
 bS0VDNNBYB/glegPZ9yJrLV5eri2tvcjTJ58oN+YxJnSqEBeOW1ORWYF7csTP/5dg2EOm6TqMB6
 wlBxnF8O229wbHUnA3SDdsp4VOS5j3B991FUC91wU3miPPP1cKnl3A98gq1lr9IoffIoAuQuT0t
 sv1Z0O+/ZumonJ7YsQF8IXS1tqBIaQgs9a5bGQbwhzmr5Apdvf1PMJPjtGbDyihjZtIIhZeYkLv
 Er6Jmgi89tIEv8eZ0JGu2mpRWqEMGEizQrNP/E5kSQHDFfd1ie3IAwqmyWrjdueacerxitMT5WU
 fqHNu9L2VNFPJ4TDrj90tsug1cO5RVsZluAzbj9sAJE3iUId5I/ETd7UiFwrpK4jKPJyGze7B92
 CQnFzQr9ieuaTL4aDTpv7HZ/HZUni3qhalCpJ/WN7dAm0erEmQfkNKkCfRyP7kRsRl+SOid2xTe
 IMlBJcAHpj2kZ3AO+rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXyzyIUUEa/FKA
 8E3W7CF75GEIAmBn5llX9zhGF6YXeG6DVzSgTpvnreg00A6/7Jg6zBKBZGvQ4cCMCo+LjDG48vK
 vbv3hdzNIALjTop8EFxbkm70xBcLsXA=
X-Proofpoint-GUID: C6Yn-RfSEZ0Q6kHlOnFnK5zEOfJ58l2H
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5fe4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=a8YgrFIUZnlsYaPg6kkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: C6Yn-RfSEZ0Q6kHlOnFnK5zEOfJ58l2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
the wrong address the mux driver fails to probe, the Type-C controller
and the DisplayPort controller keep waiting for it and the display
subsystem never binds.

Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..8f4ea981bb89 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -434,9 +434,9 @@ &i2c4 {
 
 	status = "okay";
 
-	typec-mux@42 {
+	typec-mux@43 {
 		compatible = "fcs,fsa4480";
-		reg = <0x42>;
+		reg = <0x43>;
 
 		interrupts-extended = <&tlmm 152 IRQ_TYPE_LEVEL_LOW>;
 

-- 
2.47.3

