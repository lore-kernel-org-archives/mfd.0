Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877083;
	b=x0bCcz0CNAmPXVNVY3jg8yCM0ciaKwOFUVoCHbdCD50bhW7dcf2h85gLOgbeEhGwQrIL
	 f0+Aa9erhGt6sJoSX4GfxrcukSfJXtSpWon7QI+tQTv/2NztHTb5SR2ZHaP0OFV6vwsf/
	 Oyvv1VYMfUeH0ufuP8A/g4+2GEJDnkBGcku/kCDAvKPmIC+Tn9EyW3fVrcpW1YlFfjvXX
	 SEp7gt+KDIHmhXba9nK2nDEgzKupqePHkYHMLVtp5wW1E3A1LYugUyVExo3ZPHSRBTyFD
	 KfBmpFnqcjMD+2mzMq/ErqvC1VygjJ1U5Btg3BjDE9uJU+TUQ95W/k9lwHuaOh2gofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
	b=q4PbVMw4yCK+jtrriLBuSKvj9AGneGKbEwqZKWpmgWHD6NUO8/pG/hZ+yobu3pjjY2pB
	 K791xH8xgwKmSvkUmndQtDgpQsUjbaeT4G8xOXsNIG6Wo44Q1JhE5Q2T8Hu3MfTEssS7+
	 +OQcNOmCXk2jwtbpwaLCNbPhWevtgSbTiwwhA0CC3JOX/Dz1BLmd72hidpAEuwyTNY/HM
	 RXnBgeOP9F3bpitzNNIiwAblOujHuoF7UkUrVNw+vhBbk8bpeFcZ9IW1119rs0pvs9V1M
	 SW87UoIP9rphSzSF8UBUv/dpJoj9G6jvlT7P68R+kvkXtpgLwDOZt3sQkYC83FXkBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A50yTwIG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsA3q5AX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD89606D802
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD89606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A50yTwIG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsA3q5AX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tTM34084601
	for <mfd@lists.linux.dev>; Thu, 5 Nov 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yTUjoB2quATPPTKdjmhmFs
	I/0k5GGeEG+FF3P7TWbbY=; b=A50yTwIGKM5i1OQiJfTq48HjmfTZocnHk3E3JE
	muf8HCKcL3Bl8d0EtmHUnT7QgOus5/lEUXmGdFSpjxkSmju8BelOyG+vNv5gtmQh
	+cQtgFWY8iIqW10poJdEYx/72PyFiV8modbvvAplkHv45MuG2va0g3gqqNUOzCdj
	7WmK9jub8cw1XPyM7o6gqC6JSTG9pvd8aewK/iJRPT2Rp3rPZqxdJUU4RUBRCMcA
	b2/ChDLdnCvyK8VaAx/osKdrgM6GOFsR0tD8uOC8VghBT6Tb6ZuXFQD9CMefO2tt
	9Jta3wdViwvuFFjLhdEZY3CVBp4BZAbbkUNjUDvfmgbYed/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr9ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so105259085a.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 03:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877081; x=1794481881; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
        b=ZsA3q5AX38gTv5coy82xQBfBbBMfl6iPm0hnVdXwNpoeVdP+WOOVbh4gnJTWSNSvEr
         h65fOK+LkcfW0T++mWrWv9Gq+61LncJugcBw60XnPKac6SuQJJipevJkqA/JVvqsphOm
         6D3uBTXRQMST86ghj2FZyYNk+D9O/iiTxUAIhS1vd2I7VsrXZhOYdjX7wPAmnLDVA/Ii
         HWrRpNLYmkhwA+H/OHshwrdyed91e7X/+/9ep+xSwAnmSz2ccJxKsQ6a+lH0NM2J/EXS
         5E0Zp0lemgbhnhQHMyEhfwYlwuyuWFbhgoEmbD5RUunRh11BYoE08RT3X2hbCrZuKftR
         TyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877081; x=1794481881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
        b=cwN7P5OG4gC0IkpW+yGp6rD/djisJBeLcmK6V95KTatuTO7yTt/bPAUgt3pZgQdkYQ
         RHDixvuPI4xXDj65btycnD6qJQ+4T9H9Lt0VQW+tGl3b7Y0txwIXmoN/tsANp2uvd+H2
         e6rgpE+NiRIuWANeUZOcasyw22QY0qZPLJhiVXkk9DJErOiZwgTmfvPEJxc0KiMsmvTG
         oxYdcedRMS3fyhGt9SFHt2aZ4t0NDv768bVrT/B0xqGwmk0cSVEKoUGMZ1NSCAdPt5Js
         P7F+uNSPOwjTvzl0QqIu/uIohy7sz8iHgs6hDEYMB7dQ6CRorH11UWZoAcxK5Q1Z3IDN
         0c8Q==
X-Gm-Message-State: APuU4Z8X6PPZAQU7KRnoKygqltQaslfukZH+6LzHloWPU7JYX5e1Syzf
	xsG1fJpG2qRZFVVBiYBar+lKL5105HftB590RyaGH3FQnJ0EytvuU64s8ae0i3T3lATzyeLFmBR
	CIwwKZzMExxr/Ne9KDThJmMH73TMzcfMt7kW70HLsXnevNd2Epg0tmaNW/D+jSoxKIQ==
X-Gm-Gg: AYBFou1anlo9eiPl797BlcpZvQhoAk+8UNtedSiR7mmnfpftZcnAWrNmBuMzMc+RLmc
	Vw6FWkGheAuJsq9gRUxcJAUrUSzR7ae5ch2JEKjH+j32yngWG+4Vru/hxTYP5lSwNDlKn01pgH8
	iDqTep7YeHQ0A/EsI/+rtyf5ktOghlg0OkYby2k9apjg46kOJimC1uMjZhq/bo+OYacZdNL2Dfd
	ZYLYMMIeGaPwagT8kN73fSndm1CuUHL/ujn4uDqCyGuWMEBDhZCJIzokWwm6uxJbK5VBl8ZKOxi
	F42JSigtpOF/XABbm44eNNvgmc020mvUIBT5Hmj5Vmm+z/tjA+x9mAkjgiXRghCslWz7MfbnlOS
	mwfE9AXPxEJfu5wzm8Zu0R+yBKN7fGvmTe7yIjumEStcjbf6BY0yVrxLqgoKb0gmOtu9/9xpdjD
	IvoDmpJlD0EfSL3Xcfh4GG1uZ8AI5BIJpq3XGIJZ/s
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr358615885a.0.1793877081031;
        Thu, 05 Nov 2026 03:11:21 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr358611785a.0.1793877080528;
        Thu, 05 Nov 2026 03:11:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] Support the Nord CCI CCU output mux
Date: Thu, 05 Nov 2026 19:10:58 +0800
Message-Id: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENk7GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNT3eTkUl1LS3ML00RTs5TkFAMloMqCotS0zAqwKdFKQW7OSrEQwaL
 UwlKgiSUQmdjaWgDg2c71bwAAAA==
X-Change-ID: 20261105-ccu-99785a56dcd0
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=2583;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=46oTe7kPy7FuqPo9XNr2S/V6jdi+yv6WkUX1TjqwpPM=;
 b=Dol529a6/PFWr/JmX2UCTfZDRm+kygGEkLiJ5I4XGx49aXLdT+Sl4/aG0KJUZRGVrOtpfvGyd
 4gV/RXtflxMBM/DfYF5SIV5V1/JEo4mgZ8kk/3WcZgDOVFHp2oa75LU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX9dDCOUA+PhB7
 QOc2HMdJ6c/hRNAjGjCWR21x+NoPREEDXMpY2qjKufxjLu0z05TWMnkQfOGUCpUyyN8oG08rxIn
 lrpi1ru2MOHtlZ2qHG47O3rfv3ggXsKC538PgQX4LalLhrCS/O4/MzwV919xAiMZsNd6Zii/99E
 h2vBDCQcoxTq4hDbU5DH+8k/s5Ryli4gDjc4wahQSwHojkNUZzxtxDmSEEaD25bWnb794YbD/yo
 RJbu4w0uIGjr+Iyak71fDAyIj+JW5cb5Iibp1xNEuNVANhSFVKW5YbN2B/Yn2Y7xSFBpMf5HSzr
 jDQN2g8wPI1pooivW9Lp7iIIJWSkLuAFUl58GeNtWahMms4rX3cFn1P+nXa0P9FlG53Z44IdIOl
 CBQ03G2bYAl5qx9HRE0F7Uieu51WGSWMzlYVXpXm7ZQsZ7v5bQp3+N42Mi2FF6fMMN3V4YMhhE6
 sgTk1FUqJ/PWhkpQNdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX2CIgnesAS/s/
 o548VAXokVRUM4U3TlZ/ymPtL4pFT/nrchtM/lfxJ/1dIl4frrc5cz2nOJzJTZrctt6yazddCsz
 mjHZIoGp9ZHVZFlHmz+HemqIf7EyJRg=
X-Proofpoint-ORIG-GUID: U6p2PLIs84sMAZpHkuIPthRj4tD3HNpG
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec645a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zavQIZ2TttM9Dy2BN-UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U6p2PLIs84sMAZpHkuIPthRj4tD3HNpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

On Nord, the CCI controllers are wrapped by a CCU. After reset, the
CCI I2C ports are routed to the CCU, and the CCU output mux must select
the CCI before it can be used.

The mux register is part of CAM_TOP, a register block shared by
multiple camera components and outside the CCI and CAMSS register
ranges. Accessing the block requires the camera subsystem top power
domain and AHB clock, and its state is lost when the power domain is
turned off.

This RFC describes CAM_TOP as a syscon and lets each CCI reference its
mux configuration through a phandle, register offset and mask. The CCI
driver selects the CCI at probe and runtime resume, right after enabling
the CCI clocks and before the CCI is reset or configured.

	titan_cam_top: syscon@<addr> {
		compatible = "qcom,nord-titan-cam-top", "syscon";
		reg = <...>;
	};

	cci2: cci@<addr> {
		compatible = "qcom,nord-cci", "qcom,msm8996-cci";
		...
		qcom,ccu-mux-sel = <&titan_cam_top OFFSET MASK>;
	};

The CAM_TOP syscon does not describe its clock or power domain. A clock
attached to a syscon is kept prepared for the lifetime of the regmap,
which would keep the camera clock controller runtime active even when
the camera is idle. Instead, the CCI, as the consumer, writes the mux
with its own power domain and clocks, which include the AHB clock,
enabled.

An alternative is to introduce a dedicated CAM_TOP driver which owns
the clock and power domain, provides the regmap through
of_syscon_register_regmap() and handles runtime PM in its accessors.
This describes the hardware resources more completely and avoids the
debugfs issue, but adds a driver for a block currently used only by
the CCI.

We would like feedback on whether using a plain syscon with power and
clock management left to its consumer is acceptable, or whether CAM_TOP
should instead have a dedicated binding and driver.

---
Wenmeng Liu (3):
      dt-bindings: mfd: syscon: Add Qualcomm Nord Titan CAM_TOP
      dt-bindings: i2c: qcom-cci: Document Nord compatible
      i2c: qcom-cci: Support the CCU output mux

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 +
 drivers/i2c/busses/Kconfig                         |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c                  | 42 ++++++++++++++++++++++
 4 files changed, 85 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-ccu-99785a56dcd0

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

