Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36940F723
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717094; cv=none; b=iwo5M3bxViMjF7cCQMUl4tTbasiN1XGWtI++oJySsdAnOjzqpmo9sy2Wc8U1TljchJN5JnP1gRjACrrf4ib0oLpTWuMCSdrNkpQLYEwS4ezjjVJIMlAHmBM7gv/gvpl6XgrwIC0Iq+nNFtHrVAdkltNkncTzbiTpTUgRLXC5ttE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717094; c=relaxed/simple;
	bh=/hhzK5a/lIOKTiOtAp1IjbgyGrXH+zft7tpO5DhdPZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rvbS+vAKPn2hGo0ngmHy873gkZI72z83+ieA8y0qBpxxRTiBCW4kMtnNmgk2SCfOmUdjNDaXLb0o4EgVK0TLYsAPOLdegYEd/35EFQIobc+gp7GMjqFZcz4pG5ONNybK4wXVPMBJxI8PkFQL61HJEU3XolNl6daPjkE3Ajf3J8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvO+2d+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XL/ub9jp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvO+2d+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XL/ub9jp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x1Dc523784
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 10:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TziaN4U3nrUm+NPafU8G8C
	93XGXYt0jtmEq2paxzJuk=; b=JvO+2d+26nKPRuzfFOIPM8lZELhNwYm4AYrExF
	Tc0HQuMEVfCLe7A13vYk9VciariP2hRr10e0ZP70EFY1iArRf7DA5GDjZHy1LWj/
	f4/a+qsTF5COq4cPsVh3dsv8NjNOlsPyhqyA2sxIRRVQdxt0ThV+xbUzLe/RVbTv
	i6k4RY+zUQy1V69h99EMKt4zk0YRIJFjOP6+Ndkn9OSqXSl5IJPzCCBlNFdYqCfr
	kJHFG6mPDYixZgT+qOoZw5paxlUdTqXk1Uj79zfUrfZpG1Sny4YrTL6ckAekJu1T
	aT+SNKNpGBgQhBrleRqmPdv3bFnlCi+Ko09Ct65jEIvKBEvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt104w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 10:44:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccafc5e82cso120800635ad.3
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717091; x=1785321891; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TziaN4U3nrUm+NPafU8G8C93XGXYt0jtmEq2paxzJuk=;
        b=XL/ub9jp6PWmYrLpBAOgmdSL0WCSFH6YrNxfKECnpsIXZzHuuGU3LWv9X2xeqdlHfi
         BWp9Rx8ZAmfe8WdwKX1pr+sHV/k744Np6aSMUWg6KJyxfN78W6Yv2Ezb1OJadpspzGIK
         ME2gXvDMD5oYEpEVTOCJW4TG0Pok1wkv9a6GgN9mey+iabmxFzqweaaVHvbQX75IyfQS
         2zbRwl0R8Be0lJhPSdDrqiOWx5FakW8fKb7hc7RfAmOyuJtWvskK206kGlmz6pkuMSQL
         ybxNmBB/FGhpQgaMOfukP4jwE1fGE2t973syVLBV6JTRilAleXStUkh2F3DIse9OToPl
         bS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717091; x=1785321891;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TziaN4U3nrUm+NPafU8G8C93XGXYt0jtmEq2paxzJuk=;
        b=MmjClK+32yHycshaLoE+dpE6CbHFpJJwfLP+FBpQFJ+wu+xhROw+I3sKmaEe9RaxDj
         64UV2L7jSVTLwlp9LV0JGH36XBkWW+9x0ovGMHa9m/DRgCm0FZE7Tlib1KfOQv85d7H7
         3yvgfEaghv11L4+i7tESZv/oMJY891fYsRectOgDEbnlkVEtmwvJgdwgID1Rc5bVWvRR
         D2PLOLiEJ/S7/72/wuKOuTZnPokJava+j/zK4+pFhJRNi1lODk9e6jjAh343XPgIKAdW
         luTnWGuQImoBKtsv8dZ/OOYd7xIv1FOoCfqtR0pMfXZGt4COeFtD9/z4A61jWHpdI3xz
         tX/g==
X-Forwarded-Encrypted: i=1; AHgh+RqXxIWKQ3AGpHvNi8J7SAEI/SzoLZdj/djm0Rm5bJ6uIRtN1ri5CIdj+YInSutd9zN8u7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy6XJ4IKWiS5m97PKGr5D4ng5+Uy/pJU0eIIiqxNGF30K7kSoN
	JaGZjDlYa250jhLMJ/nr5tEAvvkBUxcxi7tUYJgIK9/+uOKggLqIkBJWyi6Qr6U654fhtRf6/DH
	a9LWHHxfHch5s/cGFS8F50x21KPSqXHGYxYp7XGhGhFX7kMWz0TZXsd4=
X-Gm-Gg: AR+sD11JSySDT8tL2qXfwV06NzN3JCjRjJybQ8ql82XjtY5/hRxgabDcEagXdLsQMJy
	Ao6Fb2wCOwSeSMVD8Iep1EkEeWTHD5j6HdCG305gpeZ6PIU6xnCAj2puxqRaFz5XIRj1FfEgRUv
	aF34/jz2jcbvG6zCYqtjmH4X8TgbjJdfYX+m+MOr+xP+YvO82mRFSV7faAszrMwbCQ1MJMe2V4p
	2JpWzHFBs1si7tJTr1N8ujJB5kr3ed0PDxvgqp0FZdYoN60l5AHVQzpQ8VS+/r5z8sffJ04iB8w
	Ax8gBzov0ZSru5X1gZSFZVU184mMjGdsF7A+rn2fw22dyo+KQ+NLUi+E8dfuba2AL1ILnKOKcfs
	BMR7ylann8fn1SfNGjGFNBVRUBV834svJ
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr240607185ad.24.1784717091476;
        Wed, 22 Jul 2026 03:44:51 -0700 (PDT)
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr240606795ad.24.1784717091000;
        Wed, 22 Jul 2026 03:44:51 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e797asm12382455ad.39.2026.07.22.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:44:50 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal
 monitor support
Date: Wed, 22 Jul 2026 16:14:40 +0530
Message-Id: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABifYGoC/3XNQQ7CIBQE0Ks0rKUBKhRdeQ/jAlpoMVIqtETT9
 O5CXbhQNz+ZZP6bBQTljQrgWCzAq2iCcUMK1a4ATS+GTkHTpgwIIgwxhGEYrYFWdrD1JioPKSd
 CSCoEEwykr9ErbR6beL68c5jlVTVTZnKjN2Fy/rlNRpx7//WIIYJyzw9EUipwrU8uhPI+i1vjr
 C3TAXkkkg9TI/bNkMRoziutcctrfPjBrOv6Ak0BfxAOAQAA
X-Change-ID: 20260601-spmi-mbg-driver-582aab5aa6a6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: MtsIWayQuSjEBtWxaEOGJG5MF2TDK-W2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX0MWd89gcm4xi
 QAUbNjeKhvmDGCf2cMR+TKe9NQ61uGuapzqXYcySgzII22BLN7E73yqTp4lvvLmnEpcdGUZG9+E
 QmlaIFtj6LohrRTOdavAsTiJZuP5p92q2ZfkhH5WU69JamSYYUEnCGSXPycLH412NpWje5etaTG
 u/i+Czvg/00AHkLTVwHu7twsmoVU6yBY6tIwhgdfxr7i1W/1sh0ur6Ptp33GZKp4JT9JL5bQKKg
 L7B1aX9S+HiDcizhUcfBtvDy2x7lnCTROKeK/dHtTQNUxOigIVPAw02M3BABGPfcAds5EZPcXKh
 9j0uDJN8os8SHmpwk95eUCdv7mF+h2wKM+wun//jWOeToeCgHkG6lBYGfYQYYz8bVNT/vTRVee2
 xI/9fDot6dnDoPyeyRpISdelhe+eMfF/zJbg5L1G6valOLtNuPYMcecArwsjTd7QPbaC9sSJ2mH
 4txtLdwXLnaATnmb2dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX/iHwPIS6PuYV
 aPRVjYxCgUA4W+lCduYQOogrj07CkKOyVdF93gKfgFe6eOnNfADQ+5M7mbX4j07ibmuN2U7EIZa
 12ZxF4feummGFRGY4NjNWDYONnAPRIA=
X-Proofpoint-GUID: MtsIWayQuSjEBtWxaEOGJG5MF2TDK-W2
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a609f24 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iUTBZumk_BVKSr9I0GoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220103

This series adds support for Qualcomm MBG thermal monitoring.

Adding support for:
- DT bindings for the MBG thermal monitor peripheral on PM8775
- A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
 
The driver monitors die temperature alarms, handles the MBG interrupt on
upper-threshold violation, reads the fault status, and reports events to the
thermal framework.
 
RFC patch:
https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Changes in v3:
- Fix Kconfig description and update commit message. [Daniel] 
- Link to v2: https://patch.msgid.link/20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com

Changes in v2:
- Fix locking, -ERANGE, enum check, and flag race. [Sashiko AI]
- Rewrap commit text, rename binding file to match compatible. [Krzysztof] 
- Drop redundant comment, return -ERANGE, fix ISR locking. [Konrad]
- Link to v1: https://patch.msgid.link/20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
      thermal: qcom: Add support for Qualcomm MBG thermal monitoring

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       |  72 ++++++
 drivers/thermal/qcom/Kconfig                       |  14 ++
 drivers/thermal/qcom/Makefile                      |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c            | 256 +++++++++++++++++++++
 5 files changed, 347 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260601-spmi-mbg-driver-582aab5aa6a6

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>

