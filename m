Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341268;
	b=lsaj/okYyKCTIdi8WuJyvGENhgCkLFKWgPc7bYQSD1fBboKO/ymEeOr5z5N/KFEPqtiH
	 9k3pLbqTSHLhI+s4pDPADQ+/HmIw1C+X9ALot016HruhTeh17jBNPdehBjxtlKixxk5Iz
	 rbeUPWmWixPOwXh3tdzfc8a8150OPElt463zMLAxZ+IRkqYrSn0BBFOmad7D22bZYTEgV
	 +Px4IailVMGZDOtAqbC+kTOfHayYG+zAUN7qR6DBOWtUUe+s3ZqWjussSN5U40shpBCoo
	 6YNgvsdXXvqcw7Iz1Y+17N9jFYyhdRjvlBeEJhIT4p95EhjUEhYek0CHFto2kSroxng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
	b=TutrQ3jsgf88ewLwOqcgrA2FOaRUL5CJwz49+sWoKiCHFT0T6BUlAreH4REoXWr9lwTD
	 PXa6iYorvlC9/bgLLuaJP8Fym4Tfyr6CrYlomyRBES0viTmuHph0pGYYA62XDZW2ERuwc
	 v6AUvCCTENJqI+m+FAuYVrEh4CRxDAjW0rwyvs2FqJrNLArM4HIsQ7Votxl0iyZb3cF64
	 /YDcG0pSevqnSAmO9pQWYlNxr4O6nQQ1yFxUPdcL89a99wCbsZ6SRxsKuS4AGOnx64VTV
	 ecGkL8GL1XI0KYVhCkhEQF9nyNQTtMpTLnWHr87LsdC7CTFXHngVI7WUHfoBC4woE+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O3YhYz7C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E3606A31C
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJwbNfE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O3YhYz7C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4VG2286934
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2jPH5IEEnZfHp4FyLuqzT4
	LyHDZSoEvCM0gwfPSo7F8=; b=hJwbNfE4B0B72oAOUG6oyM61n++VLVW3g0Qp4A
	efHXAzMBrqyzJb9Ob/thuaxdVqZTvDGp/inImzHf+PBAubupkCjLz9JrELnF6xT8
	0CvlMEsl+rMrvUhz7TTvzvUBst8fSEGQtKokv2kiGgeuE/79JyjR/+2ptBx2xaZO
	PNedvc3YVuC9nTbbPY3RquQ7oMhMmKBWO7uSq4Vx4T0+wyv6r0/ekAUxSxa9Q4ig
	+0kgr9kIrYtRC4oO/hS7wiUkdgcSdQU9dOpQIOHdqHYnm6vtFCKWUIze8WZpY5jz
	BX32Nyy/G7QbYEzPIfVmLsl5zp4pHs+Y2tlgZIYuOVpGg78w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so426844b3a.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341266; x=1793946066; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=O3YhYz7Cv0UFA3ihYC3aagHS3m+OxnmQyYsFd7D/Mb5Nb3pPDsi3eQkLM233+awC03
         wrXR1IODI4NX21GLHuN/xKOUqowHMH2zuMEPTwztGgDZ3vv+cKgtBoc71koKpazqd/fc
         hv6YXOoR2c8biuI7SCnNOOIDHBexl2R27HZ2kIpcLCsS88JjJ6AiFyyZnzI3p7RSQj8l
         IzojiA5q1zNQuiilBr5OC5SelYWqiSLTXaPL637zCzxYrw15Q3oju3mSwIdgceeBBC3H
         ZBTPMFji9snJ9xJSZs3Ii9O+enL5qpwI5FazsBQzcad7wnKAUn67Han8YB8cyiSI12lY
         vWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341266; x=1793946066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2jPH5IEEnZfHp4FyLuqzT4LyHDZSoEvCM0gwfPSo7F8=;
        b=UXfrdCEX3NF+MbE/D88+5AxiBnuCqgIhwHEdg+ulT3zq+N1Op9ojlYWPy+ZW/ko7kY
         xSZEwyetmmsgkhE7hgRuIKHFt3JAoh3DNW/re3SpQTqEJKU1peKFZinrSGRgSN88XEfK
         aBrqboOV58Tsq589mgH0MxIrNZpQy7c1y76mu+lMsIAA0vegPBaAwQ/7NCXsZLX33pfz
         VF/3KTDq9ccUYOn2Fu/GC4lS5xNxkNsBxzkzrYuRH4FZRtP4pzN8IJ5om3uMooKUrBZS
         QGv+M9auGX8K3+Blkw5YgDddPZ6PF0sUXHLgmon4z06A1G9uD4T+4mN0CvmhQLVcE5Dg
         /asA==
X-Forwarded-Encrypted: i=1; AKwUvBwEe11fPZSu174ti+bhD7xS2TsjIW7uxeuffC8Mh2cT+tcGoGtk6L8eVwavVr5UZZcYQj4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKeDTO1wkgCk8VR4Qn8hT4LzC18XDPv4jGU3UgD3XPFlyj6e2D3
	rFgI7RkCn1gnYmvpromS5gOOCUNwuJqD7ljE0Iu38MnzFiWYqjdamw/h2Fm/aq/5xLgaO+DrXfa
	kBegW/ijLWnNj6NOJ93BLr7lFHuWm27Z+zduL6LQW/kCP74AC7j2Bb58=
X-Gm-Gg: AYBFou31vsFciR3VeOYBFu5h6AXAjUYH2/qVInlpdNFz9Qudcqw+2synwNtTWU0xERa
	ofQkfvsRO8Q35f7GLnX4PPkwADSCcA79iBVkJ7k5j6l9N8ZdWsNOpovpPS3aiwh1na7oMPGIcAH
	MCQnnpVxzgBvsFBKJ2F8zdEo6dB5mwuRTZa7oy0PcaPoiNglj3zCrOBuvKdv271Bd7DQgr5Ibe+
	ZwZFhjIv+VVxEOSQLAV4O8FWQf+NHanGUcRGBrblzczGfd97nxGxuJ5JY1VzirH4TCDuoc4G9fC
	v5rMoLI0ZUGjUXO8Uk2u9HfHtUWQ4TbqnImoiMaO7ReR8PWLiSpGUR+fZDq589wGr4i2moiN1Dc
	18KleSKNFd8yFMedEW0PGSLwmNo9ee2sgo/TCVpZjLH1dELUtf0T7Y4y/W/jnGyWAWkk=
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373566637.20.1793341266270;
        Thu, 29 Oct 2026 23:21:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6190:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3e928df4b08mr1373539637.20.1793341265757;
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 30 Oct 2026 11:50:48 +0530
Message-Id: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEA35GoC/22NXw+CIBRHv0rjORxc/IM99T1acwqYtBQDZTXnd
 w9s9eTL3c72u+csyCmrlUOnw4Ks8tppMwRgxwMSXT3cFNYyMAICOSlphseeE0oqDaJy8zgaO2F
 GckiBsgIEQ+FxtKrVr016uX7Zzc1diSma4qLTbjL2vVU9jbtfgO8FPMUES8WYLHhby1KejXPJc
 64fwvR9Eg6KHQ9/EyU03TVBMDWszCQ0rM1zvmNa1/UDu3uswhcBAAA=
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=3226;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3NpmJ00rnG8DyBULcr5JZZHRbARR1VK7xLOxGL+7IFA=;
 b=/vJGQOS5qpLtuieD0HdMKPT5yZCZYaakmgVb/mxMetHXtqSQInFlAwSct2xAEuf++Cl+6XLKP
 Sikm8WVVrv3B5IynI3PwMLOI/0dI2fR+vsdoAno4MVqoAFyk46bQP4B
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: eOVKyoR9GWsjoqRwJUsOUvFhOtkGd9-y
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae43752 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jA20YhC1vE42qShcUG8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXyq3bAl1mXGx8
 qFnZypPzDfLybxaosIRJ2T9hI4POjhjNKbhZMts5lx2nH1NCA3ZDdWStvzF5cmr/LIdOPcSwX0v
 9sI4ek8l8t6NeLZutVV4eeueqcOWTNsibCPP8qHeOx8cSWuKoDRZA3cInTAbbKg8XIw3SepdrUs
 ioRerFcYz8gjtzHEcF1zy+xiAWVp6g6FP9pmiHlG409JLsFmfIDVnJDtPjEn3OEqPeBg3GkKz2e
 KHhZohLhlS2QDiToYVPNQsscCl8ysqFPw8Ur0oXclvQdsyRZ+XpYBVDGc0MD6d1HtF1QWYBLrLw
 iGkcC2ay9WMAFXqH1ZCyZZsVV03yojVTIGMef1ca8a6x7GVek4cMJs1TdcVC+QR2YE7XfAmmQeF
 wBFqZl/ZxnD8j0wVXxTrMoN2NBG3ZeiQ+TWtj1AID22gKS+27tFWP6yFtmTowp9CHu+GLfLZBwz
 d5W6DXNdIB9ep6tK0ww==
X-Proofpoint-ORIG-GUID: eOVKyoR9GWsjoqRwJUsOUvFhOtkGd9-y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXwAZdQmhIjwbs
 x1sFYWqfUAdUJJbItbXS0OzvakLzE93fjgi0UqbeXc2z49HkMKNUM+VA5K4wIkWLOMZBL4VsNBw
 idA5syAaneZIY4M9NcFuFLpgo6W81Zg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

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
 drivers/mfd/qcom-pm8008.c                          | 172 ++++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 183 ++++++++++++++++++---
 3 files changed, 295 insertions(+), 70 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

