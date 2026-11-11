Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416614;
	b=0nOoynGlrVpe5i2JiHb2BcHcDswPoZmKYuk5EYh+B8J++OFAq/UNmOM0RuKoJbh5XrFJ
	 XBlIJQolWSuuPB9qd90uFQGkRh6wsI0R/xKFrYcru8mXCMwy9wmI7Bi/EMxk3uD2Amjak
	 ZbQvMpzSIpiOjVNWYC8XDRCCMKUgOHFAZc/1rd9VVrN1ywDgATrJjS2gp3GmN4Mtz+tFM
	 4g5fEJLvpibcmqx2xGVbbM1fjoBT+tyG4aBdJTzShPlJ35XMOeS/NNevCPK2KPrsCBgdr
	 c81bNkqoz6ceUsSZdPScKJA3BICGhsk2seCjTdp+EWsZDIJeKGvUswDgUt4SRkr1dsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fmPwHM5qAyvsKFmirwPXsLdgwoIXSKA0vkqEbsSBbRU=;
	b=2OabHQ03/cGfjEo9yFVuQ63YmVZnknPWINRN6TWuSx1HJ6OOM9HUDRmhjiE/6pK7lpJv
	 juN9mVYVe8RtkE/f6zzjvQnfNwO1TYZA6YobZi6ePU9HcqfDC6LEWReqqeRzQHsmQRKYI
	 sM3V4U8vKGV2g+YECSScq68zk114/obBMaa2RdJj3yGFkEdx7L/MISgZUTRrtNQc0kpBz
	 fHZh24zx6Q8+xqnZopgw0ngg7skXrajbELvr+6+FzBKngBK6AdIh9qyubkaYdseeMyaGD
	 nvGFSg+gnZIsN+Wselxz98K7C6ZU5zHm6zyZrnNZQXHg7HSW1KJqJymLu3bVMTD0FQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5EIwWlJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DoVZ57Tg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB0606A32D
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DCB0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5EIwWlJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DoVZ57Tg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Jda3289946
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fmPwHM5qAyvsKFmirwPXsL
	dgwoIXSKA0vkqEbsSBbRU=; b=d5EIwWlJ02F9EWnGBK7njB6AabStV/w9yaZ/4j
	e9H/KNzBiPdodk/QGTMo2poLKRQGQ4ze1fOvLiMmUBhGxTlXrK9sNYamUU8whqkQ
	64wKjZyGcNK84sBt9oOw/Q55Idv+VJIBIYF149pR9FLXGOtQY4ToD4rNgvFL+SMy
	x596yCqE4q0kxLr5DHW9SQlkelhWOjzeop/+n1+TPV/wuoJ1qgglA88P6/dj/HRq
	gB9S49UQkPVMAuGkHKsrjP5FD8+LBqlRY+CLV2O/rzI1KETnatQlJKSvhPrLRjdt
	ClbfJhBLjRq9sSVge4gxrL0v/SM6jDQHKKtoi00vrD5M98hg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt150sku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so4182513a91.3
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416611; x=1795021411; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fmPwHM5qAyvsKFmirwPXsLdgwoIXSKA0vkqEbsSBbRU=;
        b=DoVZ57Tg+MlxLhcbDbkY6MkremTCjBjX+s2y1BimxjxoPC6eqJev9kNQIAwqySpaSY
         83W4AN/J2cYNEXz4417cGiZBYhdSkehyn2z9bEwt6pq4mJXoXVq/gvh4vWyzAoFlhNtK
         orYwiQYKkTBAAEoI5c5NB2Y+uojVeY2G3ZhsmB3iQhLTgIu5aN8VmIXjsEf9ievexbX8
         duqOz5f/1BPmkkMEKTOGoIQ3J40oycK9FLnWLOFQ5U5t5N8ghODTnvAV93O+ozJRrzzM
         G7UuietJ5OhDKYjzUWC356SCXlfX71tSKKtg+yY1wBViQDIzRSwLzPI+75X/XOzBuQr1
         j4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416611; x=1795021411;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fmPwHM5qAyvsKFmirwPXsLdgwoIXSKA0vkqEbsSBbRU=;
        b=D70OLOZdojDJ56DKdti6Cdo2BBnJjLN0jykqHJgygW20y1THcxRim4amxcOqEdwCVT
         aplLWB6nLuRaUdj+dplOsEBOjCqiw8aH8RC6hYPrkzG86omR1GpIjt4u1mcqG2aO40uo
         xoHSBD4+MNpvHuhcMV9qNylHCUk9Luq/jmK9KDhNsqQKTPk66QacLZC1bo/rwANKR5Fu
         JInx2/+vytoyzw36kIDtNyXxiMCt020XI+RmJMxwKzgPR7h/jNtBbnleF3q4kH1dGCrw
         AYxU3nCvTz/erKaQykyjMavIZH/p952LW6V9/Aoyf7QALMgB0J49kdnrtxt3iKkUAk2q
         hDyQ==
X-Forwarded-Encrypted: i=1; AL+hErGZfGk4pGhtX2vcMBuQ6e7Volb7pYNgqAJivCvFTeltgScj8N8ybDIoY5tLLjK4aFEY8Eo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9sJroSkl53Msskc9v8JUcwRK/lGWj41Mv4Z4/3MzBCuwk2mSvP
	yXjlZJ4y2Oj0ZmcgZDRSPzxe+bPmJOxL4ha8rOdFN6yATkYQ/P9enX4VJt7be+1Xv+R7BqeYQV4
	nN5eU0kHxu7IRNcIqasBAOK8EdkDwxlM5ehyXt2v/g/GmSKBilxRIL44=
X-Gm-Gg: AYBFou2MXu3ztRBw9KrqgUkPJNmVdN0I1PNufGLkzqNg4yg/IU76ZFUrqUDKVpE/muZ
	lrMxGgoolthySBv2wHaGPimUCb3QsMzMv6hh051UqUGRaamFOHq+b/q9zmb5+CiFqDfjM2+h7mI
	HRafQaaqS+C5N4Nv/4u3bwS4d+5RnLV9VeEEHSr7Vb47e0fETcGsvQ/fa7yuMwCfJ1z56pQCnc7
	Hk0lSyEKv8nuR3J+mwFrDoElVFGq547sSOPHJ9Zvyd5ToBwbQhuaAdoNafDY0HZu1M2nWBJFfJ+
	LUurLdleMAPdLPoFT+j9ZfjRUWB04RkDZ+WIPgOKPqI8VpQTRz29pC0i1CdpgAx3xRREkBOo3k3
	t+FVWUTwCfN3WkkM3Po4izR1/D0avxRi5MhAX7EmJAAFcGFAma46TKKPmfi0fDRIoTL8=
X-Received: by 2002:a17:90b:1e51:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b182edad1fmr3092745a91.30.1794416610866;
        Wed, 11 Nov 2026 09:03:30 -0800 (PST)
X-Received: by 2002:a17:90b:1e51:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b182edad1fmr3092705a91.30.1794416610286;
        Wed, 11 Nov 2026 09:03:30 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:29 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Wed, 11 Nov 2026 22:32:49 +0530
Message-Id: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALmf9GoC/3XNTQrCMBAF4KtI1kaSmf7FlfcQkTaZasSamrRFk
 d7dVFFc1M3Agzffe7BA3lJg68WDeRpssO4SQ7JcMH0sLwfi1sTMQEAmlEx52xRCir0FvQ992zr
 fcRQZJCAxB40sPraeant7odvdO4e+OpHuJmlqHG3onL+/Vgc59T4DxdzAILnghhBNXtSlUWbjQ
 lhd+/KsXdOs4mHTzgBfSQqZzEoQpQpVaqDCOsuKPxL+SChmJYySUikZSTovc5iRxnF8AnwIeW5
 hAQAA
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=3890;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3xeaN8oATWMNF4a6QsBJagxJK8NVJRJuUQm9rWHV+Tk=;
 b=xoobmoWvPQuCBG9rsJpXAjHHfTUMY4r53+rJGNOIFxBbEJVY4eSyXK4W2T51BwYWd17w7h9cn
 l4wRfpbzAjbDEarNoff4U4to9YyObpEQ63eeNbrqopLkrusNWhgj89g
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX/PhToWsTlqG8
 MYWhJTsrtxDg5n9cSqxqJDQDyGdCmxyIK8PonSIlPq0eWN3NS/Z+5TsXKrLYh78bHNhf7YBHDBR
 5dV3XlM+nQ4EziNtHjKfdLXgJ2gDEjo=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af49fe4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LEnkABef-FZfy3Pz5UsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: K-HtPqWo7ce6anqtX0tC0CRjzeGEuE78
X-Proofpoint-ORIG-GUID: K-HtPqWo7ce6anqtX0tC0CRjzeGEuE78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX6aUt35znuaDT
 Hj7pR0afx1ONXb11VeSqJ5uOvcTxlbPQCFh3vRKDsWJDS37ST7ilqM4XZuJb9Yca8Hbwpod0mNK
 ZavI6XuP4Eb7YdZ45++HjhZyB7JpBH3GAUq0W3BKm1HeBX8qvj38RPUyYpOvgdzWw+5/NuGmZM+
 ThLsg1kIWhYzQhFQPPw3lz9/TTd6JiTpCAopPKm6y8H+T9lqTzYABnlm4Al3hwYl1SHqWNdoJg1
 ZtqaoQa4nlCJ2rkFlr1b7p0Yi2i6yOGhNn8fJhW88KT9+u9GxB1IVAjI6f8uCvW8MMG3IU6HaJB
 SBvx9ujhuniy59t5V1ABQb0fep16jveQWtx5nZckjS4Djhsy8dP8Qf/wiUlh3F8AsHN03JvKlUT
 /1k4RRelKDKt4T+vjo63/2tUs0XdiIvWSqINpbUTj44vf3CUP3VKknsaZnMIjVSE0riUVLgSWXs
 HNwqOMXVZBVJoPhIk6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 drops GPIO support from the MFD driver, as the GPIOs have fixed
functions and don't need SW configurations

Patch 5 adds PM8010 support in the MFD driver

Patch 6 updates documentation to make interrupt configuration optional

Patch 7 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Made following changes to address Konrad's comment to implement mode voting
  through load currents set by consumers:
  - Specified threshold current values for HPM for LDOs supporting mode setting.
  - Implemented .get_optimum_mode callback in PM8010 regulator ops.
  - Assigned PM8010 regulator ops only for LDOs supporting mode setting
    (L1 and L2 of PM8010 right now).
- Removed ops member from struct pm8008_match_data and in probe, checked
  hpm_min_load_uA in place of removed ops to identify LDOs supporting mode
  voting.
- Link to v3: https://patch.msgid.link/20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com

Changes in v3:
- Updated commit message of mode support patch and added regulator ops in match
  data as suggested by Guru.
- Updated pm8010_regulator_get_mode() to read LDO_MODE_CTL1_REG instead of
  LDO_STATUS1_REG as suggested by Sashiko.
- Added NULL check for of_device_get_match_data() as suggested by Sashiko and
  updated TYPE_PM8008 from 0 to 1 to avoid confusion with this function
  returning 0.
- Link to v2: https://patch.msgid.link/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com

Changes in v2:
- Simplified of_device_is_compatible() call in mode support patch as
  suggested by sashiko.
- Added a change to drop GPIO support in MFD driver as suggested by Konrad.
- Replaced match_data parsing in probe in PM8010 MFD support patch with enum
  identifier and switch() statement as suggested by Lee.
- Moved interrupt configuration from probe into separate function in missing
  interrupt support patch as suggested by Lee.
- Added MFD cells for no-IRQ variants of PM8008/PM8010 and updated probe to
  use them in missing interrupt support patch as suggested by sashiko.
- Collected Rob's Acked-by tags on binding changes and Oleg's Tested-by tags
  on regulator driver changes (not on MFD changes since some significant
  changes are made in them now).
- Link to v1: https://patch.msgid.link/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com

---
Dhruvin Rajpura (1):
      regulator: pm8008: Add mode voting support for PM8010

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 172 ++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 203 ++++++++++++++++++---
 3 files changed, 316 insertions(+), 69 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

