Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA732ED154
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749808; cv=none; b=io1M6jlGPRRGaYTVzXgJrh4LbX1Y8G5XdiMZyj0UuafhF4C3ohvSTPee73/LqP8qYxiHwlZnoRHlEAbKwZLx9U1Ti9bh8fjdKirVJJ63pmse5/6US/Odw8DdCEpYk+rHZWiRzFCRXcINkahS5rlkgkShJimArannjvMCfqXvTzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749808; c=relaxed/simple;
	bh=H6fsZYId41KQpeu0ypkHNClFv6JIG/e+9fOK7DhdSvA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5lpaHD6yNCMIEHButFe2ZKBgR22g2a7qLy/mI+FovNp0vmxMfK1bEHscyJEqCTbst9oVsbK7Gpvhrojj8DyXOpYo8polhBbkO+PfIRtq8/8bMxQWK+4Oqy0Vvq1/yWW9isLxOA+vQhpwWtOILb+AwMjTIYem7JCVCDQ5UrsZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCqrl8Wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBu/t3ao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCqrl8Wn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBu/t3ao"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEQt7k1019884
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oA6mPBcLFH3SC1iZeQ71t0
	LSRYXqkDAN0OfRuXOGK2M=; b=gCqrl8WnlWeTApwrn8UvaGb2scDlmek50jvOtQ
	tmtkcUFRMu5DV8wOPb5CGREe0CLNtkth7AKAjkBONAkeLuOZMbYtb/W8XZ33smgT
	su/Jed6i0W1UvEBhCrkzbF5cTInqpQips5iVodenwkeyt6modgqavZj47/OR87so
	0l15fF434lPYtHdv7r5Oa8WF0KmvSznQUNpMjgVUTWQpaUPldlWRUp9qHOoozrxd
	R4Q87NPOE2J4ywB5GxYqoaRyNQhNWNEA+Ae0KGcs3ufqgnSTvqOPPqPQrRaFOO7T
	ToI6qqfKY8i1SpsNbc6fF8Bo80BB2toz3ocftzIhclJ0C/Xg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs72u0knq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1902382a91.3
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749805; x=1790354605; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oA6mPBcLFH3SC1iZeQ71t0LSRYXqkDAN0OfRuXOGK2M=;
        b=BBu/t3aoCcrUaGIMJeygqlv315lAr0EXNyB3iLUQNidGR/jdJJm+/TI+lyaz1Eys8u
         xX1Ju+GiIviTt0I2/jJnXFpf41pWygOnT/z/JOLYlt8h7Lw4yRiHaApVLPcWmpb5OUdZ
         lpI4kHu7HI+FNNGHigNFKGAYyZN7QKrE0+ITdu/h5E+OqgRrk0Hp8JDvfF8AewRG2RG/
         8vvFu9sQfi+o8Tn+Ie3v5tZ398LC/lIjuAVQeHUC7/toIaycZ6/Uyq7RycQV4JaIyUa5
         w68jtUCRZyiTSnRcgtV82QpaA7/UFctXLzd1f+rqm6EMflgKUhqXzhIEg3G64HkO6h0+
         UsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749805; x=1790354605;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oA6mPBcLFH3SC1iZeQ71t0LSRYXqkDAN0OfRuXOGK2M=;
        b=gPX/XWUfNwpkp/P0doiEQ5Rd4P0h3ZRclc3Xxf//wHbHAvF/t+xSEuGSuUIGPWLwj6
         7A8q4KgbfV37Ymf4c7bab1orGRaktOxuAl8a1RBkF1KaM1hMJEhUJGi5Dp29y1tkPsRk
         kPa841b6twOzfnX75a22PVKxVYFKEiuBHc7p9KK3J/Bqlttv0POTyNWcVsyXK/SO7nqs
         s6msHiNG1oAUvqoSfxnVUZUPbtpxfxR6p1LNXOyXDrTFLSiXjyP8JGlspAzL8yGTKlmG
         gpkjwExcwYcklKNEaGLQ2zbwIwM7Vz0iBGvF+cw9aiYfdtt9uNHeuBhi8QTwyXXdNuMC
         82FA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ+Ve1cy8jfM1MFXDplrF1H5s+zXR9E1qkBwDoqxyZgmFTY8jRD8cAAWlZdSDz7sfsPG4=@lists.linux.dev
X-Gm-Message-State: AFuF++lwd5d3azVNkugx24pJbLD+EFM4jkQuebSLCoEj+sp/2hl+0mfF
	87KjlaLzXKWk+FGjL9lu/HWPnWl9aIGHkOi6oXTgIUfeK0TunBvwW4sJOSjIvo0QOuMLzpUfPcF
	lJog8yyTsxVEKOj7xQUtZj6FMkGf9RLYULfdq3E7rjR9ObJdI7sQWWJ8=
X-Gm-Gg: AYBFou1vIwbo28/DLoUPdvSdkCzpWM0KScb2Z1cQbOohAILCgPb/iY7EVaAyHW2XJBQ
	e48mmfnibt9GBARDW1bbMeyPWOMGU6sxtNgwSyjDSF8afZZKdIxMTpF/LzXFYBiFfOZTmN1kaNC
	mSoZ/N60lG4XTLthC9BOWPT6Wj1hpteaBI3xCQ0vuEFozgHN/GfsJAdL7FKaE6q/PiODFMc8cav
	ZJqjXLvvHOJ0LNaj0EQRpwbrObWo5ZlfPbdAX/aVpGB6zP49Z2SzNA0aUmXMBKYfmvNIR5vII7H
	qA6VL2UhL/y6ArRWQl070NbpnI0UWYKhqH7K8TCaAYnK2DAwdCOuM+2vYJB+aBGDodGNWPQmCAY
	uZAEMAI9iUhYYny7KoQ==
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr71307825ad.9.1789749805267;
        Fri, 18 Sep 2026 09:43:25 -0700 (PDT)
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr71307305ad.9.1789749804649;
        Fri, 18 Sep 2026 09:43:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:24 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/6] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 18 Sep 2026 22:12:44 +0530
Message-Id: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARqrWoC/yXMTQqDMBBA4avIrBuYTNT+XEWKaBzbKVRDRosg3
 r1Rl9/ivRWUo7DCI1sh8k9UxiHBXjLw72Z4sZEuGQipxLstTPje0GIt5GudQxjjZByWlJN1V/I
 OUhgi97Ic0+p5Wuf2w37aT7BtfwIjf8h2AAAA
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
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1613;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=H6fsZYId41KQpeu0ypkHNClFv6JIG/e+9fOK7DhdSvA=;
 b=qKnWaYqEKCCysF3ieQyz7rqHneuV3s7N/zgJRNtZUrOVX0OAm8QMt2iZoZ+5DeMvSI7wQMd1v
 E2dbxY4M1tNAbrWRqW5vVuSIwCccSh59OHswK9t38hVxp2mrO9bCJpc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: 19MGQvpFWsElKM6skqN_r4SYfsT906O1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXybd/8pA1x2s8
 2XnuHD0e8WRyhuHxFf805joiDS6jg1vty+wcXnTiZeb5EaDEqS6wCXr6qrqwzz9xT3xOK5pFLDe
 8HNjRtmsTbeDOuthQ5hDV7EC5cwsMNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX/L0csQKJLVgK
 pOPpNCIUxDOL6+2plyUXoDaKjpmhgOLM7jLzFIoPa6p0i4aLAoTbbZBjNyMEV1ds1FOpxxOOG8W
 4lks7Y+yiv2JEI24CVky8iG0GYKrPZeBlqpLtsvwcLEjGa/yH4jVMNxmb1f7sbUfMJTvYEJtIV5
 k/0WvRUIhITgZVhi0hpHLvr0l3bXL6nxbFjTo663h5pEEj4ZC8sDtFvxlxDF9cmACssz/JBm85R
 KEfA+CLOTisPEVftCAeBw59MRwWPAiXXazIJC34BpfKe7DKYUNKXGEzH6Ez2ICKAgUOdL7UIf8O
 ZuFiBImFUO/873vVtFzhsh3pWpSn3nV3NPS0KbB+7ccAOrtpoE0BDtdf8t5+LDMFzrPNKC0w4l3
 q8eW1U+qazKPVJ7BWZfWPo1ylJlIvSPJQMpRyqAjCW579QYzlfKX56Jc6dkfHGO+ys4ztyvjWfX
 p5iQ399PDDDUX7VfR5Q==
X-Proofpoint-GUID: 19MGQvpFWsElKM6skqN_r4SYfsT906O1
X-Authority-Analysis: v=2.4 cv=DO8acCNb c=1 sm=1 tr=0 ts=6aad6a2e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tWdyBv_7HfDShhJaVkwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 adds PM8010 support in the MFD driver

Patch 5 updates documentation to make interrupt configuration optional

Patch 6 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Dhruvin Rajpura (1):
      regulator: qcom-pm8008: Add PM8010 mode support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 108 +++++++++---
 drivers/regulator/qcom-pm8008-regulator.c          | 184 ++++++++++++++++++---
 3 files changed, 250 insertions(+), 52 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

