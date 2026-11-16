Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809625;
	b=HzK0dQczLn96EvYz9aAzCPDJ0BrbNtsu4admK3YDTtgWixSaq5QOYhl+IseojhhhQJkk
	 M+LSsXuwDzt/XQh7zWKMcoVb6Ru5KJPSRAPXVreaKswP4RteXKCQD54LXT9pFhitbxbVH
	 dL6BrghnA2FWqJBT3WdmyIjagQJMKUvrB2tKdYjOa70G0A8ROXQd5YEKSaSLrg3RTII5W
	 uFRDRLQxjHuY/blE9cW2US7iuJAAFPDJOka527kUcvjCsy2xHKnY/Qb5CzvvGSOvgcoN0
	 J78E8C/W5/lPNMnK52f/yeCmhORATML2jnmk6HL7CrLlj3IhdIBniOYrR1OStquXwxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dvXYhGU+OPm04f0C9Fzy94v698g4UgwUImPcAmiDNUo=;
	b=TH44t7QGMOxElDTHcnU+rH1fjaioLI8t64cVAxZ7hfmo3ekE+EPrOD41UXWrJVGf7hRD
	 oIF+8uzDvpicRtV8QK5MQ5VMf2ZrO3GmDkKp8mF2yffAbc9YECmp16iHO4mKjlKhyUJ8b
	 cegdmAHqrNiC+tR1kDgxFTcuWRtuO16iVqYuHj3voU1FxFs7VfwXwQNezqMpMtNpRVE8R
	 ZIYlotiUk80p4P4+jIvRDDF+uQZLwoxGybWvsqIt2reBik8ozb/jJ4RIwAy3Lscd/b2aT
	 VukkevsXrgwxwXQu/7mW+Ujl6wZI5LBv5fMXA9orF1vkXUF9VAoir+sgcKbPMf+V6Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kqH/WW+x";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDWJIuLm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F2606A31C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kqH/WW+x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDWJIuLm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LA4i795932
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dvXYhGU+OPm04f0C9Fzy94
	v698g4UgwUImPcAmiDNUo=; b=kqH/WW+xxO/R7u7Bf5fzmb+5NN0n9n4oV8gjJq
	bkt2jyDb5p4O7pBIvzw2m2DRqk7FOt9CGe3/dsff78YO4BhUSYStS5J5LrxRz/P+
	z7p082ntfWPMxCR+Hn/btDyZXIsNcEULdx73UYC/HTn1OOIsE9bWEmAvactL8GWD
	pEehbDGRbcDVHMUE8CD6UrstT36j5aHZQ9XrP4uKbFGE24x2eIu0lFsprz0ts49L
	DnDXxDLJcQhTHq6Q7A9vuxAiRzoOL6wg5voXrfFCvzjyBWN6LrQjFvqikqrZ48V7
	kVPSWtWb2RedQB0DvWAbFKuA0B/z1nU2ogquwd8HGjtqfODg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc0rte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:13:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so2822569a91.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809623; x=1795414423; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dvXYhGU+OPm04f0C9Fzy94v698g4UgwUImPcAmiDNUo=;
        b=PDWJIuLm8Y1T/4uK9QkrJTvp+ygLergEly/GiqaRZO8Rc12/3DXGZWyKhUU0XVvZnK
         yTlmecArW7odfoj1H4qT1FmikStTBSRejSAAmoZXRZJy5ICCRj0LnNJZqutQjPeO0UKY
         nFdZTdiHSvd6XtXVtcxy8+aTnpChOW16pvLowkg4gnBlBhxOfeUmKQpLc2W9RcH4PGKD
         MWQntPFe7NOM61ulfNbhSt0XhJsF4DSnqDvHunbAyBa9IUqTUXluvzOg4z/vqwIQAsK3
         kP8ollbDMCi6hNGJtSb1n1fUCRcdJK5Rrrv85TzzPR+QO8JGxAiqMQdmv0bLExOgoc1+
         cDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809623; x=1795414423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dvXYhGU+OPm04f0C9Fzy94v698g4UgwUImPcAmiDNUo=;
        b=2Yjsh4wDm/Y11P0WLWGRJTCBQ/Nqt3TEcVIS0ATLy0gepAqwPfiYP3Sh4yRlqh4qAF
         AKhC7Xw3BfmG3w6/Ssr96fuWPYvorO6JRA5QF3hponMAn/56HXI189a8dIKTcnAy7Fof
         HlAuDeAgw1e1y7Do9PXQsAGo1nDC2xb2RB/TFBzFFXlvnxc/07YfR78r8D8Z/hTWpjye
         RLRYaO6F8TYFLPgbqxeXEn0ZhjLF6XGbaEn21deGCuvPrJgaQ/4zJVHc1EEsCPu6fSpg
         tJnVDaHOpyWJOR/9cELVazH8IM5c0iJy3KfV12h1fretKb4A1DB/eu8hT6GjM38DzAE6
         yrKg==
X-Forwarded-Encrypted: i=1; AL+hErHHjoqaqgtKVjS0Ip+6Gn+XoJsYISYIU3WVlbfwxfjiFy2ODQdtpDJq+L6c9ELWk7kH2zY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+IBX7wlIJTof1bq9NHQ6PJTe7Vz5ocmSNhe0pkpsJyDa7YViyR
	/IgxY69kYbyNH16au4oORqvJEOurOnKkYgmsZLBcHqfFcAm4pSfRB5dMH3QYCcjDobQ+b4FlGrn
	XSW20sbVOAv5oW+TU7TUJ1z95pP0QD3E2tzxX5Zlc3lmja9hTOqvV0cY=
X-Gm-Gg: AZFdTZdfBCxTTtXh7YapeNhc/WTADCG3B3K2bEMHrsACOYv0kq1FYJO83OCmiUduSWc
	ydRH5jBkgC68+Sj5Di0UbSWkfTVV/Nt8z+9EQOdpilN6geBuVksSHvBH60A4XwsHdQFQIKHbH+/
	ZdDic+KRyicKyUoJ27MORjlive+Zy0cjut3jklqmgyAbZ0VRnszGwSnGFtoqutejGzIuSoCUill
	iJyeW8ACBin7wh7KEVgxaeADCz9TCoM2Q8uQfZDAEtK6DJ+fWxth7xw5BHRroGsPpVZNFGVQZlX
	T6iGohwW0hkltesrDYWWxFj6ck96hPkpcwMCzkIntCJNJSkhhiyhcULKsDx4dTAtaE58wEfRxQ6
	cL+Tal5e9ya8YXSpytWzZWQTvWgnlx8hwgjrY7Da9AFXsPs2gNF8t+W7vVL2mUxLhlmRm
X-Received: by 2002:a17:90a:e18c:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3b1b0ba4fe5mr9439403a91.67.1794809623098;
        Sun, 15 Nov 2026 22:13:43 -0800 (PST)
X-Received: by 2002:a17:90a:e18c:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3b1b0ba4fe5mr9439388a91.67.1794809622580;
        Sun, 15 Nov 2026 22:13:42 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:13:42 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v5 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Mon, 16 Nov 2026 11:43:18 +0530
Message-Id: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP6e+moC/3XNTW7DIBAF4KtErEsEM2BDVr1HFEUYcENVBxdsq
 1Xkuxen6s+CzGKkJ81870ayT8FnctjdSPJLyCFeS5BPO2Iv5vriaXAlE2DQMM0lHQfFODsHsOc
 8j2NME0XWgACOLVgk5XFMvg8fd/R4+s557l69nTZpu7iEPMX0eW9d+Hb3U6BqBQunjDqP6FrVG
 6fdc8x5/z6bNxuHYV8W2XoW+JU446IqQZE61NJBh33TqAcS/pOQVSUsktbSO+5ta1p4IIk/qUx
 VEkUSUmhrOm6VFxVpXdcvLZ6mhqsBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=4082;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=5kWu2YkKcUjBdEWQ5DyoW+5pfCugXFIDu2iOFb/DKyc=;
 b=okpCvKMrGPzzavDpAh2QA7R/yR8uU9jNz/7shTSpW0xia4OQ9Pg3li05id3roP26zB4AbNmZz
 bCufvPcgETWABaoMq4kPLYWKJ/RUIEY4PcMhYIrqyeFw3nF2CODQ5iY
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXxDTvozoO1huD
 1Ek/a2xtzCPiRMLUPWhV2Qd/S0WwwXpOGeqamJE/GFPfem9Ad0DdITSw+Y7CoZqAd1S4++hwgYz
 2+aY2tdFafnOwmSflp0FMYGRxoAxT/g=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afa9f17 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LEnkABef-FZfy3Pz5UsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: yhDTvdnLkj3mbPTmDHOnLGdsD6hFb_E3
X-Proofpoint-GUID: yhDTvdnLkj3mbPTmDHOnLGdsD6hFb_E3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXwAPHb9zsrFQI
 zlTTIXbmrvibmd7XXL3gFj2sgKolMuh1EpPNGKxVt5juOmJ0IV9pLKIS/y72ORL5kaT7/ljkEfV
 VIb4CA0MJUftf+B6GURJ7peHeKNCMALPkyMznCpED/JXufhtUCPEY1ik95+8146Je6qdmTujkPi
 fMQObyjVLLF0u99V+TWDGUvNiSC1LOPCaq54/FKlmVeFxHZgT2eW+EgxwKjKyPTbIIUGpDWiWr4
 pilSvPmm+kO5mTOM4wldHtFg4ysZqI/1WRWvFn5C/yys/DjPz/KrxjK4npiMxGSbql4FdM8sYYA
 qJq4kWrSXAaTcHKT5MQTXd1fmkznYHrh+9vseF6bbHLY1h0uODC+EIseOY+FUSOELlphYEEMAJ+
 FD+OjYP2SBu/yiO5TtYlwHES9xjh4+N3gN96qZan5LnXO47gR3oajcyIDrHJoRE0I7rDMYP0mXP
 sBEzb20MPlafZXrzLfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160024

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
Changes in v5:
- Corrected value of HPM threshold load currents for L1/L2 of PM8010.
- Link to v4: https://patch.msgid.link/20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com

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

