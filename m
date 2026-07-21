Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFA46D2A4
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658673; cv=none; b=DBQAn+vg3uObOyTub9O8JS4M16jQ9QI6t3yFpBXZyxxCgIjPCleh5LQsex/SZuTeoeDQBx+GbsBSnxspuUliW2aWQkp0pob2L5jTUKk8L+7Dw2xZ6kYupr0KbEMrGTLHJ2fZ2MALIqYrnRQPfrBFYPGNouRIOLpLUxeEDzWIJhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658673; c=relaxed/simple;
	bh=ZsiXIxN7mjxCBmh7+NWUbiw/Zk1ew4C2lTBAf0t8BcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdIeR4gQ6z5haaLiYdF+G/u8lXgyakJFnTQsXgj8oEzShagbvMCPzkV06jPYyvyvboDq1if3H6UNuENTf8TyAcB+ZKyX3+zVfgtbU2Xi1AleP7Z4TlfQbGLHvlVS4Deb1OlY3sR/TaI3EqNgs79fAp04ISwipZywcU4uFsN4iYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTmTiWZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbOOmc4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTmTiWZl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbOOmc4B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2TE93439769
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=; b=YTmTiWZlK/HRO09j
	89a3vhb+J4ERVDfwANPfB+aQxmkQKpcWFj6kRChBmiHI08XBWq3ni2r//+YAuHJ8
	fHfqPuJe7jNjRRDJtA6vL/+Sl9nSoZFStcctTL9k6I5Sk92HoWkPdYys6nU9mhEy
	9X1Cyz1fc4dh5r7cFIa4CrRlmYiJ41IGKY2nPGOn6/CTHz6NdAcok96QdgM3tnfi
	H2yS1NNqEkBvx13UZuX0uKoJLkPULWTKuCsNpu2xq2W7EeF8ODej0edlwVX2C/ux
	3y50Wt8l6nHo1EuNvr2eOdi/1aPTVPC/V3dxoQEHIxucrWcP8EieJ2Nzt46CyTTe
	bn8Yjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstf2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso282880245ad.0
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658670; x=1785263470; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=;
        b=hbOOmc4BFiCnUQtPqM1uc13wzctojuBfP+pPDVI4/lLUdYTn4EQr3ur157igUxV8tG
         MmCWReKnX110Um4kXaaUXaWWpsUMnsgJ2A2q7KKnKhBNCmW4Fc2rHvZT+OwNt1UMTb1Z
         WtpBonDu2fcmEhxHuqcKYAdPZ0nk3c59tXYb5C+kEQ2iczSY8DGgp5kUmoH+Q/EXNQXg
         plGNkxolySMZMHgDMjbTtk5SJ9bkt5cdJq+6EkUvQcwwZ4+nhchcFqmSrZ8vOB9PXkKe
         yTazYVjnOGHpkAIuhaf7FNZtP+/eFCi/tC5lgrVhOfIEdmqPWNRFzlBzK/MxozCacTyh
         G/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658670; x=1785263470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+2gq6vsf0h3+g0pfxkEjQa4dSpdbC6AVmSU+tWCJY=;
        b=AWpTRlAAi4E6dqg8xQXQzhe2tn7lt7i2z3w4dSn9+JTgU/INesVnZOm+AEH5TnQmI5
         nhzywBSKLUCxPhKSZWChgtQYsWsZqmeaIzM4mVR+0m0NCWD/sOME2qhzQsQbbP1UybMK
         w51YpjanxLPc8RuYUTTiCMj4Nr7XlqpF07sMXdlpUsY+/S0vmNgV31DX/qzukWEWakVK
         bh3v0RLbSCM8Z4RPcF5BMNoajms7eDkgWnkkZKtbZjSb/c0ZhSV4d16jzH6rNuyZPcIw
         gJy9R6DbwsL+c0wTGVDGGpW7sm4ldB5PREmGZ+v/gpu+xo78q43D9SM0DRfecqlDgtzQ
         kHJA==
X-Forwarded-Encrypted: i=1; AHgh+RrKrDPzyHIsfSse9UDWVbaCXiiY7LdwbkSWWImNC306pA083mOitwoNMY+dZjgGhp5E8B0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbEoJvfRnGYd5EZGM1tKXqw9MKc0oTBW094cGwoLxUQxJ9OkOd
	qe7i7u3ylkyMvw3czLrvsXoCnVWEHy8puYt1gxHNQ/3cD/bKMXwtkZnOoPi/U3ftRllhyIlL2Dx
	9w8iXBNX3yKBC6iBYCmn+/miLtyW4uu0kgVPj+MlUS6eGkUa8aaASYcczzT7FX8Y=
X-Gm-Gg: AR+sD110gcdGHqBCgUnCu8SaNrCbPZW0kIYvVUUMAdDbovVlFaC3Bz3AepMwn4aeAzQ
	MdsEBhkj5E/EckN2rDSfVrRV/ATYYGnYPnO5/+OFgzWrYjYgqx7RUs/N6w/wn5r8J0RiT9dZISA
	ZhzPhzC6CCQxbtVZGMNZYOPDtbGtkb9WuTiVaJJbaELBNRPIixR/G+jM6AL5I7lvPSBpy1ZA+IM
	euWi3hTM3/Cji4zuRZNDMoqdJTaxAEaLB0sdGfE4ESVOcIrNtNkKtshf3mly9wHdgGVMr0zxFlD
	Ytf3+FDtllgOkXt7dIiZwcjXjVt0Olkh2/YfCE91o0s50cwAq9d309u2m4mDCyyyYrqigUabhFo
	hSYZZrS2ZiSseYOynNCaNe5yejy3L0ffwsEw=
X-Received: by 2002:a17:902:fc44:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2cf349d12d2mr217270845ad.35.1784658670548;
        Tue, 21 Jul 2026 11:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2cf349d12d2mr217270375ad.35.1784658669987;
        Tue, 21 Jul 2026 11:31:09 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:31:09 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:15 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-10-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1071;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZsiXIxN7mjxCBmh7+NWUbiw/Zk1ew4C2lTBAf0t8BcE=;
 b=i/SwsAu0fw0RBj27WyxOLBSYkU126RamCKU8adjzYpU57TO4M6xjUiJFN7L29aLLl5gZekBur
 PHM8RZmw001CKh+nwAg7xc/8rthCduiWl6YqLBkRRUmFkQKXkcyBffY
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: eK822n_WJMsBJvyiYL8P7UGDOyjih2Cf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX8ON4M0wD//hV
 DS6XkUDe7GqKXTQYswz5rNfD6Wl8X7IF4cZ89rZOYTY8GLj4M2B2+k0pdU7d+PbCrX1s7Hjg27t
 g9jYATSoW+qAuQYNsTcbTXKQgiRu/i8=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fbaef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: eK822n_WJMsBJvyiYL8P7UGDOyjih2Cf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX9WtU/Oto5769
 NrYUn3tIM/dgwUF9FKS0zYnfDDvO5bCVJGH7+dgoaErg6Pv8Fv78r4CneDF35QTAyxbMSEdFcvc
 HbIV6dtXyIU7Z1LQ6HyNmCz7rCIMLKqrkSzpLmgs+xD1kVg9paMf3lS43HLbIou/zEXrBA+sJEL
 TIuQMXfA3wEAgY2KTGvW7O/gBjVRZ1M47CxeNGAu8X2wY4xYjIGzGBJWPYptiTCT1aAnij+fwnw
 NMaMGqBuwdc84mR1Fq4q4Jv6cQwn2K1SKHvNA/xop2OXBv7FGpDHKlsR6WI8HgeNPhk+ow3Siy0
 hbCzrlDOrDTVFlhs9SCXN9BpY5QuT5fD4HUNPT189ymuPbswiPP0L9/XwRa46gY1oQt3DcwnN9K
 0KsBVvZLA2Hl1sntxNIzQpkda4gkwCip/6KkD4w9B0NiHPSyFODXpyj5SXXCzUYdO/ygthvPhtu
 4Knnz801MHg9DxgNpyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 80f3fdae5705..79b013fa2c11 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,15 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

